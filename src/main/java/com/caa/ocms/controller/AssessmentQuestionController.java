package com.caa.ocms.controller;

import com.caa.ocms.model.AssessmentQuestion;
import com.caa.ocms.service.AssessmentQuestionService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/assessment-questions")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class AssessmentQuestionController {
    private final AssessmentQuestionService questionService;

    @GetMapping("/assessment/{assessmentId}")
    public ResponseEntity<List<AssessmentQuestion>> getQuestionsByAssessment(@PathVariable Long assessmentId) {
        List<AssessmentQuestion> questions = questionService.getQuestionsByAssessment(assessmentId);
        return ResponseEntity.ok(questions);
    }

    @PostMapping
    public ResponseEntity<?> createQuestion(@RequestBody AssessmentQuestion question) {
        return questionService.createQuestion(question);
    }

    @PutMapping("/{questionId}")
    public ResponseEntity<?> editQuestion(@PathVariable Long questionId, @RequestBody AssessmentQuestion updates) {
        return questionService.editQuestion(questionId, updates);
    }

    @DeleteMapping("/{questionId}")
    public ResponseEntity<String> deleteQuestion(@PathVariable Long questionId) {
        return questionService.deleteQuestion(questionId);
    }
}


