package com.caa.ocms.repository;

import com.caa.ocms.model.ParticipantProgress;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ParticipantProgressRepository extends JpaRepository<ParticipantProgress, Long> {
    Optional<ParticipantProgress> findByLessonIdAndParticipantId(Long lessonId, String participantId);
    long countByParticipantIdAndLessonIdIn(String participantId, List<Long> lessonIds);
    long countByParticipantIdAndLessonIdInAndLessonCheckpointFlag(String participantId, List<Long> lessonIds, Boolean lessonCheckpointFlag);
}


