
-- ## CREATE DATABASE
-- CREATE DATABASE test;

-- ## create a table
-- CREATE Table student (
--   student_id INT,
--   first_name VARCHAR(50),
--   last_name VARCHAR(50),
--   cgpa NUMERIC(1,2)
-- )

-- ## rename table name
-- ALTER TABLE student RENAME TO lerners

-- ## Delete a TABLE
-- DROP TABLE lerners

-- ## CREATE a table with CONSTRAINT
-- CREATE TABLE "usre" (
--   user_id SERIAL PRIMARY KEY,
--   username VARCHAR(255) UNIQUE NOT NULL,
--   email VARCHAR(255) UNIQUE NOT NULL
-- )

-- CREATE TABLE "usre1" (
--   user_id SERIAL,
--   username VARCHAR(255) UNIQUE NOT NULL,
--   email VARCHAR(255) UNIQUE NOT NULL,
--   PRIMARY KEY(user_id, username)
-- )

-- CREATE TABLE usre3 (
--   user_id SERIAL PRIMARY KEY,
--   username VARCHAR(255) UNIQUE NOT NULL,
--   email VARCHAR(255) UNIQUE NOT NULL,
--   age INT DEFAULT 18
-- )

INSERT INTO usre1 (user_id, username, email) VALUES (2, 'abcd', 'abcd@gmail.com');

INSERT INTO usre1(user_id, username, email, password) VALUES
(1, 'asad', 'asad@gmail.com', '123'),
(3, 'asad3', 'asad3@gmail.com', '123');

-- ## delete all rows in a table without delete the table
TRUNCATE TABLE usre1;


-- ## alter table
-- add a new column, drop column, chnage datatype, rename a column=, set default value, constrant a column, drop constraint, table RENAME
ALTER TABLE usre1 ADD COLUMN age INT DEFAULT 18;

ALTER TABLE usre1 ADD COLUMN password VARCHAR(255) NOT NULL;
ALTER TABLE usre1 ADD COLUMN demo int;

ALTER TABLE usre1 DROP COLUMN age;

ALTER TABLE usre1 alter COLUMN demo type TEXT;

ALTER TABLE usre1 alter COLUMN demo1 set DEFAULT 'test' ;

INSERT INTO usre1(user_id, username, email, password) VALUES
(6, 'asad6', 'asad6@gmail.com', '123');

ALTER TABLE usre1 alter COLUMN demo drop DEFAULT ;

ALTER TABLE usre1 RENAME COLUMN demo to demo1;

ALTER TABLE usre1 ALTER COLUMN demo1 set not null;

ALTER TABLE usre1 ALTER COLUMN demo1 DROP not null;s

ALTER TABLE usre1 ADD CONSTRAINT unique_email UNIQUE(email);

ALTER TABLE usre1 DROP CONSTRAINT unique_email;


SELECT * FROM user1;





-- ?########### Foreign Key Constraint And Data Integrity #############

-- Depertmen Table
-- Each depertment has many employees

CREATE TABLE Department(
  deptID SERIAL PRIMARY KEY,
  deptName VARCHAR(50)
);

INSERT INTO Department VALUES(1, 'CSE');

SELECT * FROM department;

DELETE FROM department WHERE deptid = 1;

-- Employee TABLE
-- Each employ belongs to a depertment

CREATE TABLE Employee (
  empID SERIAL PRIMARY KEY,
  empName VARCHAR(50) NOT NULL,
  departmentID INT,
  CONSTRAINT fk_constraint_dept
      FOREIGN key (departmentID)
      REFERENCES Department (deptID)
);

INSERT INTO Employee VALUES (1, 'asad', 1);

SELECT * FROM Employee;

DELETE FROM Employee WHERE empid = 1;


-- ? #######  Updation And Deletion #############

CREATE Table courses(
  courceID SERIAL PRIMARY KEY,
  courceName VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  publishedDate DATE
);

INSERT INTO courses (courceName, description, publishedDate)
VALUES
  ('Introduction to Programming', 'Learn the basics of programming.', '2022-05-15'),
  ('Web Development Fundamentals', 'Explore the essentials of web development.', '2021-11-30'),
  ('Data Science Essentials', 'Discover the fundamentals of data science.', '2023-02-10'),
  ('Graphic Design Basics', NULL, NULL),
  ('Introduction to Artificial Intelligence', 'Learn the basics of AI and its applications.', NULL);


SELECT * FROM courses;

-- update column
UPDATE courses SET courcename = 'Introduction update' WHERE courceid = 1;

DELETE FROM courses WHERE courceid = 1;


-- pagination
SELECT * FROM courses ORDER BY courcename ASC LIMIT 2 OFFSET 1;

