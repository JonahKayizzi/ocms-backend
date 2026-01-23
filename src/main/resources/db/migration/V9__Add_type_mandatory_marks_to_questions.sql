-- Fix type column size and add missing columns to assessment_questions table
-- Type values: "mcq" (Multiple Choice Question) or "structured"

-- First, try to modify the type column if it exists (to increase size)
-- If it doesn't exist, this will fail but that's okay - we'll add it next
-- Note: In production, if column exists with wrong size, MODIFY will fix it
-- If column doesn't exist, the next statements will add it

-- Modify type column to VARCHAR(50) if it exists
ALTER TABLE assessment_questions 
MODIFY COLUMN type VARCHAR(50) NULL;

-- Add mandatory column (ignore error if already exists)
ALTER TABLE assessment_questions 
ADD COLUMN mandatory BOOLEAN DEFAULT FALSE;

-- Add marks column (ignore error if already exists)  
ALTER TABLE assessment_questions 
ADD COLUMN marks DOUBLE NULL;

