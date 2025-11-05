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
}


