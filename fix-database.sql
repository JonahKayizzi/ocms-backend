-- Remove correct_option_id column from assessment_questions table
-- This script removes the correct_option_id column since we're now using is_correct in question_options table

ALTER TABLE assessment_questions DROP COLUMN correct_option_id;
