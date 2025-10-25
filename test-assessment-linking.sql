-- Test script to verify the assessment-course linking
-- This will show which assessments are linked to which courses
SELECT ca.id as assessment_id,
    ca.name as assessment_name,
    ca.course_id,
    c.name as course_name,
    ca.question_count,
    ca.show_answers,
    ca.max_retries,
    ca.timing_mode,
    ca.time_limit
FROM course_assessments ca
    LEFT JOIN courses c ON ca.course_id = c.id
ORDER BY ca.id;