-- Fix correct answers for existing questions
-- Based on the safety responsibilities content
-- Question 1: "Who is responsible for effective aviation safety management?"
-- Correct answer: "All staff and stakeholders" (option ID 5)
UPDATE question_options
SET is_correct = 1
WHERE id = 5;
-- Question 2: "Which approach is emphasized in aviation safety management?"
-- Correct answer: "Collective responsibility approach" (option ID 25)
UPDATE question_options
SET is_correct = 1
WHERE id = 25;
-- Question 3: "The responsibilities individuals hold in aviation safety depend on:"
-- Correct answer: "Their position/title and level of involvement in SMS" (option ID 28)
UPDATE question_options
SET is_correct = 1
WHERE id = 28;
-- Clean up duplicate options for Question 1
-- Keep only the first occurrence of each unique option text
DELETE qo1
FROM question_options qo1
    INNER JOIN question_options qo2
WHERE qo1.question_id = 1
    AND qo2.question_id = 1
    AND qo1.id > qo2.id
    AND qo1.option_text = qo2.option_text;
-- Clean up duplicate options for Question 3
-- Keep only the first occurrence of each unique option text
DELETE qo1
FROM question_options qo1
    INNER JOIN question_options qo2
WHERE qo1.question_id = 3
    AND qo2.question_id = 3
    AND qo1.id > qo2.id
    AND qo1.option_text = qo2.option_text;
-- Verify the results
SELECT qo.question_id,
    qo.id as option_id,
    qo.option_text,
    qo.is_correct
FROM question_options qo
WHERE qo.question_id IN (1, 2, 3)
ORDER BY qo.question_id,
    qo.id;