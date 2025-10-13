package com.caa.ocms.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;

@Entity
@Table(name = "participant_progress")
@JsonIgnoreProperties({"hibernateLazyInitializer","handler"})
public class ParticipantProgress {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "lesson_id", nullable = false)
    private Long lessonId;

    @Column(name = "participant_id", nullable = false)
    private String participantId;

    @Column(name = "lesson_checkpoint_flag", nullable = false)
    private boolean lessonCheckpointFlag;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getLessonId() { return lessonId; }
    public void setLessonId(Long lessonId) { this.lessonId = lessonId; }

    public String getParticipantId() { return participantId; }
    public void setParticipantId(String participantId) { this.participantId = participantId; }

    public boolean isLessonCheckpointFlag() { return lessonCheckpointFlag; }
    public void setLessonCheckpointFlag(boolean lessonCheckpointFlag) { this.lessonCheckpointFlag = lessonCheckpointFlag; }
}


