# OCMS Database Setup

The OCMS backend uses a separate database called `ocms` to store all courses, modules, lessons, materials, and assessments data.

## Quick Setup

### 1. Create the Database

Run the SQL script to create the OCMS database:

```bash
mysql -u root -p < create-ocms-database.sql
```

Or manually in MySQL:

```sql
CREATE DATABASE IF NOT EXISTS ocms
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

GRANT ALL PRIVILEGES ON ocms.* TO 'root'@'localhost';
FLUSH PRIVILEGES;
```

### 2. Configure Environment Variables

The `.env` file is already created with default values:

```env
OCMS_DB_URL=jdbc:mysql://localhost:3306/ocms?useSSL=false&serverTimezone=UTC&zeroDateTimeBehavior=convertToNull
OCMS_DB_USER=root
OCMS_DB_PASS=sms
```

Update these values if your MySQL configuration is different.

### 3. Run the Backend

```bash
mvn spring-boot:run
```

The application will:
- Connect to the `ocms` database
- Run Flyway migrations automatically
- Create all required tables via JPA

## Database Tables

The OCMS database contains:

- `courses` - Course information with start/end dates and status
- `modules` - Course modules for organizing content
- `course_lessons` - Lessons with rich text content and video URLs
- `course_assessments` - Assessments (course-based or standalone)
- `assessment_questions` - Assessment questions
- `question_options` - Question answer options
- `course_materials` - Course materials and file attachments

## Separation from SMS Database

The main SMS application uses the `sms_private` database (port 8080), while OCMS uses the `ocms` database (port 8091). This separation provides:

- **Independent scaling** - Each service can scale independently
- **Data isolation** - Course data is separate from SMS operational data
- **Easier maintenance** - Database migrations and schema changes are isolated
- **Clear boundaries** - Microservices architecture best practice

## Connection Details

- **Database Name**: `ocms`
- **Port**: 3306 (MySQL default)
- **Backend Port**: 8081
- **Character Set**: utf8mb4
- **Collation**: utf8mb4_unicode_ci

## Troubleshooting

### Cannot connect to database

1. Ensure MySQL is running:
   ```bash
   mysql -u root -p
   ```

2. Check if the database exists:
   ```sql
   SHOW DATABASES LIKE 'ocms';
   ```

3. Verify user permissions:
   ```sql
   SHOW GRANTS FOR 'root'@'localhost';
   ```

### Flyway migration errors

If you encounter Flyway errors, you can reset the database:

```sql
DROP DATABASE ocms;
CREATE DATABASE ocms CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

Then restart the backend to re-run migrations.

