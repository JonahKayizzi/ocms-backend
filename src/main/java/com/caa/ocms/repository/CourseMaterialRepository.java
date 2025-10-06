package com.caa.ocms.repository;

import com.caa.ocms.model.CourseMaterial;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CourseMaterialRepository extends JpaRepository<CourseMaterial, Long> {
    @Query("SELECT m FROM CourseMaterial m WHERE m.course.id = :courseId ORDER BY m.id DESC")
    List<CourseMaterial> findByCourseId(@Param("courseId") Long courseId);
}


