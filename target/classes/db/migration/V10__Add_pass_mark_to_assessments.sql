-- Add pass_mark column to course_assessments table
-- This field stores the minimum percentage score required to pass the assessment
ALTER TABLE course_assessments
ADD COLUMN pass_mark INT DEFAULT 70;
