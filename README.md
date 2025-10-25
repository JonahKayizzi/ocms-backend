# OCMS Backend - Online Courses & Assessments Service

A separate Spring Boot microservice for managing online courses, assessments, modules, lessons, and materials.

## Features

- **Courses Management**: Create, edit, publish, deactivate courses with start/end dates
- **Modules**: Organize course content into modules
- **Lessons**: Rich text content and video lessons with module association
- **Assessments**: Course-based and standalone assessments with questions
- **Materials**: File attachments and course materials
- **Status Management**: Draft, published, completed course statuses with automatic updates

## Quick Start

### Prerequisites
- Java 17+
- MySQL 8.0+
- Maven 3.6+

### Database Setup
1. Create a MySQL database (e.g., `sms_private`)
2. The application will automatically run Flyway migrations on startup

### Environment Variables
```bash
export OCMS_DB_URL="jdbc:mysql://localhost:3306/sms_private?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
export OCMS_DB_USER="root"
export OCMS_DB_PASS="your_password"
```

### Running the Application
```bash
cd ocms-backend
mvn spring-boot:run
```

The service will start on port 8091.

## API Endpoints

### Courses
- `GET /courses` - List all courses (admin view)
- `GET /courses/published` - List published courses
- `GET /courses/completed` - List completed courses
- `POST /courses` - Create new course
- `PUT /courses/{id}` - Update course
- `PATCH /courses/{id}/publish` - Publish course
- `PATCH /courses/{id}/deactivate` - Deactivate course
- `DELETE /courses/{id}` - Delete course

### Modules
- `GET /modules/course/{courseId}` - List modules for a course
- `POST /modules` - Create new module

### Lessons
- `GET /course-lessons/course/{courseId}` - List lessons for a course
- `POST /course-lessons` - Create new lesson

### Assessments
- `GET /assessments/course/{courseId}` - List course assessments
- `GET /assessments/standalone` - List standalone assessments
- `POST /assessments` - Create new assessment
- `PUT /assessments/{id}` - Update assessment
- `DELETE /assessments/{id}` - Delete assessment

### Questions
- `GET /assessment-questions/assessment/{assessmentId}` - List questions for assessment
- `POST /assessment-questions` - Create new question
- `PUT /assessment-questions/{id}` - Update question
- `DELETE /assessment-questions/{id}` - Delete question

### Question Options
- `GET /question-options/question/{questionId}` - List options for question
- `POST /question-options` - Create new option
- `POST /question-options/bulk` - Create multiple options
- `PUT /question-options/{id}` - Update option
- `DELETE /question-options/{id}` - Delete option

### Materials
- `GET /course-materials/course/{courseId}` - List materials for course
- `POST /course-materials` - Create new material
- `PUT /course-materials/{id}` - Update material
- `DELETE /course-materials/{id}` - Delete material

## Database Schema

The application uses Hibernate auto-DDL (Flyway disabled). All tables are created automatically on startup:

- `courses` - Course information with start/end dates and status
- `modules` - Course modules
- `course_lessons` - Lessons with rich text content and video URLs
- `course_assessments` - Assessments (course-based or standalone)
- `assessment_questions` - Assessment questions
- `question_options` - Question answer options
- `course_materials` - Course materials and file attachments
- `enrollments` - User course enrollments
- `participant_progress` - Lesson completion tracking

## Security

- CORS enabled for `http://localhost:3000`, `http://localhost:3001`, and other local origins
- All GET endpoints are public
- POST/PUT/DELETE endpoints are temporarily open for development
- JWT token support ready for production integration
- Authentication endpoints available at `/auth/**`

## Status Codes

- `0` - Deactivated
- `1` - Published/Active
- `2` - Draft
- `3` - Completed (automatically set when end date passes)

## Development

### Building
```bash
mvn clean package
```

### Testing
```bash
mvn test
```

### Health Check
```bash
curl http://localhost:8091/actuator/health
```


