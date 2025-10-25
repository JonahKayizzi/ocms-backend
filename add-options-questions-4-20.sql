-- Add options for questions 4-20
-- Question 4: The responsibilities individuals hold in aviation safety depend on:
INSERT INTO question_options (option_text, question_id, is_correct) VALUES
('Their salary and working hours', 4, 0),
('Their position/title and level of involvement in SMS', 4, 1),
('Their years of service only', 4, 0),
('Their department location', 4, 0);

-- Question 5: Safety responsibilities are generally categorized into:
INSERT INTO question_options (option_text, question_id, is_correct) VALUES
('Administrative and technical', 5, 0),
('Operational and financial', 5, 0),
('Individual and collective', 5, 1),
('Preventive and corrective', 5, 0);

-- Question 6: Staff in aviation organizations may have:
INSERT INTO question_options (option_text, question_id, is_correct) VALUES
('Only individual safety responsibilities', 6, 0),
('Only collective safety responsibilities', 6, 0),
('Either individual, collective, or both', 6, 1),
('No defined responsibilities', 6, 0);

-- Question 7: Which of the following is an individual safety responsibility?
INSERT INTO question_options (option_text, question_id, is_correct) VALUES
('Participating in the Safety Review Committee', 7, 0),
('Safety reporting', 7, 1),
('Runway Safety Team participation', 7, 0),
('Serving on a management team', 7, 0);

-- Question 8: Individual safety responsibilities are characterized by:
INSERT INTO question_options (option_text, question_id, is_correct) VALUES
('Needing at least two people', 8, 0),
('Being fully executable by one person', 8, 1),
('Always requiring committee approval', 8, 0),
('Only being performed by managers', 8, 0);

-- Question 9: An example of individual safety responsibility is:
INSERT INTO question_options (option_text, question_id, is_correct) VALUES
('CAP development', 9, 1),
('Safety Action Group membership', 9, 0),
('Runway Safety Team work', 9, 0),
('Serving in Safety Assessment Team', 9, 0);

-- Question 10: Collective safety responsibilities require:
INSERT INTO question_options (option_text, question_id, is_correct) VALUES
('One person''s input only', 10, 0),
('At least two individuals'' involvement', 10, 1),
('Delegation to external agencies', 10, 0),
('Only pilot participation', 10, 0);

-- Question 11: Collective safety responsibilities are further classified into:
INSERT INTO question_options (option_text, question_id, is_correct) VALUES
('Direct and indirect', 11, 0),
('Team and individualized (jigsaw-type)', 11, 1),
('Short-term and long-term', 11, 0),
('Mandatory and voluntary', 11, 0);

-- Question 12: Collective-Team Safety Responsibilities are assigned to:
INSERT INTO question_options (option_text, question_id, is_correct) VALUES
('A single officer', 12, 0),
('Groups or committees', 12, 1),
('Outsourced consultants', 12, 0),
('Individual contractors', 12, 0);

-- Question 13: Which of the following is a Collective-Team Safety Responsibility?
INSERT INTO question_options (option_text, question_id, is_correct) VALUES
('Developing an individual CAP', 13, 0),
('Safety Review Committee (SRC) participation', 13, 1),
('Writing personal safety reports', 13, 0),
('Personal compliance with safety training', 13, 0);

-- Question 14: A key feature of Collective-Team responsibilities is:
INSERT INTO question_options (option_text, question_id, is_correct) VALUES
('They can be assumed by one person alone', 14, 0),
('They require participation of all team members', 14, 1),
('They are optional for most staff', 14, 0),
('They are external to SMS', 14, 0);

-- Question 15: Examples of Collective-Team structures include:
INSERT INTO question_options (option_text, question_id, is_correct) VALUES
('Safety Action Group (SAG)', 15, 1),
('Personal safety reporting', 15, 0),
('Individual risk assessments', 15, 0),
('Private consultant teams', 15, 0);

-- Question 16: Which ICAO document provides guidance on safety committees in SMS?
INSERT INTO question_options (option_text, question_id, is_correct) VALUES
('ICAO Annex 13', 16, 0),
('ICAO Doc 4444', 16, 0),
('ICAO Doc 9859', 16, 1),
('ICAO Doc 9734', 16, 0);

-- Question 17: Collective-Individualized (Jigsaw-type) responsibilities involve:
INSERT INTO question_options (option_text, question_id, is_correct) VALUES
('A formal, structured team', 17, 0),
('At least two persons with different individual roles', 17, 1),
('A single manager completing all work', 17, 0),
('Outsourcing to safety inspectors', 17, 0);

-- Question 18: In Collective-Individualized responsibilities, each staff member:
INSERT INTO question_options (option_text, question_id, is_correct) VALUES
('Must work together as one group', 18, 0),
('Completes a unique role separately', 18, 1),
('Duplicates another''s role', 18, 0),
('Has no defined duties', 18, 0);

-- Question 19: The "jigsaw-type" safety responsibilities are unique because:
INSERT INTO question_options (option_text, question_id, is_correct) VALUES
('They eliminate collaboration', 19, 0),
('They need input from at least two people, but not as a formal team', 19, 1),
('They require only one person to finish', 19, 0),
('They are the same as team responsibilities', 19, 0);

-- Question 20: Which of the following best summarizes aviation safety responsibility?
INSERT INTO question_options (option_text, question_id, is_correct) VALUES
('It is optional for non-technical staff', 20, 0),
('It is the sole duty of management', 20, 0),
('It requires both individual and collective efforts', 20, 1),
('It is only the regulator''s mandate', 20, 0);
