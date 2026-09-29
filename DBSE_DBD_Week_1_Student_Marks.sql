-- DBSE & DBD - Week 1 Practical
-- Student Marks Database

-- 1. Create Table
DROP TABLE IF EXISTS student_marks;

CREATE TABLE student_marks (
    roll_no INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    marks DECIMAL(5,2)
);

-- 2. Insert Data
INSERT INTO student_marks (roll_no, name, subject, marks) VALUES
(1, 'Ravi', 'Math', 85.50),
(2, 'Sita', 'Math', 92.75),
(3, 'Anil', 'Math', 78.40),
(4, 'Priya', 'Math', 88.90),
(5, 'Vijay', 'Math', 80.25),
(6, 'subbusir', 'aws', 98.50),
(7, 'dwaraka', 'dbms', 95.75),
(8, 'siva', 'english', 97.40),
(9, 'kavithamam', 'aws1', 99.90),
(10, 'seetha', 'azure', 82.25);

-- 3. Simple Select
SELECT * FROM student_marks;

-- 4. Aggregate Functions
SELECT COUNT(*) AS total_students FROM student_marks;
SELECT SUM(marks) AS total_marks FROM student_marks;
SELECT AVG(marks) AS average_marks FROM student_marks;
SELECT MAX(marks) AS maximum_marks FROM student_marks;
SELECT MIN(marks) AS minimum_marks FROM student_marks;

-- 5. Filtering with WHERE
SELECT * FROM student_marks WHERE marks > 85;
SELECT * FROM student_marks WHERE marks >= 90;
SELECT * FROM student_marks WHERE marks < 80;
SELECT * FROM student_marks WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student_marks WHERE name LIKE 'P%';
SELECT * FROM student_marks WHERE name IN ('Ravi', 'Sita', 'Vijay');
SELECT * FROM student_marks
WHERE marks > 85 AND (subject = 'Math' OR name LIKE 'P%');

-- 6. Update Queries
UPDATE student_marks
SET marks = 90.00
WHERE roll_no = 3;

UPDATE student_marks
SET subject = 'Remedial Math'
WHERE marks < 80;

-- 7. Delete Queries
DELETE FROM student_marks
WHERE roll_no = 5;

DELETE FROM student_marks
WHERE marks < 75;

-- 8. Sorting
SELECT * FROM student_marks ORDER BY marks ASC;
SELECT * FROM student_marks ORDER BY marks DESC;
SELECT * FROM student_marks ORDER BY name ASC;
SELECT * FROM student_marks ORDER BY name DESC;
