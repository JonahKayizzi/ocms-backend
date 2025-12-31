#!/usr/bin/env python3
"""
Script to generate SQL for inserting COMM USOIs Assessment questions and options
Run this to generate the complete SQL file
"""

# Questions data
questions = [
    ("The primary purpose of Radiotelephony (RTF) is to:", "B", [
        "Reduce message traffic",
        "Assist safe and expeditious aircraft operations",
        "Replace data link communication",
        "Improve commercial efficiency"
    ]),
    ("Which ICAO Annex is emphasized for HF communication procedures?", "C", [
        "Annex 2",
        "Annex 6",
        "Annex 10 Volume II Chapter 5",
        "Annex 15"
    ]),
    ("The HF frequency used for North & East FIRs is:", "C", [
        "8903 kHz",
        "7638.5 kHz",
        "11300 kHz",
        "6589 kHz"
    ]),
    ("The HF frequency used for West FIRs is:", "B", [
        "11300 kHz",
        "8903 kHz",
        "7638.5 kHz",
        "6589 kHz"
    ]),
    ("ESTIMATES received from ACC are recorded on which form?", "B", [
        "CAA/DANS/AIM/OF/22",
        "CAA/DANS/AIM/OF/58",
        "ICAO Form 4444",
        "ATS Flight Progress Strip"
    ]),
    ("ESTIMATES must be transmitted to upcountry stations using:", "C", [
        "Telephone only",
        "VHF",
        "HF radio",
        "Email"
    ]),
    ("All ESTIMATES transmitted must be signed on the worksheet by the:", "C", [
        "ACC Controller",
        "MET Officer",
        "AIMO COM",
        "Supervisor only"
    ]),
    ("Communication with aircraft in flight involves receiving:", "B", [
        "METAR only",
        "ESTIMATES and level changes",
        "NOTAMs",
        "Flight permits"
    ]),
    ("Ground aeronautical station communication includes stations such as:", "B", [
        "Addis Ababa only",
        "Khartoum, Nairobi, Juba",
        "Lagos and Accra",
        "Cairo only"
    ]),
    ("Before transmitting on HF, the operator must:", "B", [
        "Call immediately",
        "Listen to ensure frequency is clear",
        "Increase volume",
        "Repeat message twice"
    ]),
    ("The recommended pause before a second HF call is:", "B", [
        "5 seconds",
        "10 seconds",
        "15 seconds",
        "30 seconds"
    ]),
    ("Maximum recommended speaking rate is:", "C", [
        "60 words per minute",
        "80 words per minute",
        "100 words per minute",
        "120 words per minute"
    ]),
    ("Which of the following is a common HF mistake?", "C", [
        "Using ICAO phraseology",
        "Speaking clearly",
        "Using plain language",
        "Logging messages"
    ]),
    ('"Over" in radiotelephony means:', "B", [
        "Message ended, no reply expected",
        "Transmission finished, reply expected",
        "Repeat message",
        "End of communication"
    ]),
    ("All information from aircraft must be passed to:", "C", [
        "MET",
        "CNS",
        "ACC",
        "Administration"
    ]),
    ("HF coordination with upcountry airfields uses which frequency?", "C", [
        "11300 kHz",
        "8903 kHz",
        "7638.5 kHz",
        "6589 kHz"
    ]),
    ("Regular HF readability checks are conducted at:", "B", [
        "0000, 0600, 1200 UTC",
        "0600, 0900, 1200 UTC",
        "0900, 1200, 1500 UTC",
        "1200, 1800, 0000 UTC"
    ]),
    ("If HF communication fails, messages should be passed via:", "C", [
        "Email",
        "AFTN only",
        "Telephone",
        "Fax"
    ]),
    ("Arriving aircraft information must be relayed to:", "B", [
        "MET",
        "ACC",
        "Administration",
        "Airline"
    ]),
    ("Departure information includes all EXCEPT:", "C", [
        "Departure time",
        "Persons on board",
        "Aircraft weight",
        "ETA"
    ]),
    ("VVIP ATS messages must be handled with:", "C", [
        "Normal priority",
        "Reduced vigilance",
        "Extra vigilance and speed",
        "Supervisor approval"
    ]),
    ("VVIP messages must be monitored using:", "C", [
        "Error counters only",
        "Erroneous and free text counters",
        "Inbox only",
        "Draft folder"
    ]),
    ("Messages received on HF must be passed immediately to:", "A", [
        "MET",
        "CNS",
        "ACC",
        "AIS Library"
    ]),
    ("All VVIP estimates must be transmitted on:", "B", [
        "HF only",
        "Telephone only",
        "AMHS",
        "Email"
    ]),
    ("Confidentiality of VVIP flight data must be ensured on a:", "C", [
        "Public basis",
        "Need-to-know basis",
        "Supervisor basis",
        "Administrative basis"
    ]),
    ("Erroneous flight plans received must be:", "C", [
        "Deleted",
        "Ignored",
        "Corrected immediately",
        "Archived"
    ]),
    ("MET messages received on AFTN must be:", "B", [
        "Stored only",
        "Delivered without delay",
        "Printed weekly",
        "Sent by email"
    ]),
    ("Messages to Air Transport Department must be sent via:", "C", [
        "AFTN",
        "AMHS only",
        "Email",
        "Fax"
    ]),
    ("Equipment malfunctions must be reported to:", "B", [
        "MET",
        "Administration",
        "CNS",
        "ATC"
    ]),
    ("Circuit unserviceability must be reported to:", "C", [
        "ACC",
        "UTL",
        "ICAO",
        "Airline"
    ]),
    ("Green channel state indicates:", "C", [
        "Line failure",
        "Reduced traffic",
        "Line serviceable",
        "Alarm active"
    ]),
    ("Red channel state indicates:", "B", [
        "Normal operation",
        "Line unserviceable",
        "Low priority traffic",
        "Maintenance mode"
    ]),
    ("System Events Service is accessed via:", "C", [
        "Messaging",
        "System Message",
        "Inbox",
        "Reports"
    ]),
    ("Alarm (ALA) turning red indicates:", "B", [
        "Message sent",
        "System fault",
        "User logout",
        "Normal operation"
    ]),
    ("Reduction in message flow may indicate:", "B", [
        "Increased traffic",
        "AFTN line failure",
        "System upgrade",
        "Operator error"
    ]),
    ("Erroneous FPLs appear in the:", "B", [
        "Sent folder",
        "Free text pane",
        "Flight Plan Correction Queue",
        "Outbox"
    ]),
    ("Erroneous FPL fields are marked with:", "B", [
        "Yellow background",
        "Blue icon",
        "Red icon",
        "Green tick"
    ]),
    ("The DIVERT function is used to:", "C", [
        "Delete FPL",
        "Correct route",
        "Divert message to AMHS",
        "Save draft"
    ]),
    ("SID and STAR are used to define:", "B", [
        "Aircraft type",
        "Departure and arrival procedures",
        "Weather conditions",
        "Airspace class"
    ]),
    ("DCT is used when:", "B", [
        "STAR exists",
        "SID exists",
        "No valid airway exists",
        "Route is international"
    ]),
    ("FDD access requires:", "B", [
        "Supervisor permission only",
        "Authorized ID and password",
        "AMHS login",
        "ACC clearance"
    ]),
    ("Supervisor role displays which queues?", "B", [
        "MET and NOTAM",
        "ALR, AFTN, COOR, EAH",
        "Inbox only",
        "Drafts only"
    ]),
    ("Green filter button indicates:", "B", [
        "Filter inactive",
        "Filter active",
        "Line down",
        "Alarm active"
    ]),
    ("Channel checks are sent every:", "C", [
        "10 minutes",
        "15 minutes",
        "20 minutes",
        "30 minutes"
    ]),
    ("If both lines are OFF, messages are:", "B", [
        "Delayed",
        "Stored",
        "Not transmitted",
        "Rerouted automatically"
    ]),
    ("AMHS interface is divided into how many sections?", "B", [
        "Two",
        "Three",
        "Four",
        "Five"
    ]),
    ("The Navigation Panel is located on the:", "B", [
        "Right side",
        "Left side",
        "Top",
        "Bottom"
    ]),
    ("SS Alarms display messages with priority:", "C", [
        "FF",
        "GG",
        "SS",
        "DD"
    ]),
    ("Outbox contains messages that are:", "B", [
        "Received",
        "Deleted",
        "Waiting to be transmitted",
        "Archived"
    ]),
    ("Probes are used to:", "B", [
        "Send NOTAMs",
        "Test message transfer",
        "Create FPLs",
        "Archive messages"
    ]),
    ("Draft messages are created when you:", "C", [
        "Close the window",
        "Click Save as Draft",
        "Logout",
        "Send message"
    ]),
    ("Deleted messages are moved to:", "B", [
        "Inbox",
        "Archive",
        "Deleted folder",
        "Reports"
    ]),
    ("Group Inbox allows viewing messages:", "B", [
        "Sent only",
        "Received by a group",
        "Draft only",
        "Deleted only"
    ]),
    ("Repeat TSI/CSN range is used when:", "B", [
        "Messages are delayed",
        "Messages fail to be received",
        "Lines are serviceable",
        "User logs out"
    ]),
    ("Maintenance Shelf shows:", "B", [
        "Message content",
        "Line status",
        "User accounts",
        "Reports"
    ]),
    ("USOIs must be used in conjunction with:", "B", [
        "Annex 15",
        "MANSOPS Part III",
        "Annex 3",
        "AIP only"
    ]),
    ("The revision date of the document is:", "B", [
        "2022",
        "2023",
        "September 2025",
        "January 2025"
    ]),
    ("The document is classified as:", "B", [
        "Uncontrolled",
        "Draft",
        "Controlled",
        "Advisory"
    ]),
    ("Controlled documents must be checked against:", "B", [
        "ICAO website",
        "Master documents list",
        "AIM library",
        "Supervisor notes"
    ]),
    ("The Communication Centre AFTN address is:", "B", [
        "HUENYNYX",
        "HUENYFYX",
        "HUENZQZX",
        "HUECZQZX"
    ]),
    ("All communications must be logged in:", "B", [
        "Notebook only",
        "AMS/AFTN logbooks",
        "Email",
        "Draft folder"
    ]),
    ("Loss of communication requires use of:", "B", [
        "Email",
        "Telephone",
        "Fax",
        "Courier"
    ]),
    ("VVIP telephones are referred to:", "C", [
        "AIM",
        "CNS",
        "ACC or Tower",
        "Administration"
    ]),
    ("The IDD facility is strictly for:", "B", [
        "Personal calls",
        "Administrative use",
        "Operational use",
        "Training"
    ]),
    ("Adjacent FIRs can be contacted via:", "B", [
        "SMS",
        "IDD",
        "Fax",
        "Courier"
    ]),
    ("When HF readability is poor, the operator should first:", "B", [
        "Increase transmission speed",
        "Change to plain language",
        "Repeat the message slowly",
        "Cancel the transmission"
    ]),
    ("HF transmissions should avoid background noise by:", "C", [
        "Speaking louder",
        "Turning off nearby equipment",
        "Using longer messages",
        "Repeating continuously"
    ]),
    ("The correct sequence before transmitting an HF message is:", "B", [
        "Call–Transmit–Listen",
        "Listen–Call–Transmit",
        "Transmit–Call–Listen",
        "Call–Listen–Transmit"
    ]),
    ("When an aircraft reports a change of level, the information must be passed immediately to:", "B", [
        "MET",
        "CNS",
        "ACC",
        "Administration"
    ]),
    ("HF messages should be logged immediately after:", "B", [
        "Drafting",
        "Transmission or reception",
        "Printing",
        "Supervisor review"
    ]),
    ("When two aircraft transmit simultaneously on HF, the operator should:", "B", [
        "Ignore both transmissions",
        "Ask both aircraft to repeat",
        "Respond to the clearer transmission first",
        "Switch off the transmitter"
    ]),
    ("HF call signs must always include:", "B", [
        "Aircraft registration only",
        "Station name and aircraft call sign",
        "Aircraft type",
        "Flight level"
    ]),
    ('The phrase "SAY AGAIN" is used when:', "C", [
        "Message is incomplete",
        "Message is unclear or not received",
        "Message is incorrect",
        "Transmission is finished"
    ]),
    ('The phrase "CORRECTION" is used to:', "B", [
        "Cancel a message",
        "Amend a previously transmitted error",
        "End transmission",
        "Confirm reception"
    ]),
    ("Which of the following should NOT be used in HF communications?", "B", [
        "ICAO standard phraseology",
        "Plain language where necessary",
        "Slang or informal language",
        "Slow and clear speech"
    ]),
    ("When an AFTN message fails to transmit, the operator should first:", "C", [
        "Delete the message",
        "Check line and system status",
        "Restart the computer",
        "Inform MET"
    ]),
    ("If both primary and standby AFTN lines fail, traffic should be passed via:", "B", [
        "Email",
        "Telephone coordination",
        "Fax",
        "Postal service"
    ]),
    ("During AFTN degradation, priority should be given to:", "B", [
        "Administrative messages",
        "Training messages",
        "ATS and flight safety messages",
        "Commercial messages"
    ]),
    ("System alarms changing from green to red indicate:", "B", [
        "Normal operation",
        "User login",
        "Fault or abnormal condition",
        "Message successfully sent"
    ]),
    ("AMHS probes are primarily used to:", "C", [
        "Create flight plans",
        "Monitor message routing integrity",
        "Print messages",
        "Archive data"
    ]),
    ('Messages marked "SS" require handling with:', "B", [
        "Low priority",
        "Normal priority",
        "Immediate priority",
        "Administrative priority"
    ]),
    ("Group inbox functionality allows operators to:", "C", [
        "View personal drafts",
        "Share operational messages within a unit",
        "Delete system alarms",
        "Edit sent messages"
    ]),
    ("Erroneous flight plans detected in the system must be:", "B", [
        "Ignored",
        "Corrected and reprocessed",
        "Deleted permanently",
        "Forwarded without action"
    ]),
    ("When correcting an FPL, care must be taken to ensure:", "B", [
        "Speed of correction only",
        "Correct ICAO format is maintained",
        "Free text is used",
        "Message priority is changed"
    ]),
    ("The DIVERT function is mainly used to:", "C", [
        "Cancel messages",
        "Re-route messages to correct addresses",
        "Archive messages",
        "Convert messages to draft"
    ]),
    ("Confidential operational information should be shared:", "B", [
        "Freely within the airport",
        "With all staff",
        "On a need-to-know basis",
        "With external agencies"
    ]),
    ("VVIP flight information must be handled with emphasis on:", "B", [
        "Speed only",
        "Confidentiality and accuracy",
        "Cost efficiency",
        "Minimal logging"
    ]),
    ("Logs and records are maintained primarily for:", "B", [
        "Staff appraisal",
        "Operational traceability and accountability",
        "Training only",
        "Financial audits"
    ]),
    ("All operational communications must be logged using:", "C", [
        "Personal notebooks",
        "Official logbooks or electronic systems",
        "Email records",
        "Draft folders"
    ]),
    ("Alterations in logbooks should be:", "B", [
        "Erased",
        "Corrected using correction fluid",
        "Made with a single line and initialled",
        "Rewritten completely"
    ]),
    ("Before handing over watch, the outgoing operator must:", "B", [
        "Leave immediately",
        "Brief the incoming operator on system status",
        "Shut down systems",
        "Clear all inboxes"
    ]),
    ("Watch handover must include information on:", "B", [
        "Personal issues",
        "Pending messages and system faults",
        "Training schedules",
        "Leave plans"
    ]),
    ("Failure to follow COM USOIs procedures may result in:", "B", [
        "No action",
        "Reduced traffic",
        "Operational risk and safety hazards",
        "Increased workload only"
    ]),
    ("Standard Operating Instructions are intended to:", "C", [
        "Replace ICAO Annexes",
        "Provide uniform procedures for operations",
        "Serve as optional guidance",
        "Apply to supervisors only"
    ]),
    ("Compliance with COM USOIs is the responsibility of:", "B", [
        "Supervisors only",
        "AIM management only",
        "All communication operations staff",
        "ICAO"
    ]),
    ("Updates to controlled documents must be authorized by:", "B", [
        "Any staff member",
        "Document control authority",
        "External auditors",
        "Airline operators"
    ]),
    ("Obsolete copies of controlled documents should be:", "C", [
        "Kept for reference",
        "Marked and removed from use",
        "Circulated internally",
        "Archived without marking"
    ]),
    ("Operational discipline in communications mainly supports:", "B", [
        "Faster message flow",
        "Safety and efficiency of air navigation",
        "Reduced staffing",
        "Commercial operations"
    ]),
    ("Incorrect phraseology may lead to:", "B", [
        "Faster communication",
        "Misunderstanding and safety risks",
        "Improved clarity",
        "Reduced workload"
    ]),
    ("The ultimate objective of COM USOIs 2025 is to ensure:", "B", [
        "Increased traffic handling",
        "Uniform, safe, and efficient communication operations",
        "Reduced training requirements",
        "Automation of all services"
    ]),
]

# Answer key mapping (A=0, B=1, C=2, D=3)
answer_map = {"A": 0, "B": 1, "C": 2, "D": 3}

sql_output = []
sql_output.append("-- SQL Script to Insert COMM (USOIs) OJT Assessment 2025/2026")
sql_output.append("-- Complete batch insert for assessment, questions, and options")
sql_output.append("")
sql_output.append("START TRANSACTION;")
sql_output.append("")
sql_output.append("-- Step 1: Insert the Assessment")
sql_output.append("INSERT INTO course_assessments (")
sql_output.append("    name, description, questions_to_present, question_count, course_id,")
sql_output.append("    show_answers, max_retries, timing_mode, time_limit, status")
sql_output.append(") VALUES (")
sql_output.append("    'COMM (USOIs) OJT Assessment 2025/2026',")
sql_output.append("    'This assessment evaluates knowledge and competency in Communication Operations based on the Communication Unit Standard Operating Instructions (COM USOIs) 2025. It covers HF Radiotelephony, AFTN operations, AMHS procedures, flight plan handling, VVIP coordination, and general communication protocols essential for safe and efficient air traffic communication services.',")
sql_output.append("    100,")
sql_output.append("    100,")
sql_output.append("    NULL,")
sql_output.append("    TRUE,")
sql_output.append("    3,")
sql_output.append("    'none',")
sql_output.append("    30,")
sql_output.append("    1")
sql_output.append(");")
sql_output.append("")
sql_output.append("SET @assessment_id = LAST_INSERT_ID();")
sql_output.append("")

# Generate question inserts
sql_output.append("-- Step 2: Insert all 100 Questions")
sql_output.append("INSERT INTO assessment_questions (assessment_id, text, options_to_present) VALUES")

question_values = []
for i, (question_text, correct_answer, options) in enumerate(questions, 1):
    # Escape single quotes in question text
    escaped_text = question_text.replace("'", "''")
    question_values.append(f"(@assessment_id, '{escaped_text}', 4)")

sql_output.append(",\n".join(question_values) + ";")
sql_output.append("")

# Generate option inserts using LIMIT/OFFSET (compatible with older MySQL)
sql_output.append("-- Step 3: Insert Options for all questions")
sql_output.append("-- Using LIMIT/OFFSET to get question IDs in order (compatible with older MySQL versions)")
sql_output.append("")

for i, (question_text, correct_answer, options) in enumerate(questions, 1):
    qn_num = i
    offset = i - 1  # OFFSET is 0-based
    correct_idx = answer_map[correct_answer]
    
    sql_output.append(f"-- Question {qn_num} (Answer: {correct_answer})")
    sql_output.append(f"SET @q{qn_num}_id = (SELECT id FROM assessment_questions WHERE assessment_id = @assessment_id ORDER BY id LIMIT 1 OFFSET {offset});")
    sql_output.append(f"INSERT INTO question_options (question_id, option_text, is_correct) VALUES")
    
    option_values = []
    for idx, option in enumerate(options):
        escaped_option = option.replace("'", "''")
        is_correct = "TRUE" if idx == correct_idx else "FALSE"
        option_values.append(f"(@q{qn_num}_id, '{escaped_option}', {is_correct})")
    
    sql_output.append(",\n".join(option_values) + ";")
    sql_output.append("")
sql_output.append("-- Commit transaction")
sql_output.append("COMMIT;")
sql_output.append("")
sql_output.append("-- Verification query")
sql_output.append("SELECT")
sql_output.append("    a.name as assessment_name,")
sql_output.append("    COUNT(DISTINCT q.id) as total_questions,")
sql_output.append("    COUNT(DISTINCT o.id) as total_options,")
sql_output.append("    SUM(CASE WHEN o.is_correct = TRUE THEN 1 ELSE 0 END) as correct_options_count")
sql_output.append("FROM course_assessments a")
sql_output.append("LEFT JOIN assessment_questions q ON q.assessment_id = a.id")
sql_output.append("LEFT JOIN question_options o ON o.question_id = q.id")
sql_output.append("WHERE a.id = @assessment_id")
sql_output.append("GROUP BY a.id, a.name;")

# Write to file
with open("COMM_USOIs_Assessment_Complete.sql", "w", encoding="utf-8") as f:
    f.write("\n".join(sql_output))

print("SQL file generated: COMM_USOIs_Assessment_Complete.sql")
print(f"Total questions: {len(questions)}")
print("Run this SQL file in your MySQL database to insert the assessment.")

