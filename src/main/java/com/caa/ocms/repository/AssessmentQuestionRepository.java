package com.caa.ocms.repository;

import com.caa.ocms.model.AssessmentQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface AssessmentQuestionRepository extends JpaRepository<AssessmentQuestion, Long> {
    @Query("SELECT q FROM AssessmentQuestion q WHERE q.assessment.id = :assessmentId ORDER BY q.id DESC")
    List<AssessmentQuestion> findByAssessment(@Param("assessmentId") Long assessmentId);
}




