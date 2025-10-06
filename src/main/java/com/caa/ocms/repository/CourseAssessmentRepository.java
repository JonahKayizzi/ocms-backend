package com.caa.ocms.repository;

import com.caa.ocms.model.CourseAssessment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CourseAssessmentRepository extends JpaRepository<CourseAssessment, Long> {
    @Query("SELECT a FROM CourseAssessment a WHERE a.course.id = :courseId ORDER BY a.id DESC")
    List<CourseAssessment> findByCourseId(@Param("courseId") Long courseId);

    @Query("SELECT a FROM CourseAssessment a WHERE a.course IS NULL AND a.status = 1 ORDER BY a.id DESC")
    List<CourseAssessment> findStandaloneActive();
}




