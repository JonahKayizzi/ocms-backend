package com.caa.ocms.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "assessment_questions")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AssessmentQuestion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(columnDefinition = "TEXT", nullable = false)
    private String text;

    @Column(name = "correct_answer")
    private String correctAnswer;

    @Column(name = "options_to_present")
    private Integer optionsToPresent;

    @Column(name = "image_data_url", columnDefinition = "TEXT")
    private String imageDataUrl;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "assessment_id")
    private CourseAssessment assessment;
}




