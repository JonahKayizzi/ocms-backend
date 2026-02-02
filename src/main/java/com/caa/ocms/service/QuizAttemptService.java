package com.caa.ocms.service;

import com.caa.ocms.model.*;
import com.caa.ocms.repository.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class QuizAttemptService {
    private final QuizAttemptRepository quizAttemptRepository;
    private final UserQuestionPerformanceRepository performanceRepository;
    private final CourseAssessmentRepository assessmentRepository;
    private final AssessmentQuestionRepository questionRepository;

    public QuizAttemptService(QuizAttemptRepository quizAttemptRepository,
                              UserQuestionPerformanceRepository performanceRepository,
                              CourseAssessmentRepository assessmentRepository,
                              AssessmentQuestionRepository questionRepository) {
        this.quizAttemptRepository = quizAttemptRepository;
        this.performanceRepository = performanceRepository;
        this.assessmentRepository = assessmentRepository;
        this.questionRepository = questionRepository;
    }

    @Transactional
    public Map<String, Object> startAttempt(Long quizId, String participantId) {
        CourseAssessment quiz = assessmentRepository.findById(quizId).orElseThrow();
        int current = quizAttemptRepository.countAttempts(quizId, participantId);
        // Enforce attempts limit when maxRetries > 0
        Integer max = quiz.getMaxRetries();
        if (max != null && max > 0 && current >= max) {
            throw new IllegalStateException("Maximum attempts reached");
        }
        QuizAttempt attempt = new QuizAttempt();
        attempt.setQuiz(quiz);
        attempt.setParticipantId(participantId);
        attempt.setAttemptNumber(current + 1);
        attempt.setStartedAt(Instant.now());
        quizAttemptRepository.save(attempt);

        Map<String, Object> resp = new HashMap<>();
        resp.put("attemptId", attempt.getId());
        resp.put("attemptNumber", attempt.getAttemptNumber());
        resp.put("maxRetries", quiz.getMaxRetries());
        return resp;
    }

    @Transactional
    public void recordAnswer(Long attemptId, Long questionId, Long answerId, String userId, boolean correct, String structuredAnswer) {
        QuizAttempt attempt = quizAttemptRepository.findById(attemptId).orElseThrow();
        AssessmentQuestion question = questionRepository.findById(questionId).orElseThrow();
        // Upsert: update existing answer for this attempt+question (e.g. user moved next then back, or page refresh re-sent)
        UserQuestionPerformance perf = performanceRepository.findByAttempt_IdAndQuestion_Id(attemptId, questionId)
            .orElse(new UserQuestionPerformance());
        perf.setAttempt(attempt);
        perf.setUserId(userId);
        perf.setQuestion(question);
        perf.setAnswerId(answerId);
        perf.setCorrect(correct);
        
        // For structured questions, store the answer text
        if ("structured".equalsIgnoreCase(question.getType()) && structuredAnswer != null) {
            perf.setAnswerText(structuredAnswer);
            // Structured questions don't have a correct answer initially (admin will mark)
            perf.setCorrect(false);
            perf.setMarkAwarded(null);
        } else if (!"structured".equalsIgnoreCase(question.getType())) {
            perf.setAnswerText(null);
        }
        
        performanceRepository.save(perf);
    }

    @Transactional
    public Map<String, Object> finishAttempt(Long attemptId) {
        QuizAttempt attempt = quizAttemptRepository.findById(attemptId).orElseThrow();
        List<UserQuestionPerformance> answers = performanceRepository.findByAttemptId(attemptId);
        int total = answers.size();
        
        // Aggregate scores from ALL questions (both multiple choice and structured)
        // This calculation is done when the quiz is completed initially
        // When admin awards marks for structured questions later, recalculateAttemptScore() is called
        
        double multipleChoiceMarks = 0.0;
        double structuredMarksTotal = 0.0;
        double totalMarksPossible = 0.0;
        
        // Loop through ALL answers to calculate total marks possible and earned marks
        // Both MCQs and structured questions use their allocated marks from the marks field
        for (UserQuestionPerformance perf : answers) {
            AssessmentQuestion question = perf.getQuestion();
            // Default to 1.0 mark if not specified for a question
            Double questionMarks = question.getMarks() != null && question.getMarks() > 0 ? question.getMarks() : 1.0;
            totalMarksPossible += questionMarks;
            
            if ("structured".equalsIgnoreCase(question.getType())) {
                // For structured questions: use mark_awarded if admin has already graded it
                // Otherwise, it will be 0 until admin awards marks (then recalculateAttemptScore is called)
                if (perf.getMarkAwarded() != null) {
                    structuredMarksTotal += perf.getMarkAwarded();
                }
            } else {
                // For multiple choice: award full question marks if correct, 0 if incorrect
                if (perf.isCorrect()) {
                    multipleChoiceMarks += questionMarks;
                }
            }
        }
        
        // Total score = multiple choice marks + structured marks
        double totalScore = multipleChoiceMarks + structuredMarksTotal;
        double percentage = totalMarksPossible > 0 ? (totalScore / totalMarksPossible) * 100 : 0;
        
        // Get pass mark from assessment (default to 70 if not set)
        CourseAssessment assessment = attempt.getQuiz();
        Integer passMark = assessment != null && assessment.getPassMark() != null ? assessment.getPassMark() : 70;
        
        // Save aggregated score and total marks to quiz_attempts table
        attempt.setTotalQuestions(total);
        attempt.setScore(totalScore); // Store score as double to preserve precision
        attempt.setTotalMarks(totalMarksPossible); // Store total marks possible
        attempt.setCompletedAt(Instant.now());
        // Pass rule: use assessment's passMark, default to 70%
        attempt.setPassed(percentage >= passMark);
        quizAttemptRepository.save(attempt);
        
        Map<String, Object> resp = new HashMap<>();
        resp.put("attemptId", attempt.getId());
        resp.put("score", Math.round(totalScore * 100.0) / 100.0); // Return with 2 decimal places
        resp.put("total", attempt.getTotalQuestions());
        resp.put("totalMarks", Math.round(totalMarksPossible * 100.0) / 100.0);
        resp.put("percentage", Math.round(percentage * 100.0) / 100.0);
        resp.put("passed", attempt.isPassed());
        return resp;
    }
    
    @Transactional
    public Map<String, Object> awardMarksForStructuredQuestion(Long attemptId, Long questionId, Double awardedMarks, Double maxMarks) {
        List<UserQuestionPerformance> performances = performanceRepository.findByAttemptId(attemptId);
        UserQuestionPerformance perf = performances.stream()
            .filter(p -> p.getQuestion().getId().equals(questionId))
            .findFirst()
            .orElseThrow(() -> new IllegalArgumentException("Question performance not found for this attempt"));
        
        AssessmentQuestion question = perf.getQuestion();
        if (!"structured".equalsIgnoreCase(question.getType())) {
            throw new IllegalArgumentException("Question is not a structured question");
        }
        
        // Validate that awarded marks don't exceed max marks
        if (maxMarks != null && awardedMarks > maxMarks) {
            throw new IllegalArgumentException("Awarded marks cannot exceed maximum marks");
        }
        
        // Update the question's marks field if maxMarks is provided and different from current
        if (maxMarks != null && (question.getMarks() == null || !question.getMarks().equals(maxMarks))) {
            question.setMarks(maxMarks);
            questionRepository.save(question);
        }
        
        perf.setMarkAwarded(awardedMarks);
        // Update correct flag based on whether marks were awarded (optional logic)
        // For now, we'll consider it "correct" if marks > 0
        perf.setCorrect(awardedMarks > 0);
        performanceRepository.save(perf);
        
        // Recalculate the attempt score after awarding marks (aggregates all questions)
        recalculateAttemptScore(attemptId);
        
        // Return updated attempt data
        QuizAttempt attempt = quizAttemptRepository.findById(attemptId).orElseThrow();
        Map<String, Object> response = new HashMap<>();
        response.put("attemptId", attempt.getId());
        response.put("score", attempt.getScore());
        response.put("totalMarks", attempt.getTotalMarks());
        response.put("totalQuestions", attempt.getTotalQuestions());
        response.put("percentage", attempt.getTotalMarks() != null && attempt.getTotalMarks() > 0 
            ? Math.round((attempt.getScore() / attempt.getTotalMarks()) * 10000.0) / 100.0 
            : 0.0);
        response.put("passed", attempt.isPassed());
        return response;
    }
    
    @Transactional
    private void recalculateAttemptScore(Long attemptId) {
        QuizAttempt attempt = quizAttemptRepository.findById(attemptId).orElseThrow();
        List<UserQuestionPerformance> answers = performanceRepository.findByAttemptId(attemptId);
        
        // Aggregate scores from ALL questions (both multiple choice and structured)
        // Example: 10 multiple choice (1 mark each) + 1 structured (10 marks) = 20 total marks possible
        // User gets: 1 correct multiple choice (1 mark) + 4 marks on structured (4 marks) = 5 total marks
        // Percentage: (5/20) * 100 = 25%
        
        // Both MCQs and structured questions use their allocated marks from the marks field
        double multipleChoiceMarks = 0.0;
        double structuredMarksTotal = 0.0;
        double totalMarksPossible = 0.0;
        
        // Loop through ALL answers to calculate total marks possible and earned marks
        for (UserQuestionPerformance perf : answers) {
            AssessmentQuestion question = perf.getQuestion();
            // Default to 1.0 mark if not specified for a question
            Double questionMarks = question.getMarks() != null && question.getMarks() > 0 ? question.getMarks() : 1.0;
            
            // Add to total marks possible (for all question types)
            totalMarksPossible += questionMarks;
            
            if ("structured".equalsIgnoreCase(question.getType())) {
                // For structured questions: use mark_awarded if admin has graded it
                if (perf.getMarkAwarded() != null) {
                    structuredMarksTotal += perf.getMarkAwarded();
                }
                // If not graded yet, structuredMarksTotal remains 0 (no marks awarded)
            } else {
                // For multiple choice: award full question marks if correct, 0 if incorrect
                if (perf.isCorrect()) {
                    multipleChoiceMarks += questionMarks;
                }
            }
        }
        
        // Total score = multiple choice marks + structured marks
        double totalScore = multipleChoiceMarks + structuredMarksTotal;
        double percentage = totalMarksPossible > 0 ? (totalScore / totalMarksPossible) * 100 : 0;
        
        // Get pass mark from assessment (default to 70 if not set)
        CourseAssessment assessment = attempt.getQuiz();
        Integer passMark = assessment != null && assessment.getPassMark() != null ? assessment.getPassMark() : 70;
        
        // Save aggregated score and total marks to quiz_attempts table
        attempt.setScore(totalScore); // Store score as double to preserve precision
        attempt.setTotalMarks(totalMarksPossible); // Store total marks possible
        // Pass rule: use assessment's passMark, default to 70%
        attempt.setPassed(percentage >= passMark);
        quizAttemptRepository.save(attempt);
    }
    
    /**
     * Recalculate all attempts for an assessment based on current pass mark and correct answers.
     * This is useful when:
     * - Pass mark is updated
     * - Questions are edited (correct answers changed or questions removed)
     * - New attempts have been completed
     */
    @Transactional
    public Map<String, Object> recalculateAssessmentAttempts(Long assessmentId) {
        CourseAssessment assessment = assessmentRepository.findById(assessmentId)
            .orElseThrow(() -> new IllegalArgumentException("Assessment not found: " + assessmentId));
        
        Integer passMark = assessment.getPassMark() != null ? assessment.getPassMark() : 70;
        List<QuizAttempt> attempts = quizAttemptRepository.findByAssessmentIdOrderByCompletedAtDesc(assessmentId);
        
        int recalculatedCount = 0;
        for (QuizAttempt attempt : attempts) {
            // Only recalculate completed attempts
            if (attempt.getCompletedAt() == null) {
                continue;
            }
            
            // Recalculate score and pass/fail status
            recalculateAttemptScore(attempt.getId());
            recalculatedCount++;
        }
        
        Map<String, Object> result = new HashMap<>();
        result.put("assessmentId", assessmentId);
        result.put("assessmentName", assessment.getName());
        result.put("recalculatedAttempts", recalculatedCount);
        result.put("totalAttempts", attempts.size());
        result.put("passMark", passMark);
        
        return result;
    }

    public List<QuizAttempt> getAttemptsByUser(String participantId) {
        return quizAttemptRepository.findByParticipantIdOrderByCompletedAtDesc(participantId);
    }
    
    public Map<String, Object> getAssessmentAnalytics(Long assessmentId) {
        List<QuizAttempt> attempts = quizAttemptRepository.findByAssessmentIdOrderByCompletedAtDesc(assessmentId);
        long totalAttempts = attempts.size();
        long uniqueParticipants = quizAttemptRepository.countUniqueParticipantsByAssessmentId(assessmentId);
        Double averageScore = quizAttemptRepository.getAverageScorePercentageByAssessmentId(assessmentId);
        Double passRate = quizAttemptRepository.getPassRateByAssessmentId(assessmentId);
        
        Map<String, Object> analytics = new HashMap<>();
        analytics.put("totalAttempts", totalAttempts);
        analytics.put("uniqueParticipants", uniqueParticipants);
        analytics.put("averageScore", averageScore != null ? Math.round(averageScore * 100.0) / 100.0 : 0.0);
        analytics.put("passRate", passRate != null ? Math.round(passRate * 100.0) / 100.0 : 0.0);
        
        // Convert attempts to DTOs with user info and duration
        List<Map<String, Object>> attemptDTOs = attempts.stream().map(attempt -> {
            Map<String, Object> dto = new HashMap<>();
            dto.put("id", attempt.getId());
            dto.put("participantId", attempt.getParticipantId());
            dto.put("attemptNumber", attempt.getAttemptNumber());
            dto.put("score", attempt.getScore());
            dto.put("totalQuestions", attempt.getTotalQuestions());
            dto.put("totalMarks", attempt.getTotalMarks());
            // Calculate percentage based on total marks, not total questions
            double calculatedPercentage = 0.0;
            if (attempt.getTotalMarks() != null && attempt.getTotalMarks() > 0) {
                calculatedPercentage = (attempt.getScore() * 100.0 / attempt.getTotalMarks());
            } else if (attempt.getTotalQuestions() > 0) {
                // Fallback to question count if totalMarks is not set (for old attempts)
                calculatedPercentage = (attempt.getScore() * 100.0 / attempt.getTotalQuestions());
            }
            dto.put("percentage", Math.round(calculatedPercentage * 100.0) / 100.0);
            dto.put("passed", attempt.isPassed());
            dto.put("startedAt", attempt.getStartedAt());
            dto.put("completedAt", attempt.getCompletedAt());
            
            // Calculate duration in minutes
            if (attempt.getStartedAt() != null && attempt.getCompletedAt() != null) {
                long durationMinutes = java.time.Duration.between(attempt.getStartedAt(), attempt.getCompletedAt()).toMinutes();
                dto.put("durationMinutes", durationMinutes);
            } else {
                dto.put("durationMinutes", null);
            }
            
            return dto;
        }).toList();
        
        analytics.put("attempts", attemptDTOs);
        return analytics;
    }
    
    public Map<String, Object> getAttemptDetails(Long attemptId) {
        QuizAttempt attempt = quizAttemptRepository.findById(attemptId).orElseThrow();
        List<UserQuestionPerformance> performances = performanceRepository.findByAttemptId(attemptId);
        
        Map<String, Object> details = new HashMap<>();
        details.put("id", attempt.getId());
        details.put("participantId", attempt.getParticipantId());
        details.put("attemptNumber", attempt.getAttemptNumber());
        details.put("score", attempt.getScore());
        details.put("totalQuestions", attempt.getTotalQuestions());
        details.put("totalMarks", attempt.getTotalMarks());
        // Calculate percentage based on total marks, not total questions
        double calculatedPercentage = 0.0;
        if (attempt.getTotalMarks() != null && attempt.getTotalMarks() > 0) {
            calculatedPercentage = (attempt.getScore() * 100.0 / attempt.getTotalMarks());
        } else if (attempt.getTotalQuestions() > 0) {
            // Fallback to question count if totalMarks is not set (for old attempts)
            calculatedPercentage = (attempt.getScore() * 100.0 / attempt.getTotalQuestions());
        }
        details.put("percentage", Math.round(calculatedPercentage * 100.0) / 100.0);
        details.put("passed", attempt.isPassed());
        details.put("startedAt", attempt.getStartedAt());
        details.put("completedAt", attempt.getCompletedAt());
        
        // Calculate duration
        if (attempt.getStartedAt() != null && attempt.getCompletedAt() != null) {
            long durationMinutes = java.time.Duration.between(attempt.getStartedAt(), attempt.getCompletedAt()).toMinutes();
            details.put("durationMinutes", durationMinutes);
        }
        
        // Add question details
        List<Map<String, Object>> questionDetails = performances.stream().map(perf -> {
            Map<String, Object> qDetail = new HashMap<>();
            AssessmentQuestion question = perf.getQuestion();
            qDetail.put("questionId", question.getId());
            qDetail.put("questionText", question.getText());
            qDetail.put("questionType", question.getType());
            qDetail.put("questionMarks", question.getMarks());
            qDetail.put("selectedAnswerId", perf.getAnswerId());
            qDetail.put("correct", perf.isCorrect());
            
            // For structured questions, include answer text and mark awarded
            if ("structured".equalsIgnoreCase(question.getType())) {
                qDetail.put("answerText", perf.getAnswerText());
                qDetail.put("structuredAnswer", perf.getAnswerText()); // Also include as structuredAnswer for frontend compatibility
                qDetail.put("markAwarded", perf.getMarkAwarded());
                qDetail.put("awardedMarks", perf.getMarkAwarded()); // Also include as awardedMarks for frontend compatibility
            }
            // Always include maxMarks (same as questionMarks) for both question types
            qDetail.put("maxMarks", question.getMarks());
            
            // Get question options and identify correct answer (for multiple choice)
            if (question.getOptions() != null && !question.getOptions().isEmpty()) {
                List<Map<String, Object>> options = question.getOptions().stream().map(option -> {
                    Map<String, Object> optionMap = new HashMap<>();
                    optionMap.put("id", option.getId());
                    optionMap.put("text", option.getOptionText());
                    optionMap.put("isCorrect", option.getIsCorrect());
                    return optionMap;
                }).toList();
                qDetail.put("options", options);
                
                // Find the correct answer
                question.getOptions().stream()
                    .filter(option -> Boolean.TRUE.equals(option.getIsCorrect()))
                    .findFirst()
                    .ifPresent(correctOption -> {
                        qDetail.put("correctAnswerId", correctOption.getId());
                        qDetail.put("correctAnswerText", correctOption.getOptionText());
                    });
                
                // Find the selected answer text
                if (perf.getAnswerId() != null) {
                    question.getOptions().stream()
                        .filter(option -> option.getId().equals(perf.getAnswerId()))
                        .findFirst()
                        .ifPresent(selectedOption -> {
                            qDetail.put("selectedAnswerText", selectedOption.getOptionText());
                        });
                }
            }
            
            return qDetail;
        }).toList();
        
        details.put("questionPerformances", questionDetails);
        return details;
    }
}


