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
}


