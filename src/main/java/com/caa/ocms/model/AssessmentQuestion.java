package com.caa.ocms.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Entity
@Table(name = "assessment_questions")
@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class AssessmentQuestion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(columnDefinition = "TEXT", nullable = false)
    private String text;


    @Column(name = "options_to_present")
    private Integer optionsToPresent;

    @Lob
    @Column(name = "image_data_url", columnDefinition = "LONGTEXT")
    private String imageDataUrl;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "assessment_id")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private CourseAssessment assessment;

    @OneToMany(mappedBy = "question", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<QuestionOption> options;

    @Column(name = "type")
    @JsonProperty("questionType")
    private String type; // "multiple_choice" or "structured"

    @Column(name = "mandatory")
    @JsonProperty("isMandatory")
    private Boolean mandatory = false; // true = always appears, false = can be randomly selected

    @Column(name = "marks")
    private Double marks; // Mark allocated to the question
}




