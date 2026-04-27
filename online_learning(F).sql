DROP TABLE IF EXISTS Certificates;
DROP TABLE IF EXISTS Lessons;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Students;

CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT UNIQUE
);

CREATE TABLE Instructors (
    instructor_id INTEGER PRIMARY KEY,
    name TEXT
);

CREATE TABLE Courses (
    course_id INTEGER PRIMARY KEY,
    title TEXT,
    instructor_id INTEGER,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

CREATE TABLE Enrollments (
    enrollment_id INTEGER PRIMARY KEY,
    student_id INTEGER,
    course_id INTEGER,
    enroll_date TEXT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Lessons (
    lesson_id INTEGER PRIMARY KEY,
    course_id INTEGER,
    lesson_title TEXT,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Certificates (
    certificate_id INTEGER PRIMARY KEY,
    student_id INTEGER,
    course_id INTEGER,
    issue_date TEXT
);

INSERT INTO Students VALUES
(1,'Amit','amit@gmail.com'),
(2,'Riya','riya@gmail.com'),
(3,'John','john@gmail.com'),
(4,'Sara','sara@gmail.com'),
(5,'Raj','raj@gmail.com'),
(6,'Neha','neha@gmail.com'),
(7,'Arun','arun@gmail.com'),
(8,'Pooja','pooja@gmail.com'),
(9,'Kiran','kiran@gmail.com'),
(10,'Meena','meena@gmail.com');

INSERT INTO Instructors VALUES
(1,'Dr. Kumar'),
(2,'Prof. Sharma'),
(3,'Dr. Singh');

INSERT INTO Courses VALUES
(1,'SQL Basics',1),
(2,'Java Programming',2),
(3,'Data Structures',3),
(4,'Web Development',1);

INSERT INTO Enrollments VALUES
(1,1,1,'2026-01-01'),
(2,2,2,'2026-01-01'),
(3,3,3,'2026-01-01'),
(4,4,4,'2026-01-01'),
(5,5,1,'2026-01-01'),
(6,6,2,'2026-01-01'),
(7,7,3,'2026-01-01'),
(8,8,4,'2026-01-01'),
(9,9,1,'2026-01-01'),
(10,10,2,'2026-01-01');

INSERT INTO Lessons VALUES
(1,1,'Intro to SQL'),
(2,1,'Joins'),
(3,2,'Java Basics'),
(4,2,'OOP'),
(5,3,'Arrays'),
(6,3,'Trees'),
(7,4,'HTML'),
(8,4,'CSS');

INSERT INTO Certificates VALUES
(1,1,1,'2026-02-01'),
(2,2,2,'2026-02-01'),
(3,3,3,'2026-02-01'),
(4,4,4,'2026-02-01');

SELECT * FROM Students;
SELECT * FROM Instructors;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT * FROM Lessons;
SELECT * FROM Certificates;

SELECT s.name, c.title
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

SELECT c.title, i.name
FROM Courses c
JOIN Instructors i ON c.instructor_id = i.instructor_id;

SELECT c.title, COUNT(e.student_id)
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.title;

SELECT COUNT(*) FROM Enrollments;

SELECT * FROM Courses WHERE title LIKE '%SQL%';

SELECT instructor_id, COUNT(*) FROM Courses GROUP BY instructor_id;

SELECT s.name, c.title, cert.issue_date
FROM Certificates cert
JOIN Students s ON cert.student_id = s.student_id
JOIN Courses c ON cert.course_id = c.course_id;
