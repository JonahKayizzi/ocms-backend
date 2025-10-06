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
        if (option.getQuestion() == null || option.getQuestion().getId() == null) {
            return ResponseEntity.badRequest().body("Question ID is required");
        }

        Optional<com.caa.ocms.model.AssessmentQuestion> question = questionRepository.findById(option.getQuestion().getId());
        if (question.isEmpty()) {
            return ResponseEntity.badRequest().body("Question not found");
        }

        option.setQuestion(question.get());
        QuestionOption saved = optionRepository.save(option);
        return ResponseEntity.ok(saved);
    }

    public ResponseEntity<?> editOption(Long optionId, QuestionOption updates) {
        Optional<QuestionOption> existing = optionRepository.findById(optionId);
        if (existing.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        QuestionOption option = existing.get();
        if (updates.getOptionText() != null) option.setOptionText(updates.getOptionText());

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
}


