package com.caa.ocms.service;

import com.caa.ocms.model.CourseAssessment;
import com.caa.ocms.repository.CourseAssessmentRepository;
import com.caa.ocms.repository.CourseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CourseAssessmentService {
    private final CourseAssessmentRepository assessmentRepository;
    private final CourseRepository courseRepository;

    public List<CourseAssessment> getAssessmentsByCourse(Long courseId) {
        return assessmentRepository.findByCourseId(courseId);
    }

    public List<CourseAssessment> getStandaloneAssessments() {
        return assessmentRepository.findStandaloneActive();
    }

    public ResponseEntity<?> createAssessment(CourseAssessment assessment) {
        if (assessment.getCourse() != null && assessment.getCourse().getId() != null) {
            Optional<com.caa.ocms.model.Course> course = courseRepository.findById(assessment.getCourse().getId());
            if (course.isEmpty()) {
                return ResponseEntity.badRequest().body("Course not found");
            }
            assessment.setCourse(course.get());
        } else {
            assessment.setCourse(null); // Standalone assessment
        }
        
        CourseAssessment saved = assessmentRepository.save(assessment);
        return ResponseEntity.ok(saved);
    }

    public ResponseEntity<?> editAssessment(Long assessmentId, CourseAssessment updates) {
        Optional<CourseAssessment> existing = assessmentRepository.findById(assessmentId);
        if (existing.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        CourseAssessment assessment = existing.get();
        if (updates.getName() != null) assessment.setName(updates.getName());
        if (updates.getDescription() != null) assessment.setDescription(updates.getDescription());
        if (updates.getQuestionsToPresent() != null) assessment.setQuestionsToPresent(updates.getQuestionsToPresent());
        if (updates.getQuestionCount() != null) assessment.setQuestionCount(updates.getQuestionCount());
        if (updates.getStatus() != null) assessment.setStatus(updates.getStatus());

        CourseAssessment saved = assessmentRepository.save(assessment);
        return ResponseEntity.ok(saved);
    }

    public ResponseEntity<String> deleteAssessment(Long assessmentId) {
        if (!assessmentRepository.existsById(assessmentId)) {
            return ResponseEntity.notFound().build();
        }
        assessmentRepository.deleteById(assessmentId);
        return ResponseEntity.ok("Assessment deleted successfully");
    }
}


