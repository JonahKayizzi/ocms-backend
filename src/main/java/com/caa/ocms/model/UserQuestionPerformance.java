package com.caa.ocms.model;

import jakarta.persistence.*;

@Entity
@Table(name = "user_question_performance")
public class UserQuestionPerformance {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "attempt_id", nullable = false)
    private QuizAttempt attempt;

    @Column(name = "user_id", nullable = false)
    private String userId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "question_id", nullable = false)
    private AssessmentQuestion question;

    @Column(name = "answer_id")
    private Long answerId;

    @Column(name = "correct", nullable = false)
    private boolean correct;

    @Column(name = "answer_text", columnDefinition = "TEXT")
    private String answerText; // For structured questions

    @Column(name = "mark_awarded")
    private Double markAwarded; // Mark awarded by admin for structured questions

    public Long getId() { return id; }
    public QuizAttempt getAttempt() { return attempt; }
    public void setAttempt(QuizAttempt attempt) { this.attempt = attempt; }
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
    public AssessmentQuestion getQuestion() { return question; }
    public void setQuestion(AssessmentQuestion question) { this.question = question; }
    public Long getAnswerId() { return answerId; }
    public void setAnswerId(Long answerId) { this.answerId = answerId; }
    public boolean isCorrect() { return correct; }
    public void setCorrect(boolean correct) { this.correct = correct; }
    public String getAnswerText() { return answerText; }
    public void setAnswerText(String answerText) { this.answerText = answerText; }
    public Double getMarkAwarded() { return markAwarded; }
    public void setMarkAwarded(Double markAwarded) { this.markAwarded = markAwarded; }
}


