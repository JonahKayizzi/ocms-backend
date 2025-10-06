-- Create courses table
CREATE TABLE IF NOT EXISTS courses (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    learning_goals TEXT,
    objectives TEXT,
    start_date DATETIME,
    end_date DATETIME,
    status INT DEFAULT 2,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create modules table
CREATE TABLE IF NOT EXISTS modules (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    course_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

-- Create course_lessons table
CREATE TABLE IF NOT EXISTS course_lessons (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    content LONGTEXT,
    loom_video_url VARCHAR(500),
    course_id BIGINT NOT NULL,
    module_id BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    FOREIGN KEY (module_id) REFERENCES modules(id) ON DELETE SET NULL
);

-- Create course_assessments table
CREATE TABLE IF NOT EXISTS course_assessments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    questions_to_present INT,
    question_count INT,
    course_id BIGINT,
    status INT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE SET NULL
);

-- Create assessment_questions table
CREATE TABLE IF NOT EXISTS assessment_questions (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    text TEXT NOT NULL,
    correct_answer VARCHAR(255),
    options_to_present INT,
    image_data_url TEXT,
    assessment_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (assessment_id) REFERENCES course_assessments(id) ON DELETE CASCADE
);

-- Create question_options table
CREATE TABLE IF NOT EXISTS question_options (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    option_text TEXT NOT NULL,
    question_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (question_id) REFERENCES assessment_questions(id) ON DELETE CASCADE
);

-- Create course_materials table
CREATE TABLE IF NOT EXISTS course_materials (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    file_url VARCHAR(500),
    file_type VARCHAR(100),
    file_size BIGINT,
    course_id BIGINT NOT NULL,
    status INT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

-- Create indexes for better performance
CREATE INDEX idx_modules_course_id ON modules(course_id);
CREATE INDEX idx_course_lessons_course_id ON course_lessons(course_id);
CREATE INDEX idx_course_lessons_module_id ON course_lessons(module_id);
CREATE INDEX idx_course_assessments_course_id ON course_assessments(course_id);
CREATE INDEX idx_assessment_questions_assessment_id ON assessment_questions(assessment_id);
CREATE INDEX idx_question_options_question_id ON question_options(question_id);
CREATE INDEX idx_course_materials_course_id ON course_materials(course_id);


