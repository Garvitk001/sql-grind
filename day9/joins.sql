-- Day 9 
--SEssion 1 - JOIN

CREATE table student_contacts (
student_id INTEGER PRIMARY KEY ,
email TEXT not NULL,
phone text );

insert into student_contacts(student_id,email,phone)
VALUES(1,'garvit@example.com','9876500001')
,(2,'arav@example.com ','9876500002')
,(3,'priya@example.com','9876500003')
,(5,'neha@example.com ','9876500005')
,(7,'sneha@example.com','9876500007');

SELECT * from student_contacts;

select * from students INNER join student_contacts on students.student_id = student_contacts.student_id;

select * from students LEFT join student_contacts on students.student_id = student_contacts.student_id;

SELECT
    student_contacts.student_id,
    students.name,
    student_contacts.email,
    student_contacts.phone
FROM student_contacts
LEFT JOIN students
    ON student_contacts.student_id = students.student_id;


select students.name , student_contacts.phone from students LEFT join student_contacts on students.student_id = student_contacts.student_id where phone IS NULL;

SELECT s.name , c.phone from students as s left join  student_contacts as c on s.student_id =  c.student_id where phone is null;