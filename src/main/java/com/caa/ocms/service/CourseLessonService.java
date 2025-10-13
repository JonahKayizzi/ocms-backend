package com.caa.ocms.service;

import com.caa.ocms.model.Course;
import com.caa.ocms.model.CourseLesson;
import com.caa.ocms.model.Module;
import com.caa.ocms.repository.CourseLessonRepository;
import com.caa.ocms.repository.CourseRepository;
import com.caa.ocms.repository.ModuleRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseLessonService {
    private final CourseLessonRepository lessonRepository;
    private final CourseRepository courseRepository;
    private final ModuleRepository moduleRepository;

    public CourseLessonService(CourseLessonRepository lessonRepository, CourseRepository courseRepository, ModuleRepository moduleRepository) {
        this.lessonRepository = lessonRepository;
        this.courseRepository = courseRepository;
        this.moduleRepository = moduleRepository;
    }

    public List<CourseLesson> listByCourse(Long courseId) {
        return lessonRepository.findByCourseId(courseId);
    }

    public List<CourseLesson> getLessonsByCourse(Long courseId) {
        return lessonRepository.findByCourseId(courseId);
    }

    public CourseLesson createLesson(Long courseId, Long moduleId, CourseLesson lesson) {
        Course course = courseRepository.findById(courseId).orElseThrow();
        lesson.setCourse(course);
        if (moduleId != null) {
            Module module = moduleRepository.findById(moduleId).orElseThrow();
            lesson.setModule(module);
        }
        return lessonRepository.save(lesson);
    }

    public CourseLesson updateLesson(Long id, CourseLesson updates) {
        CourseLesson existing = lessonRepository.findById(id).orElseThrow();
        if (updates.getName() != null) {
            existing.setName(updates.getName());
        }
        if (updates.getDescription() != null) {
            existing.setDescription(updates.getDescription());
        }
        if (updates.getContent() != null) {
            existing.setContent(updates.getContent());
        }
        if (updates.getLoomVideoUrl() != null) {
            existing.setLoomVideoUrl(updates.getLoomVideoUrl());
        }
        if (updates.getCourse() != null && updates.getCourse().getId() != null) {
            Course course = courseRepository.findById(updates.getCourse().getId()).orElseThrow();
            existing.setCourse(course);
        }
        if (updates.getModule() != null) {
            if (updates.getModule().getId() != null) {
                Module module = moduleRepository.findById(updates.getModule().getId()).orElseThrow();
                existing.setModule(module);
            } else {
                existing.setModule(null);
            }
        }
        return lessonRepository.save(existing);
    }

    public void deleteLesson(Long id) {
        lessonRepository.deleteById(id);
    }
}




