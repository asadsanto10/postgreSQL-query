-- Active: 1691561445401@@127.0.0.1@5432@university_db@public

-- Create DATABASE
CREATE DATABASE university_db;

-- Create a "students" table::
CREATE TABLE
    students (
        student_id SERIAL PRIMARY KEY,
        student_name VARCHAR(50),
        age INT,
        email VARCHAR(50) UNIQUE,
        frontend_mark INT,
        backend_mark INT,
        status VARCHAR(20)
    );


-- Create a "courses" table::
CREATE TABLE
    courses (
        course_id SERIAL PRIMARY KEY,
        course_name VARCHAR(50),
        credits INT
    );

-- Create a "enrollment" table ::
CREATE TABLE
    enrollment (
        enrollment_id SERIAL PRIMARY KEY UNIQUE,
        student_id INT,
        CONSTRAINT fk_constraint_student FOREIGN key (student_id) REFERENCES students(student_id),
        course_id int,
        CONSTRAINT fk_constraint_course FOREIGN key (course_id) REFERENCES courses(course_id)
    );

-- Insert the data into the "students" table::
INSERT INTO
    students(student_id, student_name, age, email, frontend_mark, backend_mark, status)
    VALUES
    (1, 'Alice', 22, 'alice@example.com', 55, 57, NULL),
    (2, 'Bob', 21, 'bob@example.com', 34, 45, NULL),
    (3, 'Charlie', 23, 'charlie@example.com', 60, 59, NULL),
    (4, 'David', 20, 'david@example.com', 40, 49, NULL),
    (5, 'Eve', 24, 'newemail@example.com', 45, 34, NULL),
    (6, 'Rahim', 23, 'rahim@gmail.com', 46, 42, NULL);


-- Insert the data into the "courses" table::
INSERT INTO
    courses(course_id, course_name, credits)
    VALUES
    (1, 'Next.js', 3),
    (2, 'React.js', 4),
    (3, 'Databases', 3),
    (4, 'Prisma', 3);

-- Insert the data into the "enrollment" table::
INSERT INTO
    enrollment(enrollment_id, student_id, course_id)
    VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 2, 1),
    (4, 3, 2);


--? Query 1: Insert a new student record::
INSERT INTO
    students(student_name, age, email, frontend_mark, backend_mark, status)
    VALUES
    ('Asad Santo', 22, 'asad.santo.20@gmail.com', 50, 55, NULL);

--? Query 2: Retrieve the names of all students who are enrolled in the course titled 'Next.js::

  SELECT s.student_name FROM students s
    JOIN enrollment e ON e.student_id = s.student_id
    JOIN courses c ON c.course_id = e.course_id
    WHERE c.course_name = 'Next.js';


--? Query 3: Update the status of the student with the highest total (frontend_mark + backend_mark) mark to 'Awarded'

UPDATE students SET status = 'Awarded' WHERE student_id = (
    SELECT student_id
      FROM students
      GROUP BY student_id
      ORDER BY SUM(frontend_mark + backend_mark) DESC
      LIMIT 1
);

--? Query 4: Delete all courses that have no students enrolled.

DELETE FROM courses WHERE course_id NOT IN (
  SELECT c.course_id FROM courses c
    LEFT JOIN enrollment e
    ON e.course_id = c.course_id
    WHERE e.course_id IS NOT NULL
);


--? Query 5: Retrieve the names of students using a limit of 2, starting from the 3rd student::

SELECT student_name FROM students ORDER BY student_id LIMIT 2 OFFSET 2;


--? Query 6: Retrieve the course names and the number of students enrolled in each course::

SELECT c.course_name, count(e.student_id) students_enrolled FROM courses c
  JOIN enrollment e ON c.course_id = e.course_id
  GROUP BY c.course_name;

--? Query 7: Calculate and display the average age of all students::

SELECT AVG(age) average_age FROM students;

--? Query 8: Retrieve the names of students whose email addresses contain 'example.com'::

SELECT student_name FROM students WHERE email LIKE '%example.com%';


SELECT count(student_id) total_student FROM students;

SELECT student_name, sum(frontend_mark + backend_mark) totalMark FROM students GROUP BY student_id;

SELECT avg(frontend_mark + backend_mark) avg_mark FROM students;
