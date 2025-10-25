-- Add options for questions 5-20
-- Question 5: Individual responsibilities in aviation safety include:
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES 
    ('Following procedures and reporting hazards', 5, true),
    ('Only following procedures', 5, false),
    ('Only reporting hazards', 5, false),
    ('None of the above', 5, false);

-- Question 6: The collective responsibility approach means:
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES 
    ('Everyone shares responsibility for safety outcomes', 6, true),
    ('Only managers are responsible for safety', 6, false),
    ('Safety is the regulator\'s job', 6, false),
    ('Individual performance doesn\'t matter', 6, false);

-- Question 7: Key components of a Safety Management System include:
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES 
    ('Policy, procedures, and continuous improvement', 7, true),
    ('Only policy documents', 7, false),
    ('Only training programs', 7, false),
    ('Only incident reporting', 7, false);

-- Question 8: Hazard identification is the responsibility of:
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES 
    ('All personnel in the organization', 8, true),
    ('Only safety managers', 8, false),
    ('Only pilots', 8, false),
    ('Only maintenance staff', 8, false);

-- Question 9: Safety reporting should be:
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES 
    ('Encouraged and non-punitive', 9, true),
    ('Punitive to maintain discipline', 9, false),
    ('Optional for senior staff', 9, false),
    ('Only for major incidents', 9, false);

-- Question 10: A positive safety culture is characterized by:
INSERT INTO question_options (option_text, question_id, is_correct)
VALUES 
    ('Open communication and learning from errors', 10, true),
    ('Blame and punishment for mistakes', 10, false),
    ('Minimal reporting requirements', 10, false),
    ('Top-down decision making only', 10, false);
