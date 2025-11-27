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
    public void recordAnswer(Long attemptId, Long questionId, Long answerId, String userId, boolean correct) {
        QuizAttempt attempt = quizAttemptRepository.findById(attemptId).orElseThrow();
        AssessmentQuestion question = questionRepository.findById(questionId).orElseThrow();
        UserQuestionPerformance perf = new UserQuestionPerformance();
        perf.setAttempt(attempt);
        perf.setUserId(userId);
        perf.setQuestion(question);
        perf.setAnswerId(answerId);
        perf.setCorrect(correct);
        performanceRepository.save(perf);
    }

    @Transactional
    public Map<String, Object> finishAttempt(Long attemptId) {
        QuizAttempt attempt = quizAttemptRepository.findById(attemptId).orElseThrow();
        List<UserQuestionPerformance> answers = performanceRepository.findByAttemptId(attemptId);
        int total = answers.size();
        int score = (int) answers.stream().filter(UserQuestionPerformance::isCorrect).count();
        attempt.setTotalQuestions(total);
        attempt.setScore(score);
        attempt.setCompletedAt(Instant.now());
        // simple pass rule: >= 60%
        attempt.setPassed(total == 0 ? false : (score * 100 / total) >= 60);
        quizAttemptRepository.save(attempt);
        Map<String, Object> resp = new HashMap<>();
        resp.put("attemptId", attempt.getId());
        resp.put("score", attempt.getScore());
        resp.put("total", attempt.getTotalQuestions());
        resp.put("percentage", total == 0 ? 0 : (attempt.getScore() * 100 / total));
        resp.put("passed", attempt.isPassed());
        return resp;
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
            dto.put("percentage", attempt.getTotalQuestions() > 0 ? 
                Math.round((attempt.getScore() * 100.0 / attempt.getTotalQuestions()) * 100.0) / 100.0 : 0.0);
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
        details.put("percentage", attempt.getTotalQuestions() > 0 ? 
            Math.round((attempt.getScore() * 100.0 / attempt.getTotalQuestions()) * 100.0) / 100.0 : 0.0);
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
            qDetail.put("questionId", perf.getQuestion().getId());
            qDetail.put("questionText", perf.getQuestion().getText());
            qDetail.put("selectedAnswerId", perf.getAnswerId());
            qDetail.put("correct", perf.isCorrect());
            
            // Get question options and identify correct answer
            if (perf.getQuestion().getOptions() != null) {
                List<Map<String, Object>> options = perf.getQuestion().getOptions().stream().map(option -> {
                    Map<String, Object> optionMap = new HashMap<>();
                    optionMap.put("id", option.getId());
                    optionMap.put("text", option.getOptionText());
                    optionMap.put("isCorrect", option.getIsCorrect());
                    return optionMap;
                }).toList();
                qDetail.put("options", options);
                
                // Find the correct answer
                perf.getQuestion().getOptions().stream()
                    .filter(option -> Boolean.TRUE.equals(option.getIsCorrect()))
                    .findFirst()
                    .ifPresent(correctOption -> {
                        qDetail.put("correctAnswerId", correctOption.getId());
                        qDetail.put("correctAnswerText", correctOption.getOptionText());
                    });
                
                // Find the selected answer text
                if (perf.getAnswerId() != null) {
                    perf.getQuestion().getOptions().stream()
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


