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
        try {
            System.out.println("Fetching questions for assessment ID: " + assessmentId);
            List<AssessmentQuestion> questions = questionService.getQuestionsByAssessment(assessmentId);
            System.out.println("Found " + questions.size() + " questions");
            return ResponseEntity.ok(questions);
        } catch (Exception e) {
            System.err.println("Error fetching questions: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }
    }

    @GetMapping("/assessment/{assessmentId}/random")
    public ResponseEntity<List<AssessmentQuestion>> getRandomQuestionsByAssessment(
            @PathVariable Long assessmentId,
            @RequestParam(required = false) Integer questionsToPresent) {
        try {
            System.out.println("Fetching random questions for assessment ID: " + assessmentId + 
                             ", questionsToPresent: " + questionsToPresent);
            List<AssessmentQuestion> questions = questionService.getRandomQuestionsByAssessment(assessmentId, questionsToPresent);
            System.out.println("Found " + questions.size() + " random questions");
            return ResponseEntity.ok(questions);
        } catch (Exception e) {
            System.err.println("Error fetching random questions: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }
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


