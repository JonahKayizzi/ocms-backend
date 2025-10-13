package com.caa.ocms.controller;

import com.caa.ocms.model.CourseLesson;
import com.caa.ocms.service.CourseLessonService;
import com.caa.ocms.service.ParticipantProgressService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/participant-progress")
public class ParticipantProgressController {
    private final ParticipantProgressService progressService;
    private final CourseLessonService lessonService;

    public ParticipantProgressController(ParticipantProgressService progressService, CourseLessonService lessonService) {
        this.progressService = progressService;
        this.lessonService = lessonService;
    }

    @PostMapping("/lesson/{lessonId}")
    public ResponseEntity<?> setCompleted(@PathVariable Long lessonId, @RequestParam String participantId, @RequestParam boolean completed) {
        return ResponseEntity.ok(progressService.setLessonCompletion(lessonId, participantId, completed));
    }

    @GetMapping("/course/{courseId}/percent")
    public ResponseEntity<Map<String, Object>> getCourseProgress(@PathVariable Long courseId, @RequestParam String participantId) {
        List<CourseLesson> lessons = lessonService.getLessonsByCourse(courseId);
        List<Long> lessonIds = lessons.stream().map(CourseLesson::getId).collect(Collectors.toList());
        long completed = progressService.countCompleted(participantId, lessonIds);
        int total = lessonIds.size();
        double percent = total == 0 ? 0 : (completed * 100.0) / total;
        return ResponseEntity.ok(Map.of("completed", completed, "total", total, "percent", percent));
    }
}


