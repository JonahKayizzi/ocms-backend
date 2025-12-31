-- Add mandatory_structured_count column to course_assessments table
-- This column stores the number of mandatory structured questions in the assessment
-- This is used to indicate to users how many structured questions they will encounter

ALTER TABLE course_assessments 
ADD COLUMN mandatory_structured_count INT NULL AFTER questions_to_present;

-- For existing assessments, we can calculate this from the questions
-- However, since we can't easily do this in a migration without complex logic,
-- we'll leave them as NULL and the application will calculate it when needed

