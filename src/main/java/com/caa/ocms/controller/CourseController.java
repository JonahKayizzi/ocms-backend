package com.caa.ocms.controller;

import com.caa.ocms.model.Course;
import com.caa.ocms.service.CourseService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CourseController {
    private final CourseService courseService;

    public CourseController(CourseService courseService) {
        this.courseService = courseService;
    }

    @GetMapping("/courses")
    public List<Course> getAllCourses() {
        return courseService.getAllCourses();
    }

    // Added for landing page and public listings
    @GetMapping("/courses/published")
    public List<Course> getPublishedCourses() {
        return courseService.getPublishedCourses();
    }

    @GetMapping("/courses/completed")
    public List<Course> getCompletedCourses() {
        return courseService.getCompletedCourses();
    }

    @GetMapping("/course/{id}")
    public ResponseEntity<?> getCourse(@PathVariable Long id) {
        return courseService.getCourseById(id)
                .<ResponseEntity<?>>map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // New canonical endpoint used by the frontend
    @PostMapping("/courses")
    public ResponseEntity<Course> addCourse(@RequestBody Course course) {
        return ResponseEntity.status(201).body(courseService.createCourse(course));
    }

    // New canonical endpoint used by the frontend
    @PutMapping("/courses/{id}")
    public ResponseEntity<?> editCourse(@PathVariable Long id, @RequestBody Course updates) {
        return courseService.editCourse(id, updates)
                .<ResponseEntity<?>>map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // Backwards compatibility routes
    @PostMapping("/add-course")
    public ResponseEntity<Course> addCourseLegacy(@RequestBody Course course) {
        return ResponseEntity.status(201).body(courseService.createCourse(course));
    }

    @PatchMapping("/edit-course/{id}")
    public ResponseEntity<?> editCourseLegacy(@PathVariable Long id, @RequestBody Course updates) {
        return courseService.editCourse(id, updates)
                .<ResponseEntity<?>>map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/delete-course/{id}")
    public ResponseEntity<?> deleteCourse(@PathVariable Long id) {
        return courseService.deleteCourse(id) ? ResponseEntity.ok().build() : ResponseEntity.notFound().build();
    }

    // Added for status changes from UI
    @PatchMapping("/courses/{id}/publish")
    public ResponseEntity<?> publishCourse(@PathVariable Long id) {
        // Set status to 1 (Published)
        return courseService.editCourse(id, new Course(null, null, null, null, null, null, null, null, null, 1))
                .<ResponseEntity<?>>map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PatchMapping("/courses/{id}/deactivate")
    public ResponseEntity<?> deactivateCourse(@PathVariable Long id) {
        // Set status to 0 (Deactivated)
        return courseService.editCourse(id, new Course(null, null, null, null, null, null, null, null, null, 0))
                .<ResponseEntity<?>>map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
}


