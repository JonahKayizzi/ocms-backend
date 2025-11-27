package com.caa.ocms.controller;

import com.caa.ocms.model.QuizAttempt;
import com.caa.ocms.service.QuizAttemptService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/quiz-attempts")
@CrossOrigin(origins = {"http://localhost:3000", "http://localhost:3001"}, allowCredentials = "true")
public class QuizAttemptController {
    private final QuizAttemptService quizAttemptService;

    public QuizAttemptController(QuizAttemptService quizAttemptService) {
        this.quizAttemptService = quizAttemptService;
    }

    @PostMapping("/start")
    public ResponseEntity<Map<String, Object>> start(@RequestBody Map<String, Object> req) {
        Long quizId = Long.valueOf(String.valueOf(req.get("quizId")));
        String participantId = String.valueOf(req.get("participantId"));
        try {
            return ResponseEntity.ok(quizAttemptService.startAttempt(quizId, participantId));
        } catch (IllegalStateException ex) {
            Map<String, Object> body = new HashMap<>();
            body.put("message", ex.getMessage());
            return ResponseEntity.status(403).body(body);
        }
    }

    @PostMapping("/answer")
    public ResponseEntity<?> answer(@RequestBody Map<String, Object> req) {
        Long attemptId = Long.valueOf(String.valueOf(req.get("attemptId")));
        Long questionId = Long.valueOf(String.valueOf(req.get("questionId")));
        Object answerIdRaw = req.get("answerId");
        Long answerId = null;
        if (answerIdRaw != null) {
            String s = String.valueOf(answerIdRaw);
            if (!"null".equalsIgnoreCase(s) && s.trim().length() > 0) {
                answerId = Long.valueOf(s);
            }
        }
        String userId = String.valueOf(req.get("participantId"));
        boolean correct = Boolean.parseBoolean(String.valueOf(req.get("correct")));
        quizAttemptService.recordAnswer(attemptId, questionId, answerId, userId, correct);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/finish")
    public ResponseEntity<Map<String, Object>> finish(@RequestBody Map<String, Object> req) {
        Long attemptId = Long.valueOf(String.valueOf(req.get("attemptId")));
        return ResponseEntity.ok(quizAttemptService.finishAttempt(attemptId));
    }

    @GetMapping("/user/{participantId}")
    public ResponseEntity<List<Map<String, Object>>> byUser(@PathVariable String participantId) {
        List<QuizAttempt> list = quizAttemptService.getAttemptsByUser(participantId);
        List<Map<String, Object>> dto = list.stream().map(a -> {
            Map<String, Object> m = new HashMap<>();
            m.put("id", a.getId());
            Map<String, Object> quiz = new HashMap<>();
            try {
                quiz.put("id", a.getQuiz() != null ? a.getQuiz().getId() : null);
                quiz.put("name", a.getQuiz() != null ? a.getQuiz().getName() : null);
            } catch (Exception ignored) { /* lazy load issues */ }
            m.put("quiz", quiz);
            m.put("attemptNumber", a.getAttemptNumber());
            m.put("score", a.getScore());
            m.put("totalQuestions", a.getTotalQuestions());
            m.put("passed", a.isPassed());
            m.put("completedAt", a.getCompletedAt());
            return m;
        }).toList();
        return ResponseEntity.ok(dto);
    }
    
    @GetMapping("/assessment/{assessmentId}")
    public ResponseEntity<Map<String, Object>> getAssessmentAnalytics(@PathVariable Long assessmentId) {
        try {
            Map<String, Object> analytics = quizAttemptService.getAssessmentAnalytics(assessmentId);
            return ResponseEntity.ok(analytics);
        } catch (Exception e) {
            Map<String, Object> error = new HashMap<>();
            error.put("error", "Failed to fetch assessment analytics");
            error.put("message", e.getMessage());
            return ResponseEntity.status(500).body(error);
        }
    }
    
    @GetMapping("/{attemptId}/details")
    public ResponseEntity<Map<String, Object>> getAttemptDetails(@PathVariable Long attemptId) {
        try {
            Map<String, Object> details = quizAttemptService.getAttemptDetails(attemptId);
            return ResponseEntity.ok(details);
        } catch (Exception e) {
            Map<String, Object> error = new HashMap<>();
            error.put("error", "Failed to fetch attempt details");
            error.put("message", e.getMessage());
            return ResponseEntity.status(500).body(error);
        }
    }
    
    @GetMapping("/{attemptId}")
    public ResponseEntity<Map<String, Object>> getAttemptById(@PathVariable Long attemptId) {
        try {
            Map<String, Object> attempt = quizAttemptService.getAttemptDetails(attemptId);
            return ResponseEntity.ok(attempt);
        } catch (Exception e) {
            Map<String, Object> error = new HashMap<>();
            error.put("error", "Attempt not found");
            error.put("message", e.getMessage());
            return ResponseEntity.status(404).body(error);
        }
    }
}


