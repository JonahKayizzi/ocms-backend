package com.caa.ocms.service;

import com.caa.ocms.model.CourseAssessment;
import com.caa.ocms.repository.AssessmentQuestionRepository;
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
    private final AssessmentQuestionRepository questionRepository;

    public List<CourseAssessment> getAssessmentsByCourse(Long courseId) {
        List<CourseAssessment> assessments = assessmentRepository.findByCourseId(courseId);
        // Ensure counts are up to date (recalculate if null)
        for (CourseAssessment assessment : assessments) {
            if (assessment.getMandatoryStructuredCount() == null) {
                updateMandatoryStructuredCount(assessment.getId());
                // Refresh from database to get updated count
                assessmentRepository.findById(assessment.getId()).ifPresent(updated -> {
                    assessment.setMandatoryStructuredCount(updated.getMandatoryStructuredCount());
                });
            }
        }
        return assessments;
    }

    public List<CourseAssessment> getStandaloneAssessments() {
        List<CourseAssessment> assessments = assessmentRepository.findStandaloneActive();
        // Ensure counts are up to date (recalculate if null)
        for (CourseAssessment assessment : assessments) {
            if (assessment.getMandatoryStructuredCount() == null) {
                updateMandatoryStructuredCount(assessment.getId());
                // Refresh from database to get updated count
                assessmentRepository.findById(assessment.getId()).ifPresent(updated -> {
                    assessment.setMandatoryStructuredCount(updated.getMandatoryStructuredCount());
                });
            }
        }
        return assessments;
    }
    
    public List<CourseAssessment> getStandaloneAssessmentsByCategory(String category) {
        List<CourseAssessment> assessments;
        if (category == null || category.isEmpty()) {
            assessments = assessmentRepository.findStandaloneActive();
        } else {
            assessments = assessmentRepository.findStandaloneActiveByCategory(category);
        }
        // Ensure counts are up to date (recalculate if null)
        for (CourseAssessment assessment : assessments) {
            if (assessment.getMandatoryStructuredCount() == null) {
                updateMandatoryStructuredCount(assessment.getId());
                // Refresh from database to get updated count
                assessmentRepository.findById(assessment.getId()).ifPresent(updated -> {
                    assessment.setMandatoryStructuredCount(updated.getMandatoryStructuredCount());
                });
            }
        }
        return assessments;
    }

    public ResponseEntity<CourseAssessment> getAssessmentById(Long assessmentId) {
        Optional<CourseAssessment> assessment = assessmentRepository.findById(assessmentId);
        if (assessment.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(assessment.get());
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
        
        // Calculate and update mandatory structured count after saving (when questions are added)
        updateMandatoryStructuredCount(saved.getId());
        
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
        if (updates.getShowAnswers() != null) assessment.setShowAnswers(updates.getShowAnswers());
        if (updates.getMaxRetries() != null) assessment.setMaxRetries(updates.getMaxRetries());
        if (updates.getTimingMode() != null) assessment.setTimingMode(updates.getTimingMode());
        if (updates.getTimeLimit() != null) assessment.setTimeLimit(updates.getTimeLimit());
        if (updates.getCategory() != null) assessment.setCategory(updates.getCategory());

        CourseAssessment saved = assessmentRepository.save(assessment);
        
        // Recalculate mandatory structured count when assessment is updated
        updateMandatoryStructuredCount(assessmentId);
        
        return ResponseEntity.ok(saved);
    }
    
    /**
     * Calculate and update the count of mandatory structured questions for an assessment
     */
    public void updateMandatoryStructuredCount(Long assessmentId) {
        Optional<CourseAssessment> assessmentOpt = assessmentRepository.findById(assessmentId);
        if (assessmentOpt.isEmpty()) {
            System.out.println("Warning: Assessment " + assessmentId + " not found for mandatory structured count update");
            return;
        }
        
        CourseAssessment assessment = assessmentOpt.get();
        List<com.caa.ocms.model.AssessmentQuestion> questions = questionRepository.findByAssessment(assessmentId);
        
        // Count mandatory structured questions (case-insensitive check)
        long mandatoryStructuredCount = questions.stream()
            .filter(q -> {
                boolean isStructured = "structured".equalsIgnoreCase(q.getType());
                boolean isMandatory = q.getMandatory() != null && q.getMandatory();
                return isStructured && isMandatory;
            })
            .count();
        
        // Debug logging
        long totalStructured = questions.stream()
            .filter(q -> "structured".equalsIgnoreCase(q.getType()))
            .count();
        System.out.println("Assessment " + assessmentId + " (" + assessment.getName() + "): " +
                         "Total questions: " + questions.size() +
                         ", Total structured: " + totalStructured +
                         ", Mandatory structured: " + mandatoryStructuredCount);
        
        assessment.setMandatoryStructuredCount((int) mandatoryStructuredCount);
        assessmentRepository.save(assessment);
    }
    
    /**
     * Recalculate mandatory structured count for all assessments
     * Useful for updating existing assessments after migration
     */
    public void recalculateAllMandatoryStructuredCounts() {
        List<CourseAssessment> allAssessments = assessmentRepository.findAll();
        System.out.println("Recalculating mandatory structured counts for " + allAssessments.size() + " assessments...");
        for (CourseAssessment assessment : allAssessments) {
            updateMandatoryStructuredCount(assessment.getId());
        }
        System.out.println("Completed recalculating mandatory structured counts");
    }

    public ResponseEntity<String> deleteAssessment(Long assessmentId) {
        if (!assessmentRepository.existsById(assessmentId)) {
            return ResponseEntity.notFound().build();
        }
        assessmentRepository.deleteById(assessmentId);
        return ResponseEntity.ok("Assessment deleted successfully");
    }
}


