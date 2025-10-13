package com.caa.ocms.service;

import com.caa.ocms.model.ParticipantProgress;
import com.caa.ocms.repository.ParticipantProgressRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ParticipantProgressService {
    private final ParticipantProgressRepository progressRepository;

    public ParticipantProgressService(ParticipantProgressRepository progressRepository) {
        this.progressRepository = progressRepository;
    }

    public ParticipantProgress setLessonCompletion(Long lessonId, String participantId, boolean completed) {
        ParticipantProgress progress = progressRepository.findByLessonIdAndParticipantId(lessonId, participantId)
                .orElseGet(ParticipantProgress::new);
        progress.setLessonId(lessonId);
        progress.setParticipantId(participantId);
        progress.setLessonCheckpointFlag(completed);
        return progressRepository.save(progress);
    }

    public long countCompleted(String participantId, List<Long> lessonIds) {
        if (lessonIds == null || lessonIds.isEmpty()) return 0;
        return progressRepository.countByParticipantIdAndLessonIdInAndLessonCheckpointFlag(participantId, lessonIds, true);
    }
}


