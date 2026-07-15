SELECT * FROM students;
SELECT name,cgpa FROM students;

INSERT INTO students(student_id,name,branch,semester,cgpa,city)
VALUES(2,"Arav","CS",6,7.2,"Dausa");
SELECT * FROM students;
SELECT * FROM students WHERE city = 'Jaipur';
INSERT INTO students (student_id, name, branch, semester, cgpa, city)
VALUES
(3, 'Priya', 'AI&DS', 7, 8.7, 'Jaipur'),
(4, 'Amit', 'CSE', 6, 7.8, 'Kota'),
(5, 'Neha', 'IT', 7, 8.9, 'Udaipur'),
(6, 'Rohan', 'AI&DS', 6, 7.5, 'Ajmer'),
(7, 'Sneha', 'CSE', 7, 9.1, 'Jaipur'),
(8, 'Karan', 'ECE', 6, 6.9, 'Jodhpur'),
(9, 'Anjali', 'AI&DS', 7, 8.3, 'Bikaner'),
(10, 'Vikas', 'IT', 6, 7.2, 'Jaipur');


SELECT * from students;

SELECT * from students where cgpa > 8;

SELECT * from students where cgpa >=8 and city='Jaipur';


SELECT * From students where branch = 'CSE' or branch ='AI&DS';

select * from students order by cgpa desc;

SELECT * FROM students order by cgpa desc  limit  3;

SELECT DISTINCT branch FROM students;

SELECT * from students where name like 'A%';
SELECT * From students where branch in ('AI&DS','CSE','IT');

SELECT *
FROM students
WHERE cgpa BETWEEN 7.0 AND 8.5;

SELECT * FROM students WHERE BRANCH = 'AI&DS' ORDER BY cgpa desc limit 3;