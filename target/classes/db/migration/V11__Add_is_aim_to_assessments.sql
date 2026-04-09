-- Add is_aim column to course_assessments table
-- This field differentiates between AIM (Aviation Information Management) and non-AIM courses
-- MANSOPS reports should only be generated for AIM courses
ALTER TABLE course_assessments
ADD COLUMN is_aim BOOLEAN DEFAULT FALSE;

-- Set existing assessments to AIM if they are part of AIM-related courses
-- You may need to adjust this based on your course naming convention or add a course-level flag
-- For now, we'll leave it as FALSE and let admins set it when creating/editing assessments
