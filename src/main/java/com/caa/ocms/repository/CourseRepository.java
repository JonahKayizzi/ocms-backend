package com.caa.ocms.repository;

import com.caa.ocms.model.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface CourseRepository extends JpaRepository<Course, Long> {
    @Query("SELECT c FROM Course c WHERE c.status = 1 ORDER BY c.createdAt DESC")
    List<Course> findAllActiveCourses();

    List<Course> findAllByOrderByCreatedAtDesc();
}




