package com.caa.ocms.model;

import jakarta.persistence.*;
import java.time.Instant;

@Entity
@Table(name = "quiz_attempts")
public class QuizAttempt {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "quiz_id", nullable = false)
    private CourseAssessment quiz;

    @Column(name = "participant_id", nullable = false)
    private String participantId;

    @Column(name = "attempt_number", nullable = false)
    private int attemptNumber;

    @Column(name = "score", nullable = false)
    private Double score = 0.0;

    @Column(name = "total_questions", nullable = false)
    private int totalQuestions = 0;

    @Column(name = "total_marks")
    private Double totalMarks; // Total marks possible for this attempt

    @Column(name = "passed", nullable = false)
    private boolean passed = false;

    @Column(name = "started_at", nullable = false)
    private Instant startedAt = Instant.now();

    @Column(name = "completed_at")
    private Instant completedAt;

    public Long getId() { return id; }
    public CourseAssessment getQuiz() { return quiz; }
    public void setQuiz(CourseAssessment quiz) { this.quiz = quiz; }
    public String getParticipantId() { return participantId; }
    public void setParticipantId(String participantId) { this.participantId = participantId; }
    public int getAttemptNumber() { return attemptNumber; }
    public void setAttemptNumber(int attemptNumber) { this.attemptNumber = attemptNumber; }
    public Double getScore() { return score; }
    public void setScore(Double score) { this.score = score; }
    public int getTotalQuestions() { return totalQuestions; }
    public void setTotalQuestions(int totalQuestions) { this.totalQuestions = totalQuestions; }
    public Double getTotalMarks() { return totalMarks; }
    public void setTotalMarks(Double totalMarks) { this.totalMarks = totalMarks; }
    public boolean isPassed() { return passed; }
    public void setPassed(boolean passed) { this.passed = passed; }
    public Instant getStartedAt() { return startedAt; }
    public void setStartedAt(Instant startedAt) { this.startedAt = startedAt; }
    public Instant getCompletedAt() { return completedAt; }
    public void setCompletedAt(Instant completedAt) { this.completedAt = completedAt; }
}





