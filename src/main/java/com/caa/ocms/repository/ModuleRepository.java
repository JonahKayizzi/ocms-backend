package com.caa.ocms.repository;

import com.caa.ocms.model.Module;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface ModuleRepository extends JpaRepository<Module, Long> {
    @Query("SELECT m FROM Module m WHERE m.course.id = :courseId")
    List<Module> findByCourseId(@Param("courseId") Long courseId);
}




