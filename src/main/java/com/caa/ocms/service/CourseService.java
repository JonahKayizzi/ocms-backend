package com.caa.ocms.service;

import com.caa.ocms.model.Course;
import com.caa.ocms.repository.CourseRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CourseService {
    private final CourseRepository courseRepository;

    public CourseService(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
    }

    public List<Course> getAllCourses() {
        return courseRepository.findAllByOrderByCreatedAtDesc();
    }

    public List<Course> getPublishedCourses() {
        return courseRepository.findAllActiveCourses();
    }

    public List<Course> getCompletedCourses() {
        LocalDateTime now = LocalDateTime.now();
        return courseRepository.findAllByOrderByCreatedAtDesc()
                .stream()
                .filter(c -> c.getEndDate() != null && c.getEndDate().isBefore(now))
                .collect(Collectors.toList());
    }

    public Optional<Course> getCourseById(Long id) {
        return courseRepository.findById(id);
    }

    public Course createCourse(Course course) {
        course.setCreatedAt(LocalDateTime.now());
        course.setModifiedAt(LocalDateTime.now());
        if (course.getStatus() == null) {
            course.setStatus(2); // default Draft
        }
        return courseRepository.save(course);
    }

    public Optional<Course> editCourse(Long id, Course updates) {
        return courseRepository.findById(id).map(existing -> {
            if (updates.getName() != null) existing.setName(updates.getName());
            if (updates.getDescription() != null) existing.setDescription(updates.getDescription());
            if (updates.getLearningGoals() != null) existing.setLearningGoals(updates.getLearningGoals());
            if (updates.getObjectives() != null) existing.setObjectives(updates.getObjectives());
            if (updates.getStartDate() != null) existing.setStartDate(updates.getStartDate());
            if (updates.getEndDate() != null) existing.setEndDate(updates.getEndDate());
            if (updates.getStatus() != null) existing.setStatus(updates.getStatus());
            existing.setModifiedAt(LocalDateTime.now());
            return courseRepository.save(existing);
        });
    }

    public boolean deleteCourse(Long id) {
        if (!courseRepository.existsById(id)) {
            return false;
        }
        courseRepository.deleteById(id);
        return true;
    }
}


