-- Add new fields to course_assessments table
ALTER TABLE course_assessments
ADD COLUMN show_answers BOOLEAN DEFAULT TRUE,
    ADD COLUMN max_retries INT DEFAULT 3,
    ADD COLUMN timing_mode VARCHAR(20) DEFAULT 'none',
    ADD COLUMN time_limit INT DEFAULT 30;
-- Add is_correct field to question_options table for proper answer tracking
ALTER TABLE question_options
ADD COLUMN is_correct BOOLEAN DEFAULT FALSE;