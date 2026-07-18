create table if not EXISTS departments(department_id integer primary KEY , department_name text not NULL);

insert into departments(department_id,department_name)
VALUES(1, 'Engineering'),
(2, 'Data'),
(3, 'HR'),
(4, 'Sales');
SELECT * from departments;

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS employees (
    employee_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    department_id INTEGER NOT NULL,
    salary REAL NOT NULL,
    experience_years INTEGER,
    performance_score REAL,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);   

insert into employees(employee_id,name, department_id , salary ,experience_years , performance_score)
VALUES(101 ,'Aman' ,1,85000,3,8.5),
       (102,'Riya',2,95000,4,9.1),
       (103,'Karan',1,70000,2,7.8),
       (104,'Neha',3,60000,5,8.2),
       (105,'Arjun',4,55000,1,7.0),
       (106,'Priya',2,110000,6,9.5),
       (107,'Rohit',4,65000,3,8.0),
       (108,'Sneha',3,72000,2,8.7);

SELECT * from employees;

----- SUBQUERY---------

SELECT name , salary from employees where salary > (SELECT Avg(salary) from employees order by salary DESC);

SELECT
    e.name,
    d.department_name,
    e.salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id = e.department_id
)
ORDER BY e.salary DESC;

-----Case WHEN-----

select 
    name , salary ,
        CASE 
            when salary >=90000  then 'high'
            when salary >= 70000 then 'medium' 
            else 'low'
            end as salary_level
from employees
order by salary desc;


SELECT * from employees;

SELECT e.name , d.department_name, e.performance_score,
 case when performance_score >= 9.0 then 'excellent'
 when performance_score>= 8.0 then 'good'
 else 'need improvement '
 end as salary_level 
 from employees as e 
 inner join departments as d on e.department_id = d.department_id;    


 SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    AVG(e.salary) AS average_salary,
    AVG(e.performance_score) AS average_performance
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(e.performance_score) >= 8.0
ORDER BY average_performance DESC;