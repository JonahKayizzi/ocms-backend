-- Check current assessment and question status
SELECT ca.id as assessment_id,
    ca.name as assessment_name,
    ca.course_id,
    ca.question_count,
    COUNT(aq.id) as actual_questions
FROM course_assessments ca
    LEFT JOIN assessment_questions aq ON ca.id = aq.assessment_id
GROUP BY ca.id,
    ca.name,
    ca.course_id,
    ca.question_count
ORDER BY ca.id;
-- Check questions and their options
SELECT aq.id as question_id,
    aq.text as question_text,
    aq.assessment_id,
    COUNT(qo.id) as option_count,
    SUM(
        CASE
            WHEN qo.is_correct = 1 THEN 1
            ELSE 0
        END
    ) as correct_options
FROM assessment_questions aq
    LEFT JOIN question_options qo ON aq.id = qo.question_id
GROUP BY aq.id,
    aq.text,
    aq.assessment_id
ORDER BY aq.assessment_id,
    aq.id;
-- Check if options have correct answers marked
SELECT qo.id as option_id,
    qo.question_id,
    qo.option_text,
    qo.is_correct
FROM question_options qo
WHERE qo.question_id IN (1, 2, 3)
ORDER BY qo.question_id,
    qo.id;