CREATE DATABASE UniversityDB;
USE UniversityDB;

CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department_id INT,
    age INT CHECK (age >= 18),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);


CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);


CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


INSERT INTO Departments (department_name) VALUES
('Computer Science'),
('Mechanical Engineering'),
('Electrical Engineering');


INSERT INTO Students (name, email, department_id, age) VALUES
('sandy', 'sandy@example.com', 1, 20),
('janani', 'janani@example.com', 2, 22),
('yaash', 'yaash@example.com', 3, 21),
('sai', 'sai@example.com', 1, 19),
('suresh', 'sur@example.com', 2, 23);


INSERT INTO Courses (course_name, department_id) VALUES
('Data Structures', 1),
('Thermodynamics', 2),
('Circuit Analysis', 3),
('Database Systems', 1);


INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2025-04-01'),
(2, 2, '2025-04-02'),
(3, 3, '2025-04-03'),
(4, 4, '2025-04-04'),
(5, 1, '2025-04-05');


SELECT Students.student_id, Students.name, Students.email, Departments.department_name
FROM Students
INNER JOIN Departments ON Students.department_id = Departments.department_id;

SELECT Courses.course_id, Courses.course_name, Departments.department_name
FROM Courses
INNER JOIN Departments ON Courses.department_id = Departments.department_id;


SELECT Students.student_id, Students.name, Courses.course_name, Enrollments.enrollment_date
FROM Enrollments
INNER JOIN Students ON Enrollments.student_id = Students.student_id
INNER JOIN Courses ON Enrollments.course_id = Courses.course_id;


SELECT Students.student_id, Students.name, Courses.course_name, Enrollments.enrollment_date
FROM Students
LEFT JOIN Enrollments ON Students.student_id = Enrollments.student_id
LEFT JOIN Courses ON Enrollments.course_id = Courses.course_id;


UPDATE Students
SET email = 'newbob@example.com'
WHERE student_id = 2;


DELETE FROM Students
WHERE student_id = 4;


