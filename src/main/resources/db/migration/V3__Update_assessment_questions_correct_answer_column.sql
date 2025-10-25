-- Update assessment_questions table to rename correct_answer to correct_option_id
-- and change the data type from VARCHAR to INT
ALTER TABLE assessment_questions CHANGE COLUMN correct_answer correct_option_id INT NULL;
-- Add foreign key constraint to reference question_options table
ALTER TABLE assessment_questions
ADD CONSTRAINT fk_assessment_questions_correct_option_id FOREIGN KEY (correct_option_id) REFERENCES question_options(id) ON DELETE
SET NULL;



