-- Fix correct answers for existing questions
UPDATE question_options
SET is_correct = 1
WHERE question_id = 1
    AND option_text = 'All staff and stakeholders';
UPDATE question_options
SET is_correct = 1
WHERE question_id = 2
    AND option_text = 'Collective responsibility approach';
UPDATE question_options
SET is_correct = 1
WHERE question_id = 3
    AND option_text = 'Their position/title and level of involvement in SMS';