-- Add Safety Responsibilities Assessment Questions
-- First, ensure we have a Safety Responsibilities assessment
INSERT IGNORE INTO course_assessments (
        name,
        description,
        questions_to_present,
        question_count,
        show_answers,
        max_retries,
        timing_mode,
        time_limit,
        status
    )
VALUES (
        'Safety Responsibilities Assessment',
        'Assessment covering individual and collective safety responsibilities in aviation SMS',
        20,
        20,
        true,
        3,
        'none',
        30,
        1
    );
-- Get the assessment ID (assuming it's the latest one or we'll use a specific ID)
SET @assessment_id = (
        SELECT id
        FROM course_assessments
        WHERE name = 'Safety Responsibilities Assessment'
        ORDER BY id DESC
        LIMIT 1
    );
-- Add questions 4-20 (questions 1-3 are already in the system)
-- Question 4
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'The responsibilities individuals hold in aviation safety depend on:',
        4,
        @assessment_id
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Their salary and working hours',
        @question_id,
        false
    ),
    (
        'Their position/title and level of involvement in SMS',
        @question_id,
        true
    ),
    (
        'Their years of service only',
        @question_id,
        false
    ),
    ('Their department location', @question_id, false);
-- Question 5
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Safety responsibilities are generally categorized into:',
        4,
        @assessment_id
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Administrative and technical',
        @question_id,
        false
    ),
    ('Operational and financial', @question_id, false),
    ('Individual and collective', @question_id, true),
    ('Preventive and corrective', @question_id, false);
-- Question 6
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Staff in aviation organizations may have:',
        4,
        @assessment_id
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Only individual safety responsibilities',
        @question_id,
        false
    ),
    (
        'Only collective safety responsibilities',
        @question_id,
        false
    ),
    (
        'Either individual, collective, or both',
        @question_id,
        true
    ),
    (
        'No defined responsibilities',
        @question_id,
        false
    );
-- Question 7
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Which of the following is an individual safety responsibility?',
        4,
        @assessment_id
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Participating in the Safety Review Committee',
        @question_id,
        false
    ),
    ('Safety reporting', @question_id, true),
    (
        'Runway Safety Team participation',
        @question_id,
        false
    ),
    (
        'Serving on a management team',
        @question_id,
        false
    );
-- Question 8
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Individual safety responsibilities are characterized by:',
        4,
        @assessment_id
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Needing at least two people',
        @question_id,
        false
    ),
    (
        'Being fully executable by one person',
        @question_id,
        true
    ),
    (
        'Always requiring committee approval',
        @question_id,
        false
    ),
    (
        'Only being performed by managers',
        @question_id,
        false
    );
-- Question 9
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'An example of individual safety responsibility is:',
        4,
        @assessment_id
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES ('CAP development', @question_id, true),
    (
        'Safety Action Group membership',
        @question_id,
        false
    ),
    ('Runway Safety Team work', @question_id, false),
    (
        'Serving in Safety Assessment Team',
        @question_id,
        false
    );
-- Question 10
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Collective safety responsibilities require:',
        4,
        @assessment_id
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES ('One person''s input only', @question_id, false),
    (
        'At least two individuals'' involvement',
        @question_id,
        true
    ),
    (
        'Delegation to external agencies',
        @question_id,
        false
    ),
    ('Only pilot participation', @question_id, false);
-- Question 11
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Collective safety responsibilities are further classified into:',
        4,
        @assessment_id
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES ('Direct and indirect', @question_id, false),
    (
        'Team and individualized (jigsaw-type)',
        @question_id,
        true
    ),
    ('Short-term and long-term', @question_id, false),
    ('Mandatory and voluntary', @question_id, false);
-- Question 12
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Collective-Team Safety Responsibilities are assigned to:',
        4,
        @assessment_id
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES ('A single officer', @question_id, false),
    ('Groups or committees', @question_id, true),
    ('Outsourced consultants', @question_id, false),
    ('Individual contractors', @question_id, false);
-- Question 13
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Which of the following is a Collective-Team Safety Responsibility?',
        4,
        @assessment_id
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Developing an individual CAP',
        @question_id,
        false
    ),
    (
        'Safety Review Committee (SRC) participation',
        @question_id,
        true
    ),
    (
        'Writing personal safety reports',
        @question_id,
        false
    ),
    (
        'Personal compliance with safety training',
        @question_id,
        false
    );
-- Question 14
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'A key feature of Collective-Team responsibilities is:',
        4,
        @assessment_id
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'They can be assumed by one person alone',
        @question_id,
        false
    ),
    (
        'They require participation of all team members',
        @question_id,
        true
    ),
    (
        'They are optional for most staff',
        @question_id,
        false
    ),
    ('They are external to SMS', @question_id, false);
-- Question 15
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Examples of Collective-Team structures include:',
        4,
        @assessment_id
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES ('Safety Action Group (SAG)', @question_id, true),
    ('Personal safety reporting', @question_id, false),
    (
        'Individual risk assessments',
        @question_id,
        false
    ),
    ('Private consultant teams', @question_id, false);
-- Question 16
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Which ICAO document provides guidance on safety committees in SMS?',
        4,
        @assessment_id
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES ('ICAO Annex 13', @question_id, false),
    ('ICAO Doc 4444', @question_id, false),
    ('ICAO Doc 9859', @question_id, true),
    ('ICAO Doc 9734', @question_id, false);
-- Question 17
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Collective-Individualized (Jigsaw-type) responsibilities involve:',
        4,
        @assessment_id
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES ('A formal, structured team', @question_id, false),
    (
        'At least two persons with different individual roles',
        @question_id,
        true
    ),
    (
        'A single manager completing all work',
        @question_id,
        false
    ),
    (
        'Outsourcing to safety inspectors',
        @question_id,
        false
    );
-- Question 18
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'In Collective-Individualized responsibilities, each staff member:',
        4,
        @assessment_id
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Must work together as one group',
        @question_id,
        false
    ),
    (
        'Completes a unique role separately',
        @question_id,
        true
    ),
    (
        'Duplicates another''s role',
        @question_id,
        false
    ),
    ('Has no defined duties', @question_id, false);
-- Question 19
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'The "jigsaw-type" safety responsibilities are unique because:',
        4,
        @assessment_id
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'They eliminate collaboration',
        @question_id,
        false
    ),
    (
        'They need input from at least two people, but not as a formal team',
        @question_id,
        true
    ),
    (
        'They require only one person to finish',
        @question_id,
        false
    ),
    (
        'They are the same as team responsibilities',
        @question_id,
        false
    );
-- Question 20
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Which of the following best summarizes aviation safety responsibility?',
        4,
        @assessment_id
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'It is optional for non-technical staff',
        @question_id,
        false
    ),
    (
        'It is the sole duty of management',
        @question_id,
        false
    ),
    (
        'It requires both individual and collective efforts',
        @question_id,
        true
    ),
    (
        'It is only the regulator''s mandate',
        @question_id,
        false
    );
-- Update the question count for the assessment
UPDATE course_assessments
SET question_count = (
        SELECT COUNT(*)
        FROM assessment_questions
        WHERE assessment_id = @assessment_id
    )
WHERE id = @assessment_id;