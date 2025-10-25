#!/bin/bash

# Script to add questions 8-20 to assessment ID 2
BASE_URL="http://localhost:8091"

echo "Adding questions 8-20 to Safety Responsibilities Assessment..."

# Question 8
curl -X POST "$BASE_URL/assessment-questions" \
  -H "Content-Type: application/json" \
  -d '{"text": "Hazard identification is the responsibility of:", "optionsToPresent": 4, "assessment": {"id": 2}}'

# Question 9
curl -X POST "$BASE_URL/assessment-questions" \
  -H "Content-Type: application/json" \
  -d '{"text": "Safety reporting should be:", "optionsToPresent": 4, "assessment": {"id": 2}}'

# Question 10
curl -X POST "$BASE_URL/assessment-questions" \
  -H "Content-Type: application/json" \
  -d '{"text": "A positive safety culture is characterized by:", "optionsToPresent": 4, "assessment": {"id": 2}}'

# Question 11
curl -X POST "$BASE_URL/assessment-questions" \
  -H "Content-Type: application/json" \
  -d '{"text": "Effective risk management involves:", "optionsToPresent": 4, "assessment": {"id": 2}}'

# Question 12
curl -X POST "$BASE_URL/assessment-questions" \
  -H "Content-Type: application/json" \
  -d '{"text": "Safety training should be:", "optionsToPresent": 4, "assessment": {"id": 2}}'

# Question 13
curl -X POST "$BASE_URL/assessment-questions" \
  -H "Content-Type: application/json" \
  -d '{"text": "Continuous improvement in safety requires:", "optionsToPresent": 4, "assessment": {"id": 2}}'

# Question 14
curl -X POST "$BASE_URL/assessment-questions" \
  -H "Content-Type: application/json" \
  -d '{"text": "Safety performance indicators should measure:", "optionsToPresent": 4, "assessment": {"id": 2}}'

# Question 15
curl -X POST "$BASE_URL/assessment-questions" \
  -H "Content-Type: application/json" \
  -d '{"text": "In emergency situations, personnel should:", "optionsToPresent": 4, "assessment": {"id": 2}}'

# Question 16
curl -X POST "$BASE_URL/assessment-questions" \
  -H "Content-Type: application/json" \
  -d '{"text": "Effective safety communication includes:", "optionsToPresent": 4, "assessment": {"id": 2}}'

# Question 17
curl -X POST "$BASE_URL/assessment-questions" \
  -H "Content-Type: application/json" \
  -d '{"text": "Safety oversight responsibilities include:", "optionsToPresent": 4, "assessment": {"id": 2}}'

# Question 18
curl -X POST "$BASE_URL/assessment-questions" \
  -H "Content-Type: application/json" \
  -d '{"text": "Human factors in aviation safety refer to:", "optionsToPresent": 4, "assessment": {"id": 2}}'

# Question 19
curl -X POST "$BASE_URL/assessment-questions" \
  -H "Content-Type: application/json" \
  -d '{"text": "Safety data analysis helps organizations:", "optionsToPresent": 4, "assessment": {"id": 2}}'

# Question 20
curl -X POST "$BASE_URL/assessment-questions" \
  -H "Content-Type: application/json" \
  -d '{"text": "Safety leadership involves:", "optionsToPresent": 4, "assessment": {"id": 2}}'

echo "All questions added successfully!"
