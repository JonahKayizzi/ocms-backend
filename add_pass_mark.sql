-- Add pass_mark column to course_assessments table
ALTER TABLE course_assessments
ADD COLUMN pass_mark DECIMAL(5,2) DEFAULT 70.00;

-- Update existing assessments to have default pass mark of 70%
UPDATE course_assessments
SET pass_mark = 70.00
WHERE pass_mark IS NULL;
