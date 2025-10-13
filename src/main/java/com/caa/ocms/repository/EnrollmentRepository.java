package com.caa.ocms.repository;

import com.caa.ocms.model.Enrollment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface EnrollmentRepository extends JpaRepository<Enrollment, Long> {
    long countByCourseId(Long courseId);
    List<Enrollment> findByCourseId(Long courseId);
    Optional<Enrollment> findByCourseIdAndParticipantId(Long courseId, String participantId);
}


