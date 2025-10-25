package com.caa.ocms.service;

import com.caa.ocms.model.AssessmentQuestion;
import com.caa.ocms.repository.AssessmentQuestionRepository;
import com.caa.ocms.repository.CourseAssessmentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.Collections;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class AssessmentQuestionService {
    private final AssessmentQuestionRepository questionRepository;
    private final CourseAssessmentRepository assessmentRepository;

    public List<AssessmentQuestion> getQuestionsByAssessment(Long assessmentId) {
        return questionRepository.findByAssessment(assessmentId);
    }

    public List<AssessmentQuestion> getRandomQuestionsByAssessment(Long assessmentId, Integer questionsToPresent) {
        List<AssessmentQuestion> allQuestions = questionRepository.findByAssessment(assessmentId);
        
        if (allQuestions.isEmpty()) {
            return allQuestions;
        }
        
        // If questionsToPresent is null or greater than available questions, return all questions
        if (questionsToPresent == null || questionsToPresent >= allQuestions.size()) {
            return allQuestions;
        }
        
        // Shuffle the questions randomly
        Collections.shuffle(allQuestions, new Random());
        
        // Return only the requested number of questions
        return allQuestions.subList(0, questionsToPresent);
    }

    public ResponseEntity<?> createQuestion(AssessmentQuestion question) {
        if (question.getAssessment() == null || question.getAssessment().getId() == null) {
            return ResponseEntity.badRequest().body("Assessment ID is required");
        }

        Optional<com.caa.ocms.model.CourseAssessment> assessment = assessmentRepository.findById(question.getAssessment().getId());
        if (assessment.isEmpty()) {
            return ResponseEntity.badRequest().body("Assessment not found");
        }

        question.setAssessment(assessment.get());
        AssessmentQuestion saved = questionRepository.save(question);
        return ResponseEntity.ok(saved);
    }

    public ResponseEntity<?> editQuestion(Long questionId, AssessmentQuestion updates) {
        Optional<AssessmentQuestion> existing = questionRepository.findById(questionId);
        if (existing.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        AssessmentQuestion question = existing.get();
        if (updates.getText() != null) question.setText(updates.getText());
        if (updates.getOptionsToPresent() != null) question.setOptionsToPresent(updates.getOptionsToPresent());
        if (updates.getImageDataUrl() != null) question.setImageDataUrl(updates.getImageDataUrl());

        AssessmentQuestion saved = questionRepository.save(question);
        return ResponseEntity.ok(saved);
    }

    public ResponseEntity<String> deleteQuestion(Long questionId) {
        if (!questionRepository.existsById(questionId)) {
            return ResponseEntity.notFound().build();
        }
        questionRepository.deleteById(questionId);
        return ResponseEntity.ok("Question deleted successfully");
    }
}


