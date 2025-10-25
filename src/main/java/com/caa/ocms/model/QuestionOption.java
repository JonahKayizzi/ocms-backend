package com.caa.ocms.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@Table(name = "question_options")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class QuestionOption {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(columnDefinition = "TEXT", nullable = false)
    private String optionText;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "question_id")
    @JsonIgnore
    private AssessmentQuestion question;

    @Column(name = "is_correct")
    private Boolean isCorrect = false;

    // Transient field for JSON deserialization
    @Transient
    @JsonProperty("questionId")
    private Long questionId;

    // Getter for questionId that extracts from the question relationship
    public Long getQuestionId() {
        return question != null ? question.getId() : questionId;
    }

    // Setter for questionId that creates a minimal question object
    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
        if (questionId != null) {
            this.question = new AssessmentQuestion();
            this.question.setId(questionId);
        }
    }
}
