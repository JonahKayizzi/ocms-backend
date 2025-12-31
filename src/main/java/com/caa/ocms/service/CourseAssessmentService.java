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
        return assessmentRepository.findByCourseId(courseId);
    }

    public List<CourseAssessment> getStandaloneAssessments() {
        return assessmentRepository.findStandaloneActive();
    }
    
    public List<CourseAssessment> getStandaloneAssessmentsByCategory(String category) {
        if (category == null || category.isEmpty()) {
            return assessmentRepository.findStandaloneActive();
        }
        return assessmentRepository.findStandaloneActiveByCategory(category);
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
            return;
        }
        
        CourseAssessment assessment = assessmentOpt.get();
        List<com.caa.ocms.model.AssessmentQuestion> questions = questionRepository.findByAssessment(assessmentId);
        
        long mandatoryStructuredCount = questions.stream()
            .filter(q -> "structured".equals(q.getType()) && q.getMandatory() != null && q.getMandatory())
            .count();
        
        assessment.setMandatoryStructuredCount((int) mandatoryStructuredCount);
        assessmentRepository.save(assessment);
    }

    public ResponseEntity<String> deleteAssessment(Long assessmentId) {
        if (!assessmentRepository.existsById(assessmentId)) {
            return ResponseEntity.notFound().build();
        }
        assessmentRepository.deleteById(assessmentId);
        return ResponseEntity.ok("Assessment deleted successfully");
    }
}


