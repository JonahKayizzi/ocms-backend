package com.caa.ocms.repository;

import com.caa.ocms.model.QuizAttempt;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface QuizAttemptRepository extends JpaRepository<QuizAttempt, Long> {
    @Query("select count(a) from QuizAttempt a where a.quiz.id = :quizId and a.participantId = :participantId")
    int countAttempts(@Param("quizId") Long quizId, @Param("participantId") String participantId);

    List<QuizAttempt> findByParticipantIdOrderByCompletedAtDesc(String participantId);
    
    @Query("select a from QuizAttempt a where a.quiz.id = :assessmentId and a.completedAt is not null order by a.completedAt desc")
    List<QuizAttempt> findByAssessmentIdOrderByCompletedAtDesc(@Param("assessmentId") Long assessmentId);
    
    @Query("select count(distinct a.participantId) from QuizAttempt a where a.quiz.id = :assessmentId and a.completedAt is not null")
    long countUniqueParticipantsByAssessmentId(@Param("assessmentId") Long assessmentId);
    
    @Query("select avg(a.score * 100.0 / a.totalQuestions) from QuizAttempt a where a.quiz.id = :assessmentId and a.completedAt is not null and a.totalQuestions > 0")
    Double getAverageScorePercentageByAssessmentId(@Param("assessmentId") Long assessmentId);
    
    @Query("select count(a) * 100.0 / (select count(a2) from QuizAttempt a2 where a2.quiz.id = :assessmentId and a2.completedAt is not null) from QuizAttempt a where a.quiz.id = :assessmentId and a.completedAt is not null and a.passed = true")
    Double getPassRateByAssessmentId(@Param("assessmentId") Long assessmentId);
}


