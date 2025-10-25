package com.caa.ocms.controller;

import com.caa.ocms.model.QuestionOption;
import com.caa.ocms.service.QuestionOptionService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/question-options")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class QuestionOptionController {
    private final QuestionOptionService optionService;

    @GetMapping("/question/{questionId}")
    public ResponseEntity<List<QuestionOption>> getOptionsByQuestion(@PathVariable Long questionId) {
        List<QuestionOption> options = optionService.getOptionsByQuestion(questionId);
        return ResponseEntity.ok(options);
    }

    @PostMapping
    public ResponseEntity<?> createOption(@RequestBody QuestionOption option) {
        return optionService.createOption(option);
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<QuestionOption>> createBulkOptions(@RequestBody List<QuestionOption> options) {
        System.out.println("Creating bulk options, count: " + options.size());
        
        List<QuestionOption> createdOptions = options.stream()
            .map(option -> {
                System.out.println("Creating option: " + option.getOptionText() + " for question: " + option.getQuestion().getId());
                ResponseEntity<?> response = optionService.createOption(option);
                System.out.println("Response status: " + response.getStatusCode() + ", body: " + response.getBody());
                
                if (response.getStatusCode().is2xxSuccessful() && response.getBody() instanceof QuestionOption) {
                    return (QuestionOption) response.getBody();
                }
                return null;
            })
            .filter(option -> option != null)
            .toList();
            
        System.out.println("Successfully created " + createdOptions.size() + " options");
        return ResponseEntity.ok(createdOptions);
    }

    @PutMapping("/{optionId}")
    public ResponseEntity<?> editOption(@PathVariable Long optionId, @RequestBody QuestionOption updates) {
        return optionService.editOption(optionId, updates);
    }

    @DeleteMapping("/{optionId}")
    public ResponseEntity<String> deleteOption(@PathVariable Long optionId) {
        return optionService.deleteOption(optionId);
    }

    @GetMapping("/test-question/{questionId}")
    public ResponseEntity<?> testQuestion(@PathVariable Long questionId) {
        return optionService.testQuestion(questionId);
    }
}


