-- SQL Script to Add Category Support to Assessments
-- Run this on production to add category column and update existing assessments

-- Step 1: Add category column to course_assessments table
ALTER TABLE course_assessments 
ADD COLUMN category VARCHAR(50) NULL AFTER course_id;

-- Step 2: Update existing standalone assessments with categories
-- Update AIXM OJT Assessment (ID 4) to have category 'OJT'
UPDATE course_assessments 
SET category = 'OJT' 
WHERE id = 4 AND course_id IS NULL;

-- Update COMM (USOIs) OJT Assessment (ID 7) to have category 'OJT'
UPDATE course_assessments 
SET category = 'OJT' 
WHERE id = 7 AND course_id IS NULL;

-- Step 3: Verify the updates
SELECT id, name, category, course_id 
FROM course_assessments 
WHERE course_id IS NULL;


