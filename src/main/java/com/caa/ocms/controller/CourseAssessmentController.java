package com.caa.ocms.controller;

import com.caa.ocms.model.CourseAssessment;
import com.caa.ocms.service.CourseAssessmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/assessments")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class CourseAssessmentController {
    private final CourseAssessmentService assessmentService;

    @GetMapping("/course/{courseId}")
    public ResponseEntity<List<CourseAssessment>> getAssessmentsByCourse(@PathVariable Long courseId) {
        List<CourseAssessment> assessments = assessmentService.getAssessmentsByCourse(courseId);
        return ResponseEntity.ok(assessments);
    }

    @GetMapping("/standalone")
    public ResponseEntity<List<CourseAssessment>> getStandaloneAssessments() {
        List<CourseAssessment> assessments = assessmentService.getStandaloneAssessments();
        return ResponseEntity.ok(assessments);
    }

    @GetMapping("/{assessmentId}")
    public ResponseEntity<CourseAssessment> getAssessmentById(@PathVariable Long assessmentId) {
        return assessmentService.getAssessmentById(assessmentId);
    }

    @PostMapping
    public ResponseEntity<?> createAssessment(@RequestBody CourseAssessment assessment) {
        return assessmentService.createAssessment(assessment);
    }

    @PutMapping("/{assessmentId}")
    public ResponseEntity<?> editAssessment(@PathVariable Long assessmentId, @RequestBody CourseAssessment updates) {
        return assessmentService.editAssessment(assessmentId, updates);
    }

    @DeleteMapping("/{assessmentId}")
    public ResponseEntity<String> deleteAssessment(@PathVariable Long assessmentId) {
        return assessmentService.deleteAssessment(assessmentId);
    }
}


