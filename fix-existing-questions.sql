-- Fix existing questions by marking correct answers
-- Based on the safety responsibilities content, let's mark the correct answers
-- Question 1: "Who is responsible for aviation safety?"
-- Correct answer should be "All staff and stakeholders"
UPDATE question_options
SET is_correct = 1
WHERE question_id = 1
    AND option_text = 'All staff and stakeholders';
-- Question 2: "What is the primary goal of SMS?"
-- Correct answer should be "Prevent accidents and incidents"
UPDATE question_options
SET is_correct = 1
WHERE question_id = 2
    AND option_text = 'Prevent accidents and incidents';
-- Question 3: "Which approach best describes SMS?"
-- Correct answer should be "Collective responsibility approach"
UPDATE question_options
SET is_correct = 1
WHERE question_id = 3
    AND option_text = 'Collective responsibility approach';
-- Verify the updates
SELECT qo.question_id,
    qo.option_text,
    qo.is_correct
FROM question_options qo
WHERE qo.question_id IN (1, 2, 3)
ORDER BY qo.question_id,
    qo.id;