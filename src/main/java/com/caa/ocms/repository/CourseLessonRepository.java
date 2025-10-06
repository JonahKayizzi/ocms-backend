package com.caa.ocms.repository;

import com.caa.ocms.model.CourseLesson;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CourseLessonRepository extends JpaRepository<CourseLesson, Long> {
    @Query("SELECT l FROM CourseLesson l WHERE l.course.id = :courseId ORDER BY l.id DESC")
    List<CourseLesson> findByCourseId(@Param("courseId") Long courseId);
}




