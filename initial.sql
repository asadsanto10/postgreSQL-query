-- Active: 1691561445401@@127.0.0.1@5432@test@public

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

INSERT INTO
    usre1 (user_id, username, email)
VALUES (2, 'abcd', 'abcd@gmail.com');

INSERT INTO
    usre1(
        user_id,
        username,
        email,
        password
    )
VALUES (
        1,
        'asad',
        'asad@gmail.com',
        '123'
    ), (
        3,
        'asad3',
        'asad3@gmail.com',
        '123'
    );

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

INSERT INTO
    usre1(
        user_id,
        username,
        email,
        password
    )
VALUES (
        6,
        'asad6',
        'asad6@gmail.com',
        '123'
    );

ALTER TABLE usre1 alter COLUMN demo drop DEFAULT ;

ALTER TABLE usre1 RENAME COLUMN demo to demo1;

ALTER TABLE usre1 ALTER COLUMN demo1 set not null;

ALTER TABLE usre1 ALTER COLUMN demo1 DROP not null;

s ALTER TABLE usre1 ADD CONSTRAINT unique_email UNIQUE(email);

ALTER TABLE usre1 DROP CONSTRAINT unique_email;

SELECT * FROM user1;

-- ?########### Foreign Key Constraint And Data Integrity #############

-- Depertmen Table

-- Each depertment has many employees

CREATE TABLE
    Department(
        deptID SERIAL PRIMARY KEY,
        deptName VARCHAR(50)
    );

INSERT INTO Department VALUES(1, 'CSE');

SELECT * FROM department;

DELETE FROM department WHERE deptid = 1;

-- Employee TABLE

-- Each employ belongs to a depertment

CREATE TABLE
    Employee (
        empID SERIAL PRIMARY KEY,
        empName VARCHAR(50) NOT NULL,
        departmentID INT,
        CONSTRAINT fk_constraint_dept FOREIGN key (departmentID) REFERENCES Department (deptID)
    );

INSERT INTO Employee VALUES (1, 'asad', 1);

SELECT * FROM Employee;

DELETE FROM Employee WHERE empid = 1;

-- ? #######  Updation And Deletion #############

CREATE Table
    courses(
        courceID SERIAL PRIMARY KEY,
        courceName VARCHAR(255) NOT NULL,
        description VARCHAR(255),
        publishedDate DATE
    );

INSERT INTO
    courses (
        courceName,
        description,
        publishedDate
    )
VALUES (
        'Introduction to Programming',
        'Learn the basics of programming.',
        '2022-05-15'
    ), (
        'Web Development Fundamentals',
        'Explore the essentials of web development.',
        '2021-11-30'
    ), (
        'Data Science Essentials',
        'Discover the fundamentals of data science.',
        '2023-02-10'
    ), (
        'Graphic Design Basics',
        NULL,
        NULL
    ), (
        'Introduction to Artificial Intelligence',
        'Learn the basics of AI and its applications.',
        NULL
    );

SELECT * FROM courses;

-- update column

UPDATE courses
SET
    courcename = 'Introduction update'
WHERE courceid = 1;

DELETE FROM courses WHERE courceid = 1;

-- pagination

SELECT * FROM courses ORDER BY courcename ASC LIMIT 2 OFFSET 1;

-- ### postgresSQL-practice-task

--? Task 1: Write an SQL query to retrieve the names and salaries of employees who work in the "HR" department.

CREATE TABLE
    employees (
        emp_id INT PRIMARY KEY,
        emp_name VARCHAR(50),
        department VARCHAR(50),
        salary DECIMAL(10, 2)
    );

INSERT INTO
    employees (
        emp_id,
        emp_name,
        department,
        salary
    )
VALUES (1, 'John Doe', 'HR', 50000.00), (2, 'Jane Smith', 'IT', 60000.00), (
        3,
        'Michael Johnson',
        'Finance',
        55000.00
    ), (
        4,
        'Emily Brown',
        'HR',
        52000.00
    );

SELECT * FROM employees;

-- Write an SQL query to retrieve the names and salaries of employees who work in the "HR" department.

SELECT emp_name, salary FROM employees WHERE department = 'HR';

--? Task 2: Aggregation and HAVING Clause Create a table named "orders" with columns (order_id, customer_id, total_amount) and insert the following data:

CREATE TABLE
    orders (
        order_id INT PRIMARY KEY,
        customer_id INT,
        total_amount DECIMAL(10, 2)
    );

INSERT INTO
    orders (
        order_id,
        customer_id,
        total_amount
    )
VALUES (101, 1, 200.00), (102, 2, 300.00), (103, 1, 150.00), (104, 3, 400.00), (105, 2, 250.00);

SELECT * FROM orders;

-- Write an SQL query to find the customer IDs and the average total amount of their orders. Display only those customers whose average total amount is greater than or equal to 250.

SELECT
    customer_id,
    AVG(total_amount) AS average_total_amount
FROM orders
GROUP BY customer_id
HAVING AVG(total_amount) >= 250;

--? Task 3: JOIN and GROUP BY Create two tables named "students" and "courses" with columns as follows:

CREATE TABLE
    students (
        student_id INT PRIMARY KEY,
        student_name VARCHAR(50),
        age INT,
        gender VARCHAR(10)
    );

CREATE TABLE
    courses (
        course_id INT PRIMARY KEY,
        course_name VARCHAR(50),
        credits INT
    );

INSERT INTO
    students (
        student_id,
        student_name,
        age,
        gender
    )
VALUES (1, 'Alice', 22, 'Female'), (2, 'Bob', 21, 'Male'), (3, 'Charlie', 23, 'Male');

INSERT INTO
    courses (
        course_id,
        course_name,
        credits
    )
VALUES (101, 'Mathematics', 3), (102, 'History', 4), (103, 'Physics', 3);

-- Enrollment table with student-course relationships

CREATE TABLE
    enrollment (
        enrollment_id INT PRIMARY KEY,
        student_id INT,
        course_id INT
    );

INSERT INTO
    enrollment (
        enrollment_id,
        student_id,
        course_id
    )
VALUES (1, 1, 101), (2, 1, 102), (3, 2, 103), (4, 3, 101);

-- Write an SQL query to retrieve the student name, course name, and credits for all enrolled courses.

SELECT
    s.student_name,
    c.course_name,
    c.credits
FROM students AS s
    INNER JOIN enrollment e ON e.student_id = s.student_id
    INNER JOIN courses c ON c.course_id = e.course_id;

--? Task 4: Multiple Joins and Aggregation Create three tables named "employees," "departments," and "salaries" with columns as follows:

CREATE TABLE
    employees (
        emp_id INT PRIMARY KEY,
        emp_name VARCHAR(50),
        department_id INT
    );

CREATE TABLE
    departments (
        department_id INT PRIMARY KEY,
        department_name VARCHAR(50)
    );

CREATE TABLE salaries ( emp_id INT, salary DECIMAL(10, 2) );

INSERT INTO
    employees (
        emp_id,
        emp_name,
        department_id
    )
VALUES (1, 'John Doe', 1), (2, 'Jane Smith', 2), (3, 'Michael Johnson', 1), (4, 'Emily Brown', 3);

INSERT INTO
    departments (
        department_id,
        department_name
    )
VALUES (1, 'HR'), (2, 'IT'), (3, 'Finance');

INSERT INTO
    salaries (emp_id, salary)
VALUES (1, 50000.00), (2, 60000.00), (3, 55000.00), (4, 52000.00);

-- Write an SQL query to retrieve the department name and the average salary of employees working in each department. Sort the results by the average salary in descending order.

SELECT
    department_name,
    AVG(s.salary) as average_salary
FROM employees AS e
    INNER JOIN departments AS d ON d.department_id = e.department_id
    INNER JOIN salaries s ON s.emp_id = e.emp_id
GROUP BY d.department_name
ORDER BY average_salary DESC;

--?? Task 5: Aggregation and Grouping Create a table named "orders" with columns (order_id, customer_id, order_date, total_amount) and insert the following data:

CREATE TABLE
    orders (
        order_id INT PRIMARY KEY,
        customer_id INT,
        order_date DATE,
        total_amount DECIMAL(10, 2)
    );

INSERT INTO
    orders (
        order_id,
        customer_id,
        order_date,
        total_amount
    )
VALUES (101, 1, '2023-01-05', 200.00), (102, 2, '2023-01-06', 300.00), (103, 1, '2023-02-10', 150.00), (104, 3, '2023-02-15', 400.00), (105, 2, '2023-03-20', 250.00);

-- Write an SQL query to find the total sales amount for each month, along with the number of orders in that month.

SELECT
    TO_CHAR(order_date, 'Month') AS Month,
    COUNT(*) AS Num_Orders,
    SUM(total_amount) AS Total_Sales
FROM orders
GROUP BY month
ORDER BY EXTRACT(
        MONTH
        FROM MIN(order_date)
    );

-- ?Task 6: Write an SQL query to retrieve the department name and the average salary of employees in each department, excluding departments with fewer than two employees.

-- Write an SQL query to retrieve the department name and the average salary of employees in each department, excluding departments with fewer than two employees.

SELECT
    d.department_id,
    AVG(s.salary) AS average_salary
FROM employees e
    JOIN salaries s ON e.emp_id = s.emp_id
    JOIN (
        SELECT
            department_id,
            COUNT(*) AS employee_count
        FROM employees
        GROUP BY
            department_id
        HAVING
            COUNT(*) >= 2
    ) AS d_count ON e.department_id = d_count.department_id
    JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_id;
