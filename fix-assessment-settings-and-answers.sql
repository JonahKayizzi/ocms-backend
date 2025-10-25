-- Fix assessment settings for existing assessments
-- Set proper default values for the new fields
UPDATE course_assessments
SET show_answers = COALESCE(show_answers, 1),
    max_retries = COALESCE(max_retries, 3),
    timing_mode = COALESCE(timing_mode, 'none'),
    time_limit = COALESCE(time_limit, 30)
WHERE id = 2;
-- Also fix the correct answers for existing questions
-- Question 1: "Who is responsible for effective aviation safety management?"
UPDATE question_options
SET is_correct = 1
WHERE question_id = 1
    AND option_text = 'All staff and stakeholders';
-- Question 2: "Which approach is emphasized in aviation safety management?"
UPDATE question_options
SET is_correct = 1
WHERE question_id = 2
    AND option_text = 'Collective responsibility approach';
-- Question 3: "The responsibilities individuals hold in aviation safety depend on:"
UPDATE question_options
SET is_correct = 1
WHERE question_id = 3
    AND option_text = 'Their position/title and level of involvement in SMS';
-- Verify the updates
SELECT ca.id as assessment_id,
    ca.name,
    ca.show_answers,
    ca.max_retries,
    ca.timing_mode,
    ca.time_limit
FROM course_assessments ca
WHERE ca.id = 2;
SELECT qo.question_id,
    qo.option_text,
    qo.is_correct
FROM question_options qo
WHERE qo.question_id IN (1, 2, 3)
ORDER BY qo.question_id,
    qo.id;