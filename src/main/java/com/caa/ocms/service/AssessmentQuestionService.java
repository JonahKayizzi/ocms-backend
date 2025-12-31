package com.caa.ocms.service;

import com.caa.ocms.model.AssessmentQuestion;
import com.caa.ocms.repository.AssessmentQuestionRepository;
import com.caa.ocms.repository.CourseAssessmentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Lazy;
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
    @Lazy
    private final CourseAssessmentService assessmentService;

    public List<AssessmentQuestion> getQuestionsByAssessment(Long assessmentId) {
        return questionRepository.findByAssessment(assessmentId);
    }

    public List<AssessmentQuestion> getRandomQuestionsByAssessment(Long assessmentId, Integer questionsToPresent) {
        List<AssessmentQuestion> allQuestions = questionRepository.findByAssessment(assessmentId);
        
        if (allQuestions.isEmpty()) {
            return allQuestions;
        }
        
        // Separate questions by type and mandatory status
        // Mandatory structured questions (always included)
        List<AssessmentQuestion> mandatoryStructured = allQuestions.stream()
            .filter(q -> "structured".equals(q.getType()) && q.getMandatory() != null && q.getMandatory())
            .toList();
        
        // Mandatory objective (multiple choice) questions (always included)
        List<AssessmentQuestion> mandatoryObjective = allQuestions.stream()
            .filter(q -> !"structured".equals(q.getType()) && q.getMandatory() != null && q.getMandatory())
            .toList();
        
        // Optional objective (multiple choice) questions (can be randomly selected)
        List<AssessmentQuestion> optionalObjective = allQuestions.stream()
            .filter(q -> !"structured".equals(q.getType()) && (q.getMandatory() == null || !q.getMandatory()))
            .toList();
        
        // Optional structured questions (if any - though typically all structured should be mandatory)
        List<AssessmentQuestion> optionalStructured = allQuestions.stream()
            .filter(q -> "structured".equals(q.getType()) && (q.getMandatory() == null || !q.getMandatory()))
            .toList();
        
        // If questionsToPresent is null, return all questions
        if (questionsToPresent == null) {
            return allQuestions;
        }
        
        // Always include all mandatory structured questions (these are separate from the objective count)
        List<AssessmentQuestion> selectedQuestions = new java.util.ArrayList<>();
        selectedQuestions.addAll(mandatoryStructured);
        
        // For objective questions: include mandatory ones, then fill up to questionsToPresent from optional
        selectedQuestions.addAll(mandatoryObjective);
        
        // Calculate how many more objective questions we need to reach questionsToPresent
        int remainingObjective = questionsToPresent - mandatoryObjective.size();
        
        if (remainingObjective > 0 && !optionalObjective.isEmpty()) {
            // Shuffle optional objective questions and select the remaining needed
            List<AssessmentQuestion> shuffledOptional = new java.util.ArrayList<>(optionalObjective);
            Collections.shuffle(shuffledOptional, new Random());
            
            // Select up to remaining questions from optional objective
            int toAdd = Math.min(remainingObjective, shuffledOptional.size());
            selectedQuestions.addAll(shuffledOptional.subList(0, toAdd));
        }
        
        // Do NOT include optional structured questions - only mandatory structured should be included
        // Optional structured questions should be marked as mandatory if they need to appear
        
        // Shuffle the final list to randomize order (mandatory questions can appear anywhere)
        Collections.shuffle(selectedQuestions, new Random());
        
        return selectedQuestions;
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
        
        // Ensure marks has a default value if not set or is 0.0
        if (question.getMarks() == null || question.getMarks() <= 0.0) {
            question.setMarks(1.0);
        }
        
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
        if (updates.getType() != null) question.setType(updates.getType());
        if (updates.getMandatory() != null) question.setMandatory(updates.getMandatory());
        if (updates.getMarks() != null) {
            // Ensure marks is at least 0.5 (minimum valid value)
            if (updates.getMarks() <= 0.0) {
                question.setMarks(1.0);
            } else {
                question.setMarks(updates.getMarks());
            }
        }

        AssessmentQuestion saved = questionRepository.save(question);
        
        // Recalculate mandatory structured count for the assessment
        if (question.getAssessment() != null && question.getAssessment().getId() != null) {
            assessmentService.updateMandatoryStructuredCount(question.getAssessment().getId());
        }
        
        return ResponseEntity.ok(saved);
    }

    public ResponseEntity<String> deleteQuestion(Long questionId) {
        Optional<AssessmentQuestion> questionOpt = questionRepository.findById(questionId);
        if (questionOpt.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        
        Long assessmentId = questionOpt.get().getAssessment().getId();
        questionRepository.deleteById(questionId);
        
        // Recalculate mandatory structured count for the assessment
        assessmentService.updateMandatoryStructuredCount(assessmentId);
        
        return ResponseEntity.ok("Question deleted successfully");
    }
}


