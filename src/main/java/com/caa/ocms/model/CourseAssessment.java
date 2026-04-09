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
    private Integer questionsToPresent; // Number of objective (multiple choice) questions to present

    @Column(name = "mandatory_structured_count")
    private Integer mandatoryStructuredCount; // Number of mandatory structured questions in the quiz

    @Column(name = "question_count")
    private Integer questionCount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "course_id")
    private Course course; // null for standalone assessments

    @Column(name = "category")
    private String category; // For standalone assessments: OJT, Proficiency, Certification, Recurrent

    @Column(name = "show_answers")
    private Boolean showAnswers = true;

    @Column(name = "max_retries")
    private Integer maxRetries = 3;

    @Column(name = "timing_mode")
    private String timingMode = "none";

    @Column(name = "time_limit")
    private Integer timeLimit = 30;

    @Column(name = "pass_mark")
<<<<<<< Updated upstream
    private Integer passMark = 70; // Minimum percentage score required to pass (default 70%)
=======
    private Double passMark = 70.0; // Pass mark as percentage (default 70%)
>>>>>>> Stashed changes

    @Column(name = "is_aim")
    private Boolean isAim = false; // True for AIM courses (MANSOPS reports), false for non-AIM courses

    @Column(name = "is_aim")
    private Boolean isAim = false; // True for AIM courses (MANSOPS reports), false for non-AIM courses

    @Column
    private Integer status = 1;
}




