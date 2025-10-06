package com.caa.ocms.controller;

import com.caa.ocms.model.CourseLesson;
import com.caa.ocms.service.CourseLessonService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CourseLessonController {
    private final CourseLessonService lessonService;

    public CourseLessonController(CourseLessonService lessonService) {
        this.lessonService = lessonService;
    }

    @GetMapping("/course-lessons/course/{courseId}")
    public List<CourseLesson> byCourse(@PathVariable Long courseId) {
        return lessonService.listByCourse(courseId);
    }

    @PostMapping("/add-lesson/{courseId}")
    public ResponseEntity<CourseLesson> addLesson(
            @PathVariable Long courseId,
            @RequestParam(required = false) Long moduleId,
            @RequestBody CourseLesson lesson
    ) {
        return ResponseEntity.status(201).body(lessonService.createLesson(courseId, moduleId, lesson));
    }

    // Canonical endpoint matching OCMS frontend payload
    @PostMapping("/course-lessons")
    public ResponseEntity<CourseLesson> createLesson(@RequestBody CourseLesson lesson) {
        Long courseId = lesson.getCourse() != null ? lesson.getCourse().getId() : null;
        Long moduleId = lesson.getModule() != null ? lesson.getModule().getId() : null;
        if (courseId == null) {
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.status(201).body(lessonService.createLesson(courseId, moduleId, lesson));
    }

    @PutMapping("/course-lessons/{id}")
    public ResponseEntity<CourseLesson> updateLesson(@PathVariable Long id, @RequestBody CourseLesson updates) {
        return ResponseEntity.ok(lessonService.updateLesson(id, updates));
    }

    @DeleteMapping("/course-lessons/{id}")
    public ResponseEntity<Void> deleteLesson(@PathVariable Long id) {
        lessonService.deleteLesson(id);
        return ResponseEntity.noContent().build();
    }
}




