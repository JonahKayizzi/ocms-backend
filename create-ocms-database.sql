-- Create OCMS database
CREATE DATABASE IF NOT EXISTS ocms CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- Grant privileges to root user
GRANT ALL PRIVILEGES ON ocms.* TO 'root' @'localhost';
FLUSH PRIVILEGES;
-- Use the OCMS database
USE ocms;
-- Tables will be created automatically by Flyway migrations and JPA
-- This script just creates the database schema
SELECT 'OCMS database created successfully!' AS message;