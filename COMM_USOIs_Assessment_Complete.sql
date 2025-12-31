-- SQL Script to Insert COMM (USOIs) OJT Assessment 2025/2026
-- Complete batch insert for assessment, questions, and options

START TRANSACTION;

-- Step 1: Insert the Assessment
INSERT INTO course_assessments (
    name, description, questions_to_present, question_count, course_id,
    show_answers, max_retries, timing_mode, time_limit, status
) VALUES (
    'COMM (USOIs) OJT Assessment 2025/2026',
    'This assessment evaluates knowledge and competency in Communication Operations based on the Communication Unit Standard Operating Instructions (COM USOIs) 2025. It covers HF Radiotelephony, AFTN operations, AMHS procedures, flight plan handling, VVIP coordination, and general communication protocols essential for safe and efficient air traffic communication services.',
    100,
    100,
    NULL,
    TRUE,
    3,
    'none',
    30,
    1
);

SET @assessment_id = LAST_INSERT_ID();

-- Step 2: Insert all 100 Questions
INSERT INTO assessment_questions (assessment_id, text, options_to_present) VALUES
(@assessment_id, 'The primary purpose of Radiotelephony (RTF) is to:', 4),
(@assessment_id, 'Which ICAO Annex is emphasized for HF communication procedures?', 4),
(@assessment_id, 'The HF frequency used for North & East FIRs is:', 4),
(@assessment_id, 'The HF frequency used for West FIRs is:', 4),
(@assessment_id, 'ESTIMATES received from ACC are recorded on which form?', 4),
(@assessment_id, 'ESTIMATES must be transmitted to upcountry stations using:', 4),
(@assessment_id, 'All ESTIMATES transmitted must be signed on the worksheet by the:', 4),
(@assessment_id, 'Communication with aircraft in flight involves receiving:', 4),
(@assessment_id, 'Ground aeronautical station communication includes stations such as:', 4),
(@assessment_id, 'Before transmitting on HF, the operator must:', 4),
(@assessment_id, 'The recommended pause before a second HF call is:', 4),
(@assessment_id, 'Maximum recommended speaking rate is:', 4),
(@assessment_id, 'Which of the following is a common HF mistake?', 4),
(@assessment_id, '"Over" in radiotelephony means:', 4),
(@assessment_id, 'All information from aircraft must be passed to:', 4),
(@assessment_id, 'HF coordination with upcountry airfields uses which frequency?', 4),
(@assessment_id, 'Regular HF readability checks are conducted at:', 4),
(@assessment_id, 'If HF communication fails, messages should be passed via:', 4),
(@assessment_id, 'Arriving aircraft information must be relayed to:', 4),
(@assessment_id, 'Departure information includes all EXCEPT:', 4),
(@assessment_id, 'VVIP ATS messages must be handled with:', 4),
(@assessment_id, 'VVIP messages must be monitored using:', 4),
(@assessment_id, 'Messages received on HF must be passed immediately to:', 4),
(@assessment_id, 'All VVIP estimates must be transmitted on:', 4),
(@assessment_id, 'Confidentiality of VVIP flight data must be ensured on a:', 4),
(@assessment_id, 'Erroneous flight plans received must be:', 4),
(@assessment_id, 'MET messages received on AFTN must be:', 4),
(@assessment_id, 'Messages to Air Transport Department must be sent via:', 4),
(@assessment_id, 'Equipment malfunctions must be reported to:', 4),
(@assessment_id, 'Circuit unserviceability must be reported to:', 4),
(@assessment_id, 'Green channel state indicates:', 4),
(@assessment_id, 'Red channel state indicates:', 4),
(@assessment_id, 'System Events Service is accessed via:', 4),
(@assessment_id, 'Alarm (ALA) turning red indicates:', 4),
(@assessment_id, 'Reduction in message flow may indicate:', 4),
(@assessment_id, 'Erroneous FPLs appear in the:', 4),
(@assessment_id, 'Erroneous FPL fields are marked with:', 4),
(@assessment_id, 'The DIVERT function is used to:', 4),
(@assessment_id, 'SID and STAR are used to define:', 4),
(@assessment_id, 'DCT is used when:', 4),
(@assessment_id, 'FDD access requires:', 4),
(@assessment_id, 'Supervisor role displays which queues?', 4),
(@assessment_id, 'Green filter button indicates:', 4),
(@assessment_id, 'Channel checks are sent every:', 4),
(@assessment_id, 'If both lines are OFF, messages are:', 4),
(@assessment_id, 'AMHS interface is divided into how many sections?', 4),
(@assessment_id, 'The Navigation Panel is located on the:', 4),
(@assessment_id, 'SS Alarms display messages with priority:', 4),
(@assessment_id, 'Outbox contains messages that are:', 4),
(@assessment_id, 'Probes are used to:', 4),
(@assessment_id, 'Draft messages are created when you:', 4),
(@assessment_id, 'Deleted messages are moved to:', 4),
(@assessment_id, 'Group Inbox allows viewing messages:', 4),
(@assessment_id, 'Repeat TSI/CSN range is used when:', 4),
(@assessment_id, 'Maintenance Shelf shows:', 4),
(@assessment_id, 'USOIs must be used in conjunction with:', 4),
(@assessment_id, 'The revision date of the document is:', 4),
(@assessment_id, 'The document is classified as:', 4),
(@assessment_id, 'Controlled documents must be checked against:', 4),
(@assessment_id, 'The Communication Centre AFTN address is:', 4),
(@assessment_id, 'All communications must be logged in:', 4),
(@assessment_id, 'Loss of communication requires use of:', 4),
(@assessment_id, 'VVIP telephones are referred to:', 4),
(@assessment_id, 'The IDD facility is strictly for:', 4),
(@assessment_id, 'Adjacent FIRs can be contacted via:', 4),
(@assessment_id, 'When HF readability is poor, the operator should first:', 4),
(@assessment_id, 'HF transmissions should avoid background noise by:', 4),
(@assessment_id, 'The correct sequence before transmitting an HF message is:', 4),
(@assessment_id, 'When an aircraft reports a change of level, the information must be passed immediately to:', 4),
(@assessment_id, 'HF messages should be logged immediately after:', 4),
(@assessment_id, 'When two aircraft transmit simultaneously on HF, the operator should:', 4),
(@assessment_id, 'HF call signs must always include:', 4),
(@assessment_id, 'The phrase "SAY AGAIN" is used when:', 4),
(@assessment_id, 'The phrase "CORRECTION" is used to:', 4),
(@assessment_id, 'Which of the following should NOT be used in HF communications?', 4),
(@assessment_id, 'When an AFTN message fails to transmit, the operator should first:', 4),
(@assessment_id, 'If both primary and standby AFTN lines fail, traffic should be passed via:', 4),
(@assessment_id, 'During AFTN degradation, priority should be given to:', 4),
(@assessment_id, 'System alarms changing from green to red indicate:', 4),
(@assessment_id, 'AMHS probes are primarily used to:', 4),
(@assessment_id, 'Messages marked "SS" require handling with:', 4),
(@assessment_id, 'Group inbox functionality allows operators to:', 4),
(@assessment_id, 'Erroneous flight plans detected in the system must be:', 4),
(@assessment_id, 'When correcting an FPL, care must be taken to ensure:', 4),
(@assessment_id, 'The DIVERT function is mainly used to:', 4),
(@assessment_id, 'Confidential operational information should be shared:', 4),
(@assessment_id, 'VVIP flight information must be handled with emphasis on:', 4),
(@assessment_id, 'Logs and records are maintained primarily for:', 4),
(@assessment_id, 'All operational communications must be logged using:', 4),
(@assessment_id, 'Alterations in logbooks should be:', 4),
(@assessment_id, 'Before handing over watch, the outgoing operator must:', 4),
(@assessment_id, 'Watch handover must include information on:', 4),
(@assessment_id, 'Failure to follow COM USOIs procedures may result in:', 4),
(@assessment_id, 'Standard Operating Instructions are intended to:', 4),
(@assessment_id, 'Compliance with COM USOIs is the responsibility of:', 4),
(@assessment_id, 'Updates to controlled documents must be authorized by:', 4),
(@assessment_id, 'Obsolete copies of controlled documents should be:', 4),
(@assessment_id, 'Operational discipline in communications mainly supports:', 4),
(@assessment_id, 'Incorrect phraseology may lead to:', 4),
(@assessment_id, 'The ultimate objective of COM USOIs 2025 is to ensure:', 4);

-- Step 3: Create temporary table to map question numbers to IDs
CREATE TEMPORARY TABLE temp_question_ids AS
SELECT
    id,
    ROW_NUMBER() OVER (ORDER BY id) as qn_num
FROM assessment_questions
WHERE assessment_id = @assessment_id
ORDER BY id;

-- Step 4: Insert Options for all questions
-- Question 1 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Reduce message traffic' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 1 UNION ALL
    SELECT id, 'Assist safe and expeditious aircraft operations' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 1 UNION ALL
    SELECT id, 'Replace data link communication' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 1 UNION ALL
    SELECT id, 'Improve commercial efficiency' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 1
) AS opts;

-- Question 2 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Annex 2' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 2 UNION ALL
    SELECT id, 'Annex 6' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 2 UNION ALL
    SELECT id, 'Annex 10 Volume II Chapter 5' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 2 UNION ALL
    SELECT id, 'Annex 15' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 2
) AS opts;

-- Question 3 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, '8903 kHz' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 3 UNION ALL
    SELECT id, '7638.5 kHz' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 3 UNION ALL
    SELECT id, '11300 kHz' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 3 UNION ALL
    SELECT id, '6589 kHz' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 3
) AS opts;

-- Question 4 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, '11300 kHz' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 4 UNION ALL
    SELECT id, '8903 kHz' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 4 UNION ALL
    SELECT id, '7638.5 kHz' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 4 UNION ALL
    SELECT id, '6589 kHz' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 4
) AS opts;

-- Question 5 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'CAA/DANS/AIM/OF/22' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 5 UNION ALL
    SELECT id, 'CAA/DANS/AIM/OF/58' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 5 UNION ALL
    SELECT id, 'ICAO Form 4444' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 5 UNION ALL
    SELECT id, 'ATS Flight Progress Strip' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 5
) AS opts;

-- Question 6 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Telephone only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 6 UNION ALL
    SELECT id, 'VHF' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 6 UNION ALL
    SELECT id, 'HF radio' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 6 UNION ALL
    SELECT id, 'Email' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 6
) AS opts;

-- Question 7 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'ACC Controller' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 7 UNION ALL
    SELECT id, 'MET Officer' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 7 UNION ALL
    SELECT id, 'AIMO COM' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 7 UNION ALL
    SELECT id, 'Supervisor only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 7
) AS opts;

-- Question 8 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'METAR only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 8 UNION ALL
    SELECT id, 'ESTIMATES and level changes' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 8 UNION ALL
    SELECT id, 'NOTAMs' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 8 UNION ALL
    SELECT id, 'Flight permits' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 8
) AS opts;

-- Question 9 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Addis Ababa only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 9 UNION ALL
    SELECT id, 'Khartoum, Nairobi, Juba' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 9 UNION ALL
    SELECT id, 'Lagos and Accra' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 9 UNION ALL
    SELECT id, 'Cairo only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 9
) AS opts;

-- Question 10 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Call immediately' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 10 UNION ALL
    SELECT id, 'Listen to ensure frequency is clear' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 10 UNION ALL
    SELECT id, 'Increase volume' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 10 UNION ALL
    SELECT id, 'Repeat message twice' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 10
) AS opts;

-- Question 11 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, '5 seconds' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 11 UNION ALL
    SELECT id, '10 seconds' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 11 UNION ALL
    SELECT id, '15 seconds' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 11 UNION ALL
    SELECT id, '30 seconds' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 11
) AS opts;

-- Question 12 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, '60 words per minute' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 12 UNION ALL
    SELECT id, '80 words per minute' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 12 UNION ALL
    SELECT id, '100 words per minute' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 12 UNION ALL
    SELECT id, '120 words per minute' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 12
) AS opts;

-- Question 13 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Using ICAO phraseology' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 13 UNION ALL
    SELECT id, 'Speaking clearly' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 13 UNION ALL
    SELECT id, 'Using plain language' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 13 UNION ALL
    SELECT id, 'Logging messages' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 13
) AS opts;

-- Question 14 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Message ended, no reply expected' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 14 UNION ALL
    SELECT id, 'Transmission finished, reply expected' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 14 UNION ALL
    SELECT id, 'Repeat message' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 14 UNION ALL
    SELECT id, 'End of communication' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 14
) AS opts;

-- Question 15 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'MET' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 15 UNION ALL
    SELECT id, 'CNS' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 15 UNION ALL
    SELECT id, 'ACC' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 15 UNION ALL
    SELECT id, 'Administration' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 15
) AS opts;

-- Question 16 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, '11300 kHz' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 16 UNION ALL
    SELECT id, '8903 kHz' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 16 UNION ALL
    SELECT id, '7638.5 kHz' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 16 UNION ALL
    SELECT id, '6589 kHz' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 16
) AS opts;

-- Question 17 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, '0000, 0600, 1200 UTC' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 17 UNION ALL
    SELECT id, '0600, 0900, 1200 UTC' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 17 UNION ALL
    SELECT id, '0900, 1200, 1500 UTC' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 17 UNION ALL
    SELECT id, '1200, 1800, 0000 UTC' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 17
) AS opts;

-- Question 18 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Email' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 18 UNION ALL
    SELECT id, 'AFTN only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 18 UNION ALL
    SELECT id, 'Telephone' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 18 UNION ALL
    SELECT id, 'Fax' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 18
) AS opts;

-- Question 19 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'MET' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 19 UNION ALL
    SELECT id, 'ACC' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 19 UNION ALL
    SELECT id, 'Administration' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 19 UNION ALL
    SELECT id, 'Airline' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 19
) AS opts;

-- Question 20 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Departure time' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 20 UNION ALL
    SELECT id, 'Persons on board' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 20 UNION ALL
    SELECT id, 'Aircraft weight' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 20 UNION ALL
    SELECT id, 'ETA' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 20
) AS opts;

-- Question 21 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Normal priority' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 21 UNION ALL
    SELECT id, 'Reduced vigilance' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 21 UNION ALL
    SELECT id, 'Extra vigilance and speed' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 21 UNION ALL
    SELECT id, 'Supervisor approval' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 21
) AS opts;

-- Question 22 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Error counters only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 22 UNION ALL
    SELECT id, 'Erroneous and free text counters' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 22 UNION ALL
    SELECT id, 'Inbox only' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 22 UNION ALL
    SELECT id, 'Draft folder' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 22
) AS opts;

-- Question 23 (Answer: A)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'MET' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 23 UNION ALL
    SELECT id, 'CNS' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 23 UNION ALL
    SELECT id, 'ACC' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 23 UNION ALL
    SELECT id, 'AIS Library' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 23
) AS opts;

-- Question 24 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'HF only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 24 UNION ALL
    SELECT id, 'Telephone only' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 24 UNION ALL
    SELECT id, 'AMHS' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 24 UNION ALL
    SELECT id, 'Email' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 24
) AS opts;

-- Question 25 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Public basis' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 25 UNION ALL
    SELECT id, 'Need-to-know basis' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 25 UNION ALL
    SELECT id, 'Supervisor basis' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 25 UNION ALL
    SELECT id, 'Administrative basis' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 25
) AS opts;

-- Question 26 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Deleted' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 26 UNION ALL
    SELECT id, 'Ignored' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 26 UNION ALL
    SELECT id, 'Corrected immediately' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 26 UNION ALL
    SELECT id, 'Archived' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 26
) AS opts;

-- Question 27 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Stored only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 27 UNION ALL
    SELECT id, 'Delivered without delay' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 27 UNION ALL
    SELECT id, 'Printed weekly' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 27 UNION ALL
    SELECT id, 'Sent by email' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 27
) AS opts;

-- Question 28 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'AFTN' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 28 UNION ALL
    SELECT id, 'AMHS only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 28 UNION ALL
    SELECT id, 'Email' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 28 UNION ALL
    SELECT id, 'Fax' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 28
) AS opts;

-- Question 29 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'MET' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 29 UNION ALL
    SELECT id, 'Administration' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 29 UNION ALL
    SELECT id, 'CNS' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 29 UNION ALL
    SELECT id, 'ATC' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 29
) AS opts;

-- Question 30 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'ACC' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 30 UNION ALL
    SELECT id, 'UTL' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 30 UNION ALL
    SELECT id, 'ICAO' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 30 UNION ALL
    SELECT id, 'Airline' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 30
) AS opts;

-- Question 31 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Line failure' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 31 UNION ALL
    SELECT id, 'Reduced traffic' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 31 UNION ALL
    SELECT id, 'Line serviceable' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 31 UNION ALL
    SELECT id, 'Alarm active' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 31
) AS opts;

-- Question 32 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Normal operation' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 32 UNION ALL
    SELECT id, 'Line unserviceable' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 32 UNION ALL
    SELECT id, 'Low priority traffic' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 32 UNION ALL
    SELECT id, 'Maintenance mode' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 32
) AS opts;

-- Question 33 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Messaging' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 33 UNION ALL
    SELECT id, 'System Message' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 33 UNION ALL
    SELECT id, 'Inbox' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 33 UNION ALL
    SELECT id, 'Reports' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 33
) AS opts;

-- Question 34 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Message sent' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 34 UNION ALL
    SELECT id, 'System fault' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 34 UNION ALL
    SELECT id, 'User logout' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 34 UNION ALL
    SELECT id, 'Normal operation' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 34
) AS opts;

-- Question 35 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Increased traffic' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 35 UNION ALL
    SELECT id, 'AFTN line failure' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 35 UNION ALL
    SELECT id, 'System upgrade' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 35 UNION ALL
    SELECT id, 'Operator error' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 35
) AS opts;

-- Question 36 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Sent folder' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 36 UNION ALL
    SELECT id, 'Free text pane' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 36 UNION ALL
    SELECT id, 'Flight Plan Correction Queue' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 36 UNION ALL
    SELECT id, 'Outbox' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 36
) AS opts;

-- Question 37 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Yellow background' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 37 UNION ALL
    SELECT id, 'Blue icon' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 37 UNION ALL
    SELECT id, 'Red icon' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 37 UNION ALL
    SELECT id, 'Green tick' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 37
) AS opts;

-- Question 38 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Delete FPL' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 38 UNION ALL
    SELECT id, 'Correct route' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 38 UNION ALL
    SELECT id, 'Divert message to AMHS' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 38 UNION ALL
    SELECT id, 'Save draft' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 38
) AS opts;

-- Question 39 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Aircraft type' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 39 UNION ALL
    SELECT id, 'Departure and arrival procedures' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 39 UNION ALL
    SELECT id, 'Weather conditions' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 39 UNION ALL
    SELECT id, 'Airspace class' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 39
) AS opts;

-- Question 40 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'STAR exists' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 40 UNION ALL
    SELECT id, 'SID exists' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 40 UNION ALL
    SELECT id, 'No valid airway exists' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 40 UNION ALL
    SELECT id, 'Route is international' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 40
) AS opts;

-- Question 41 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Supervisor permission only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 41 UNION ALL
    SELECT id, 'Authorized ID and password' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 41 UNION ALL
    SELECT id, 'AMHS login' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 41 UNION ALL
    SELECT id, 'ACC clearance' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 41
) AS opts;

-- Question 42 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'MET and NOTAM' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 42 UNION ALL
    SELECT id, 'ALR, AFTN, COOR, EAH' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 42 UNION ALL
    SELECT id, 'Inbox only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 42 UNION ALL
    SELECT id, 'Drafts only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 42
) AS opts;

-- Question 43 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Filter inactive' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 43 UNION ALL
    SELECT id, 'Filter active' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 43 UNION ALL
    SELECT id, 'Line down' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 43 UNION ALL
    SELECT id, 'Alarm active' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 43
) AS opts;

-- Question 44 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, '10 minutes' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 44 UNION ALL
    SELECT id, '15 minutes' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 44 UNION ALL
    SELECT id, '20 minutes' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 44 UNION ALL
    SELECT id, '30 minutes' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 44
) AS opts;

-- Question 45 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Delayed' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 45 UNION ALL
    SELECT id, 'Stored' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 45 UNION ALL
    SELECT id, 'Not transmitted' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 45 UNION ALL
    SELECT id, 'Rerouted automatically' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 45
) AS opts;

-- Question 46 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Two' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 46 UNION ALL
    SELECT id, 'Three' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 46 UNION ALL
    SELECT id, 'Four' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 46 UNION ALL
    SELECT id, 'Five' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 46
) AS opts;

-- Question 47 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Right side' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 47 UNION ALL
    SELECT id, 'Left side' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 47 UNION ALL
    SELECT id, 'Top' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 47 UNION ALL
    SELECT id, 'Bottom' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 47
) AS opts;

-- Question 48 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'FF' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 48 UNION ALL
    SELECT id, 'GG' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 48 UNION ALL
    SELECT id, 'SS' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 48 UNION ALL
    SELECT id, 'DD' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 48
) AS opts;

-- Question 49 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Received' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 49 UNION ALL
    SELECT id, 'Deleted' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 49 UNION ALL
    SELECT id, 'Waiting to be transmitted' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 49 UNION ALL
    SELECT id, 'Archived' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 49
) AS opts;

-- Question 50 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Send NOTAMs' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 50 UNION ALL
    SELECT id, 'Test message transfer' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 50 UNION ALL
    SELECT id, 'Create FPLs' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 50 UNION ALL
    SELECT id, 'Archive messages' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 50
) AS opts;

-- Question 51 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Close the window' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 51 UNION ALL
    SELECT id, 'Click Save as Draft' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 51 UNION ALL
    SELECT id, 'Logout' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 51 UNION ALL
    SELECT id, 'Send message' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 51
) AS opts;

-- Question 52 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Inbox' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 52 UNION ALL
    SELECT id, 'Archive' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 52 UNION ALL
    SELECT id, 'Deleted folder' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 52 UNION ALL
    SELECT id, 'Reports' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 52
) AS opts;

-- Question 53 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Sent only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 53 UNION ALL
    SELECT id, 'Received by a group' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 53 UNION ALL
    SELECT id, 'Draft only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 53 UNION ALL
    SELECT id, 'Deleted only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 53
) AS opts;

-- Question 54 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Messages are delayed' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 54 UNION ALL
    SELECT id, 'Messages fail to be received' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 54 UNION ALL
    SELECT id, 'Lines are serviceable' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 54 UNION ALL
    SELECT id, 'User logs out' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 54
) AS opts;

-- Question 55 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Message content' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 55 UNION ALL
    SELECT id, 'Line status' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 55 UNION ALL
    SELECT id, 'User accounts' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 55 UNION ALL
    SELECT id, 'Reports' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 55
) AS opts;

-- Question 56 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Annex 15' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 56 UNION ALL
    SELECT id, 'MANSOPS Part III' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 56 UNION ALL
    SELECT id, 'Annex 3' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 56 UNION ALL
    SELECT id, 'AIP only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 56
) AS opts;

-- Question 57 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, '2022' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 57 UNION ALL
    SELECT id, '2023' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 57 UNION ALL
    SELECT id, 'September 2025' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 57 UNION ALL
    SELECT id, 'January 2025' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 57
) AS opts;

-- Question 58 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Uncontrolled' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 58 UNION ALL
    SELECT id, 'Draft' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 58 UNION ALL
    SELECT id, 'Controlled' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 58 UNION ALL
    SELECT id, 'Advisory' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 58
) AS opts;

-- Question 59 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'ICAO website' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 59 UNION ALL
    SELECT id, 'Master documents list' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 59 UNION ALL
    SELECT id, 'AIM library' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 59 UNION ALL
    SELECT id, 'Supervisor notes' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 59
) AS opts;

-- Question 60 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'HUENYNYX' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 60 UNION ALL
    SELECT id, 'HUENYFYX' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 60 UNION ALL
    SELECT id, 'HUENZQZX' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 60 UNION ALL
    SELECT id, 'HUECZQZX' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 60
) AS opts;

-- Question 61 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Notebook only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 61 UNION ALL
    SELECT id, 'AMS/AFTN logbooks' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 61 UNION ALL
    SELECT id, 'Email' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 61 UNION ALL
    SELECT id, 'Draft folder' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 61
) AS opts;

-- Question 62 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Email' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 62 UNION ALL
    SELECT id, 'Telephone' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 62 UNION ALL
    SELECT id, 'Fax' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 62 UNION ALL
    SELECT id, 'Courier' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 62
) AS opts;

-- Question 63 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'AIM' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 63 UNION ALL
    SELECT id, 'CNS' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 63 UNION ALL
    SELECT id, 'ACC or Tower' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 63 UNION ALL
    SELECT id, 'Administration' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 63
) AS opts;

-- Question 64 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Personal calls' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 64 UNION ALL
    SELECT id, 'Administrative use' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 64 UNION ALL
    SELECT id, 'Operational use' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 64 UNION ALL
    SELECT id, 'Training' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 64
) AS opts;

-- Question 65 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'SMS' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 65 UNION ALL
    SELECT id, 'IDD' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 65 UNION ALL
    SELECT id, 'Fax' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 65 UNION ALL
    SELECT id, 'Courier' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 65
) AS opts;

-- Question 66 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Increase transmission speed' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 66 UNION ALL
    SELECT id, 'Change to plain language' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 66 UNION ALL
    SELECT id, 'Repeat the message slowly' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 66 UNION ALL
    SELECT id, 'Cancel the transmission' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 66
) AS opts;

-- Question 67 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Speaking louder' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 67 UNION ALL
    SELECT id, 'Turning off nearby equipment' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 67 UNION ALL
    SELECT id, 'Using longer messages' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 67 UNION ALL
    SELECT id, 'Repeating continuously' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 67
) AS opts;

-- Question 68 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Call–Transmit–Listen' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 68 UNION ALL
    SELECT id, 'Listen–Call–Transmit' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 68 UNION ALL
    SELECT id, 'Transmit–Call–Listen' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 68 UNION ALL
    SELECT id, 'Call–Listen–Transmit' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 68
) AS opts;

-- Question 69 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'MET' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 69 UNION ALL
    SELECT id, 'CNS' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 69 UNION ALL
    SELECT id, 'ACC' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 69 UNION ALL
    SELECT id, 'Administration' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 69
) AS opts;

-- Question 70 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Drafting' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 70 UNION ALL
    SELECT id, 'Transmission or reception' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 70 UNION ALL
    SELECT id, 'Printing' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 70 UNION ALL
    SELECT id, 'Supervisor review' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 70
) AS opts;

-- Question 71 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Ignore both transmissions' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 71 UNION ALL
    SELECT id, 'Ask both aircraft to repeat' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 71 UNION ALL
    SELECT id, 'Respond to the clearer transmission first' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 71 UNION ALL
    SELECT id, 'Switch off the transmitter' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 71
) AS opts;

-- Question 72 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Aircraft registration only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 72 UNION ALL
    SELECT id, 'Station name and aircraft call sign' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 72 UNION ALL
    SELECT id, 'Aircraft type' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 72 UNION ALL
    SELECT id, 'Flight level' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 72
) AS opts;

-- Question 73 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Message is incomplete' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 73 UNION ALL
    SELECT id, 'Message is unclear or not received' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 73 UNION ALL
    SELECT id, 'Message is incorrect' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 73 UNION ALL
    SELECT id, 'Transmission is finished' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 73
) AS opts;

-- Question 74 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Cancel a message' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 74 UNION ALL
    SELECT id, 'Amend a previously transmitted error' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 74 UNION ALL
    SELECT id, 'End transmission' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 74 UNION ALL
    SELECT id, 'Confirm reception' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 74
) AS opts;

-- Question 75 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'ICAO standard phraseology' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 75 UNION ALL
    SELECT id, 'Plain language where necessary' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 75 UNION ALL
    SELECT id, 'Slang or informal language' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 75 UNION ALL
    SELECT id, 'Slow and clear speech' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 75
) AS opts;

-- Question 76 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Delete the message' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 76 UNION ALL
    SELECT id, 'Check line and system status' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 76 UNION ALL
    SELECT id, 'Restart the computer' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 76 UNION ALL
    SELECT id, 'Inform MET' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 76
) AS opts;

-- Question 77 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Email' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 77 UNION ALL
    SELECT id, 'Telephone coordination' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 77 UNION ALL
    SELECT id, 'Fax' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 77 UNION ALL
    SELECT id, 'Postal service' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 77
) AS opts;

-- Question 78 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Administrative messages' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 78 UNION ALL
    SELECT id, 'Training messages' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 78 UNION ALL
    SELECT id, 'ATS and flight safety messages' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 78 UNION ALL
    SELECT id, 'Commercial messages' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 78
) AS opts;

-- Question 79 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Normal operation' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 79 UNION ALL
    SELECT id, 'User login' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 79 UNION ALL
    SELECT id, 'Fault or abnormal condition' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 79 UNION ALL
    SELECT id, 'Message successfully sent' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 79
) AS opts;

-- Question 80 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Create flight plans' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 80 UNION ALL
    SELECT id, 'Monitor message routing integrity' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 80 UNION ALL
    SELECT id, 'Print messages' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 80 UNION ALL
    SELECT id, 'Archive data' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 80
) AS opts;

-- Question 81 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Low priority' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 81 UNION ALL
    SELECT id, 'Normal priority' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 81 UNION ALL
    SELECT id, 'Immediate priority' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 81 UNION ALL
    SELECT id, 'Administrative priority' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 81
) AS opts;

-- Question 82 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'View personal drafts' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 82 UNION ALL
    SELECT id, 'Share operational messages within a unit' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 82 UNION ALL
    SELECT id, 'Delete system alarms' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 82 UNION ALL
    SELECT id, 'Edit sent messages' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 82
) AS opts;

-- Question 83 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Ignored' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 83 UNION ALL
    SELECT id, 'Corrected and reprocessed' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 83 UNION ALL
    SELECT id, 'Deleted permanently' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 83 UNION ALL
    SELECT id, 'Forwarded without action' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 83
) AS opts;

-- Question 84 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Speed of correction only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 84 UNION ALL
    SELECT id, 'Correct ICAO format is maintained' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 84 UNION ALL
    SELECT id, 'Free text is used' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 84 UNION ALL
    SELECT id, 'Message priority is changed' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 84
) AS opts;

-- Question 85 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Cancel messages' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 85 UNION ALL
    SELECT id, 'Re-route messages to correct addresses' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 85 UNION ALL
    SELECT id, 'Archive messages' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 85 UNION ALL
    SELECT id, 'Convert messages to draft' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 85
) AS opts;

-- Question 86 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Freely within the airport' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 86 UNION ALL
    SELECT id, 'With all staff' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 86 UNION ALL
    SELECT id, 'On a need-to-know basis' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 86 UNION ALL
    SELECT id, 'With external agencies' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 86
) AS opts;

-- Question 87 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Speed only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 87 UNION ALL
    SELECT id, 'Confidentiality and accuracy' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 87 UNION ALL
    SELECT id, 'Cost efficiency' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 87 UNION ALL
    SELECT id, 'Minimal logging' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 87
) AS opts;

-- Question 88 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Staff appraisal' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 88 UNION ALL
    SELECT id, 'Operational traceability and accountability' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 88 UNION ALL
    SELECT id, 'Training only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 88 UNION ALL
    SELECT id, 'Financial audits' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 88
) AS opts;

-- Question 89 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Personal notebooks' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 89 UNION ALL
    SELECT id, 'Official logbooks or electronic systems' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 89 UNION ALL
    SELECT id, 'Email records' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 89 UNION ALL
    SELECT id, 'Draft folders' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 89
) AS opts;

-- Question 90 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Erased' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 90 UNION ALL
    SELECT id, 'Corrected using correction fluid' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 90 UNION ALL
    SELECT id, 'Made with a single line and initialled' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 90 UNION ALL
    SELECT id, 'Rewritten completely' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 90
) AS opts;

-- Question 91 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Leave immediately' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 91 UNION ALL
    SELECT id, 'Brief the incoming operator on system status' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 91 UNION ALL
    SELECT id, 'Shut down systems' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 91 UNION ALL
    SELECT id, 'Clear all inboxes' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 91
) AS opts;

-- Question 92 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Personal issues' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 92 UNION ALL
    SELECT id, 'Pending messages and system faults' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 92 UNION ALL
    SELECT id, 'Training schedules' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 92 UNION ALL
    SELECT id, 'Leave plans' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 92
) AS opts;

-- Question 93 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'No action' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 93 UNION ALL
    SELECT id, 'Reduced traffic' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 93 UNION ALL
    SELECT id, 'Operational risk and safety hazards' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 93 UNION ALL
    SELECT id, 'Increased workload only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 93
) AS opts;

-- Question 94 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Replace ICAO Annexes' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 94 UNION ALL
    SELECT id, 'Provide uniform procedures for operations' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 94 UNION ALL
    SELECT id, 'Serve as optional guidance' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 94 UNION ALL
    SELECT id, 'Apply to supervisors only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 94
) AS opts;

-- Question 95 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Supervisors only' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 95 UNION ALL
    SELECT id, 'AIM management only' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 95 UNION ALL
    SELECT id, 'All communication operations staff' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 95 UNION ALL
    SELECT id, 'ICAO' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 95
) AS opts;

-- Question 96 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Any staff member' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 96 UNION ALL
    SELECT id, 'Document control authority' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 96 UNION ALL
    SELECT id, 'External auditors' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 96 UNION ALL
    SELECT id, 'Airline operators' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 96
) AS opts;

-- Question 97 (Answer: C)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Kept for reference' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 97 UNION ALL
    SELECT id, 'Marked and removed from use' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 97 UNION ALL
    SELECT id, 'Circulated internally' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 97 UNION ALL
    SELECT id, 'Archived without marking' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 97
) AS opts;

-- Question 98 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Faster message flow' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 98 UNION ALL
    SELECT id, 'Safety and efficiency of air navigation' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 98 UNION ALL
    SELECT id, 'Reduced staffing' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 98 UNION ALL
    SELECT id, 'Commercial operations' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 98
) AS opts;

-- Question 99 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Faster communication' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 99 UNION ALL
    SELECT id, 'Misunderstanding and safety risks' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 99 UNION ALL
    SELECT id, 'Improved clarity' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 99 UNION ALL
    SELECT id, 'Reduced workload' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 99
) AS opts;

-- Question 100 (Answer: B)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, option_text, is_correct FROM (
    SELECT id, 'Increased traffic handling' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 100 UNION ALL
    SELECT id, 'Uniform, safe, and efficient communication operations' as option_text, TRUE as is_correct FROM temp_question_ids WHERE qn_num = 100 UNION ALL
    SELECT id, 'Reduced training requirements' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 100 UNION ALL
    SELECT id, 'Automation of all services' as option_text, FALSE as is_correct FROM temp_question_ids WHERE qn_num = 100
) AS opts;

-- Clean up temporary table
DROP TEMPORARY TABLE temp_question_ids;

-- Commit transaction
COMMIT;

-- Verification query
SELECT
    a.name as assessment_name,
    COUNT(DISTINCT q.id) as total_questions,
    COUNT(DISTINCT o.id) as total_options,
    SUM(CASE WHEN o.is_correct = TRUE THEN 1 ELSE 0 END) as correct_options_count
FROM course_assessments a
LEFT JOIN assessment_questions q ON q.assessment_id = a.id
LEFT JOIN question_options o ON o.question_id = q.id
WHERE a.id = @assessment_id
GROUP BY a.id, a.name;