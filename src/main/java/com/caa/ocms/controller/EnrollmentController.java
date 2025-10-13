package com.caa.ocms.controller;

import com.caa.ocms.model.Enrollment;
import com.caa.ocms.service.EnrollmentService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/enrollments")
public class EnrollmentController {
    private final EnrollmentService enrollmentService;

    public EnrollmentController(EnrollmentService enrollmentService) {
        this.enrollmentService = enrollmentService;
    }

    @PostMapping("/course/{courseId}")
    public ResponseEntity<Enrollment> enroll(@PathVariable Long courseId, @RequestParam String participantId) {
        return ResponseEntity.ok(enrollmentService.enroll(courseId, participantId));
    }

    @GetMapping("/course/{courseId}/count")
    public ResponseEntity<Map<String, Long>> count(@PathVariable Long courseId) {
        long count = enrollmentService.countByCourse(courseId);
        return ResponseEntity.ok(Map.of("count", count));
    }

    @GetMapping("/course/{courseId}/is-enrolled")
    public ResponseEntity<Map<String, Boolean>> isEnrolled(@PathVariable Long courseId, @RequestParam String participantId) {
        boolean enrolled = enrollmentService.findByCourseAndParticipant(courseId, participantId).isPresent();
        return ResponseEntity.ok(Map.of("enrolled", enrolled));
    }
}


