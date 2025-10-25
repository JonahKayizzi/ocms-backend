package com.caa.ocms.service;

import com.caa.ocms.model.QuestionOption;
import com.caa.ocms.repository.QuestionOptionRepository;
import com.caa.ocms.repository.AssessmentQuestionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class QuestionOptionService {

    private final QuestionOptionRepository optionRepository;
    private final AssessmentQuestionRepository questionRepository;

    public List<QuestionOption> getOptionsByQuestion(Long questionId) {
        return optionRepository.findByQuestion(questionId);
    }

    public ResponseEntity<?> createOption(QuestionOption option) {
        try {
            System.out.println("Creating option: " + option.getOptionText());

            // Get question ID from either the question relationship or the questionId field
            Long questionId = null;
            if (option.getQuestion() != null && option.getQuestion().getId() != null) {
                questionId = option.getQuestion().getId();
            } else if (option.getQuestionId() != null) {
                questionId = option.getQuestionId();
            }

            System.out.println("Question ID: " + questionId);

            if (questionId == null) {
                System.out.println("Error: Question ID is required");
                return ResponseEntity.badRequest().body("Question ID is required");
            }

            Optional<com.caa.ocms.model.AssessmentQuestion> question = questionRepository.findById(questionId);
            if (question.isEmpty()) {
                System.out.println("Error: Question not found with ID: " + questionId);
                return ResponseEntity.badRequest().body("Question not found");
            }

            System.out.println("Found question: " + question.get().getText());
            option.setQuestion(question.get());
            QuestionOption saved = optionRepository.save(option);
            System.out.println("Saved option with ID: " + saved.getId());
            return ResponseEntity.ok(saved);
        } catch (Exception e) {
            System.err.println("Error creating option: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("Internal server error: " + e.getMessage());
        }
    }

    public ResponseEntity<?> editOption(Long optionId, QuestionOption updates) {
        Optional<QuestionOption> existing = optionRepository.findById(optionId);
        if (existing.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        QuestionOption option = existing.get();
        if (updates.getOptionText() != null) {
            option.setOptionText(updates.getOptionText());
        }
        if (updates.getIsCorrect() != null) {
            option.setIsCorrect(updates.getIsCorrect());
        }

        QuestionOption saved = optionRepository.save(option);
        return ResponseEntity.ok(saved);
    }

    public ResponseEntity<String> deleteOption(Long optionId) {
        if (!optionRepository.existsById(optionId)) {
            return ResponseEntity.notFound().build();
        }
        optionRepository.deleteById(optionId);
        return ResponseEntity.ok("Option deleted successfully");
    }

    public ResponseEntity<?> testQuestion(Long questionId) {
        try {
            System.out.println("Testing question ID: " + questionId);
            Optional<com.caa.ocms.model.AssessmentQuestion> question = questionRepository.findById(questionId);
            if (question.isPresent()) {
                System.out.println("Question found: " + question.get().getText());
                return ResponseEntity.ok("Question exists: " + question.get().getText());
            } else {
                System.out.println("Question not found");
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            System.err.println("Error testing question: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("Error: " + e.getMessage());
        }
    }
}
