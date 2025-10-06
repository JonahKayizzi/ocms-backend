package com.caa.ocms.repository;

import com.caa.ocms.model.QuestionOption;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface QuestionOptionRepository extends JpaRepository<QuestionOption, Long> {
    @Query("SELECT o FROM QuestionOption o WHERE o.question.id = :questionId ORDER BY o.id ASC")
    List<QuestionOption> findByQuestion(@Param("questionId") Long questionId);
}


