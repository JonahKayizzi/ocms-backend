-- Add total_marks column to quiz_attempts table
-- This column stores the total marks possible for the attempt (sum of all question marks)
-- This is needed for accurate percentage calculation when questions have different marks

ALTER TABLE quiz_attempts 
ADD COLUMN total_marks DOUBLE NULL AFTER total_questions;

-- Change score column from INT to DOUBLE to preserve precision for aggregated marks
-- This allows scores like 5.0 (1 multiple choice + 4 structured) to be stored accurately
ALTER TABLE quiz_attempts 
MODIFY COLUMN score DOUBLE NOT NULL DEFAULT 0.0;

-- For existing attempts, we can calculate total_marks from the questions
-- However, since we can't easily reconstruct this from existing data without question marks,
-- we'll leave them as NULL and the application will use total_questions as fallback

