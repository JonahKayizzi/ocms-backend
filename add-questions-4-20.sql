-- Add questions 4-20 to existing Safety Responsibilities Assessment (ID 2)
-- Since Flyway is disabled, we'll run this manually
-- Question 4: Individual responsibilities in aviation safety
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Individual responsibilities in aviation safety include:',
        4,
        2
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Following safety procedures and reporting hazards',
        @question_id,
        true
    ),
    (
        'Only following instructions from supervisors',
        @question_id,
        false
    ),
    (
        'Working faster to meet deadlines',
        @question_id,
        false
    ),
    ('Avoiding safety meetings', @question_id, false);
-- Question 5: Collective responsibility approach
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'The collective responsibility approach means:',
        4,
        2
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Everyone shares responsibility for safety outcomes',
        @question_id,
        true
    ),
    (
        'Only managers are responsible for safety',
        @question_id,
        false
    ),
    (
        'Safety is the regulator\'s job',
        @question_id,
        false
    ),
    (
        'Individual performance doesn\'t matter',
        @question_id,
        false
    );
-- Question 6: Safety management system components
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Key components of a Safety Management System include:',
        4,
        2
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Policy, procedures, training, and continuous improvement',
        @question_id,
        true
    ),
    ('Only written procedures', @question_id, false),
    ('Just incident reporting', @question_id, false),
    ('Only management oversight', @question_id, false);
-- Question 7: Hazard identification
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Hazard identification is the responsibility of:',
        4,
        2
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'All personnel in the organization',
        @question_id,
        true
    ),
    ('Only safety managers', @question_id, false),
    (
        'Only pilots and air traffic controllers',
        @question_id,
        false
    ),
    (
        'Only maintenance personnel',
        @question_id,
        false
    );
-- Question 8: Safety reporting
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Safety reporting should be:',
        4,
        2
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Encouraged and non-punitive',
        @question_id,
        true
    ),
    (
        'Only for serious incidents',
        @question_id,
        false
    ),
    (
        'Punitive to discourage mistakes',
        @question_id,
        false
    ),
    ('Optional for employees', @question_id, false);
-- Question 9: Safety culture
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'A positive safety culture is characterized by:',
        4,
        2
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Open communication and learning from errors',
        @question_id,
        true
    ),
    (
        'Blame and punishment for mistakes',
        @question_id,
        false
    ),
    (
        'Keeping safety issues confidential',
        @question_id,
        false
    ),
    (
        'Only focusing on compliance',
        @question_id,
        false
    );
-- Question 10: Risk management
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Effective risk management involves:',
        4,
        2
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Identifying, assessing, and mitigating risks',
        @question_id,
        true
    ),
    ('Ignoring minor risks', @question_id, false),
    (
        'Only addressing risks after incidents',
        @question_id,
        false
    ),
    (
        'Delegating all risk decisions to management',
        @question_id,
        false
    );
-- Question 11: Safety training
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Safety training should be:',
        4,
        2
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Regular, relevant, and competency-based',
        @question_id,
        true
    ),
    (
        'Only when new employees join',
        @question_id,
        false
    ),
    (
        'Optional for experienced staff',
        @question_id,
        false
    ),
    (
        'Only theoretical without practical application',
        @question_id,
        false
    );
-- Question 12: Continuous improvement
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Continuous improvement in safety requires:',
        4,
        2
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Regular review and updating of safety processes',
        @question_id,
        true
    ),
    (
        'Maintaining the same procedures indefinitely',
        @question_id,
        false
    ),
    (
        'Only changing procedures after accidents',
        @question_id,
        false
    ),
    (
        'Avoiding any changes to established practices',
        @question_id,
        false
    );
-- Question 13: Safety performance indicators
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Safety performance indicators should measure:',
        4,
        2
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Both leading and lagging safety indicators',
        @question_id,
        true
    ),
    ('Only accident rates', @question_id, false),
    (
        'Only compliance with regulations',
        @question_id,
        false
    ),
    (
        'Only management satisfaction',
        @question_id,
        false
    );
-- Question 14: Emergency response
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'In emergency situations, personnel should:',
        4,
        2
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Follow established emergency procedures',
        @question_id,
        true
    ),
    (
        'Make decisions independently',
        @question_id,
        false
    ),
    (
        'Wait for management instructions',
        @question_id,
        false
    ),
    (
        'Ignore procedures if they seem unnecessary',
        @question_id,
        false
    );
-- Question 15: Safety communication
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Effective safety communication includes:',
        4,
        2
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Clear, timely, and two-way communication',
        @question_id,
        true
    ),
    (
        'Only top-down instructions',
        @question_id,
        false
    ),
    (
        'Informal verbal communication only',
        @question_id,
        false
    ),
    (
        'Written communication only',
        @question_id,
        false
    );
-- Question 16: Safety oversight
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Safety oversight responsibilities include:',
        4,
        2
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Monitoring, auditing, and ensuring compliance',
        @question_id,
        true
    ),
    (
        'Only investigating accidents',
        @question_id,
        false
    ),
    (
        'Only writing safety procedures',
        @question_id,
        false
    ),
    (
        'Only training new employees',
        @question_id,
        false
    );
-- Question 17: Human factors
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Human factors in aviation safety refer to:',
        4,
        2
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'The interaction between humans and systems',
        @question_id,
        true
    ),
    ('Only pilot errors', @question_id, false),
    ('Only mechanical failures', @question_id, false),
    ('Only weather conditions', @question_id, false);
-- Question 18: Safety data analysis
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Safety data analysis helps organizations:',
        4,
        2
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Identify trends and prevent future incidents',
        @question_id,
        true
    ),
    ('Only document past events', @question_id, false),
    (
        'Only meet regulatory requirements',
        @question_id,
        false
    ),
    (
        'Only assign blame for incidents',
        @question_id,
        false
    );
-- Question 19: Safety leadership
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Safety leadership involves:',
        4,
        2
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'Demonstrating commitment and setting examples',
        @question_id,
        true
    ),
    ('Only enforcing rules', @question_id, false),
    (
        'Only conducting inspections',
        @question_id,
        false
    ),
    ('Only managing budgets', @question_id, false);
-- Question 20: Safety integration
INSERT INTO assessment_questions (text, options_to_present, assessment_id)
VALUES (
        'Safety should be integrated into:',
        4,
        2
    );
SET @question_id = LAST_INSERT_ID();
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES (
        'All organizational activities and decisions',
        @question_id,
        true
    ),
    (
        'Only operational procedures',
        @question_id,
        false
    ),
    ('Only training programs', @question_id, false),
    (
        'Only incident investigations',
        @question_id,
        false
    );
-- Update the assessment to reflect the new question count
UPDATE course_assessments
SET question_count = 20,
    questions_to_present = 20
WHERE id = 2;