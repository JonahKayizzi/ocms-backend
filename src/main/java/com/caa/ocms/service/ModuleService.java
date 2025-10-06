package com.caa.ocms.service;

import com.caa.ocms.model.Course;
import com.caa.ocms.model.Module;
import com.caa.ocms.repository.CourseRepository;
import com.caa.ocms.repository.ModuleRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ModuleService {
    private final ModuleRepository moduleRepository;
    private final CourseRepository courseRepository;

    public ModuleService(ModuleRepository moduleRepository, CourseRepository courseRepository) {
        this.moduleRepository = moduleRepository;
        this.courseRepository = courseRepository;
    }

    public List<Module> getModulesByCourse(Long courseId) {
        return moduleRepository.findByCourseId(courseId);
    }

    public Module createModule(Long courseId, Module module) {
        Course course = courseRepository.findById(courseId).orElseThrow();
        module.setCourse(course);
        return moduleRepository.save(module);
    }

    public Module updateModule(Long id, Module updates) {
        Module existing = moduleRepository.findById(id).orElseThrow();
        if (updates.getName() != null) {
            existing.setName(updates.getName());
        }
        if (updates.getDescription() != null) {
            existing.setDescription(updates.getDescription());
        }
        // Course reassignment is not allowed here unless explicitly provided
        if (updates.getCourse() != null && updates.getCourse().getId() != null) {
            Course course = courseRepository.findById(updates.getCourse().getId()).orElseThrow();
            existing.setCourse(course);
        }
        return moduleRepository.save(existing);
    }
}




