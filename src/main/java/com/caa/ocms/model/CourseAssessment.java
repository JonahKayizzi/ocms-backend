package com.caa.ocms.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "course_assessments")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CourseAssessment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(name = "questions_to_present")
    private Integer questionsToPresent;

    @Column(name = "question_count")
    private Integer questionCount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "course_id")
    private Course course; // null for standalone assessments

    @Column(name = "show_answers")
    private Boolean showAnswers = true;

    @Column(name = "max_retries")
    private Integer maxRetries = 3;

    @Column(name = "timing_mode")
    private String timingMode = "none";

    @Column(name = "time_limit")
    private Integer timeLimit = 30;

    @Column
    private Integer status = 1;
}




