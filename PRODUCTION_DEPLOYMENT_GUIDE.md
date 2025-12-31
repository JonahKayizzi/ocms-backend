# Production Deployment Guide - Category Support for Assessments

## Problem
The COMM (USOIs) OJT Assessment (ID 7) exists in the database but doesn't show up in the admin panel when filtering by "OJT" category because the backend doesn't support category filtering yet.

## Solution
Add category support to assessments and update existing assessments.

## Steps to Deploy on Production

### Step 1: Run SQL Script on Production Database

```bash
mysql -u root -p ocms < add_category_to_assessments.sql
```

Or manually run:
```sql
-- Add category column
ALTER TABLE course_assessments 
ADD COLUMN category VARCHAR(50) NULL AFTER course_id;

-- Update existing assessments
UPDATE course_assessments 
SET category = 'OJT' 
WHERE id = 4 AND course_id IS NULL;

UPDATE course_assessments 
SET category = 'OJT' 
WHERE id = 7 AND course_id IS NULL;
```

### Step 2: Deploy Backend Changes

1. **Build the backend:**
   ```bash
   cd ocms-backend
   mvn clean package
   ```

2. **Stop the current Java application:**
   ```bash
   sudo service ocms_java_app stop
   # or
   pkill -f ocms-backend
   ```

3. **Deploy the new JAR:**
   ```bash
   # Copy the new JAR to production location
   cp target/ocms-backend-*.jar /path/to/production/
   ```

4. **Start the application:**
   ```bash
   sudo service ocms_java_app start
   # or manually:
   nohup java -jar ocms-backend-*.jar > /var/log/ocms-backend.log 2>&1 &
   ```

### Step 3: Deploy Frontend Changes

1. **Build the frontend:**
   ```bash
   cd ocms-frontend
   npm install
   npm run build
   ```

2. **Deploy the build:**
   ```bash
   # Copy build folder to web server
   cp -r build/* /path/to/web/server/
   ```

3. **Restart web server if needed:**
   ```bash
   sudo systemctl restart nginx
   # or
   sudo systemctl restart httpd
   ```

### Step 4: Verify

1. **Check database:**
   ```sql
   SELECT id, name, category, course_id 
   FROM course_assessments 
   WHERE course_id IS NULL;
   ```
   Should show both assessments with `category = 'OJT'`

2. **Test API endpoint:**
   ```bash
   curl "http://10.10.32.25:8091/assessments/standalone?category=OJT"
   ```
   Should return assessments with category 'OJT'

3. **Test in Admin Panel:**
   - Go to Admin Dashboard → Course Management → Assessments Hub
   - Select "Standalone (OJT, Proficiency, etc.)"
   - Select category "OJT"
   - The COMM (USOIs) OJT Assessment should now appear

## Files Changed

### Backend:
- `CourseAssessment.java` - Added `category` field
- `CourseAssessmentRepository.java` - Added `findStandaloneActiveByCategory()` method
- `CourseAssessmentService.java` - Added `getStandaloneAssessmentsByCategory()` method
- `CourseAssessmentController.java` - Updated `/standalone` endpoint to accept `category` query parameter

### Frontend:
- `apiSlice.ts` - Updated `getStandaloneAssessments` query to accept category parameter
- `assessments-tab.js` - Updated to pass category to API call

### Database:
- Added `category` column to `course_assessments` table
- Updated existing assessments to have `category = 'OJT'`

## Rollback Plan

If something goes wrong:

1. **Revert database:**
   ```sql
   ALTER TABLE course_assessments DROP COLUMN category;
   ```

2. **Revert to previous JAR file**

3. **Revert frontend build**

## Notes

- The category field is optional (nullable)
- Existing assessments without category will still show up when no category filter is applied
- Categories supported: OJT, Proficiency, Certification, Recurrent


