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
    public ResponseEntity<?> createBulkOptions(@RequestBody List<QuestionOption> options) {
        for (QuestionOption option : options) {
            optionService.createOption(option);
        }
        return ResponseEntity.ok("Bulk options created successfully");
    }

    @PutMapping("/{optionId}")
    public ResponseEntity<?> editOption(@PathVariable Long optionId, @RequestBody QuestionOption updates) {
        return optionService.editOption(optionId, updates);
    }

    @DeleteMapping("/{optionId}")
    public ResponseEntity<String> deleteOption(@PathVariable Long optionId) {
        return optionService.deleteOption(optionId);
    }
}


