package com.caa.ocms.service;

import com.caa.ocms.model.Enrollment;
import com.caa.ocms.repository.EnrollmentRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class EnrollmentService {
    private final EnrollmentRepository enrollmentRepository;

    public EnrollmentService(EnrollmentRepository enrollmentRepository) {
        this.enrollmentRepository = enrollmentRepository;
    }

    public long countByCourse(Long courseId) {
        return enrollmentRepository.countByCourseId(courseId);
    }

    public Optional<Enrollment> findByCourseAndParticipant(Long courseId, String participantId) {
        return enrollmentRepository.findByCourseIdAndParticipantId(courseId, participantId);
    }

    public Enrollment enroll(Long courseId, String participantId) {
        return enrollmentRepository.findByCourseIdAndParticipantId(courseId, participantId)
                .orElseGet(() -> {
                    Enrollment e = new Enrollment();
                    e.setCourseId(courseId);
                    e.setParticipantId(participantId);
                    return enrollmentRepository.save(e);
                });
    }
}


