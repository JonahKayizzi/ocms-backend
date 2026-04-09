package com.caa.ocms.repository;

import com.caa.ocms.model.UserQuestionPerformance;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserQuestionPerformanceRepository extends JpaRepository<UserQuestionPerformance, Long> {
    List<UserQuestionPerformance> findByAttemptId(Long attemptId);

    java.util.Optional<UserQuestionPerformance> findByAttempt_IdAndQuestion_Id(Long attemptId, Long questionId);
}





