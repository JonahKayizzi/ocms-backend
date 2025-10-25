-- Create enrollments table
CREATE TABLE IF NOT EXISTS enrollments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    course_id BIGINT NOT NULL,
    participant_id VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);
-- Create participant_progress table
CREATE TABLE IF NOT EXISTS participant_progress (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    lesson_id BIGINT NOT NULL,
    participant_id VARCHAR(100) NOT NULL,
    lesson_checkpoint_flag BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (lesson_id) REFERENCES course_lessons(id) ON DELETE CASCADE
);
-- Drop existing indexes if present (idempotent rerun)
DROP INDEX IF EXISTS idx_enrollments_course_id ON enrollments;
DROP INDEX IF EXISTS idx_enrollments_participant_id ON enrollments;
DROP INDEX IF EXISTS idx_enrollments_course_participant ON enrollments;
DROP INDEX IF EXISTS idx_participant_progress_lesson_id ON participant_progress;
DROP INDEX IF EXISTS idx_participant_progress_participant_id ON participant_progress;
DROP INDEX IF EXISTS idx_participant_progress_lesson_participant ON participant_progress;
-- Create indexes for better performance
CREATE INDEX idx_enrollments_course_id ON enrollments(course_id);
CREATE INDEX idx_enrollments_participant_id ON enrollments(participant_id);
CREATE INDEX idx_enrollments_course_participant ON enrollments(course_id, participant_id);
CREATE INDEX idx_participant_progress_lesson_id ON participant_progress(lesson_id);
CREATE INDEX idx_participant_progress_participant_id ON participant_progress(participant_id);
CREATE INDEX idx_participant_progress_lesson_participant ON participant_progress(lesson_id, participant_id);