create database db;

use db;

create table employees (
	emp_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    salary decimal(10,2),
    hire_date date
); 

INSERT INTO employees (emp_id, first_name, last_name, salary, hire_date) VALUES
(1, 'Alice', 'Johnson', 55000.00, '2018-06-15'),
(2, 'Bob', 'Smith', 62000.00, '2019-03-20'),
(3, 'Carol', 'Davis', 48000.00, '2020-01-10'),
(4, 'David', 'Wilson', 73000.00, '2017-08-25'),
(5, 'Eve', 'Martinez', 51000.00, '2021-05-30'),
(6, 'Frank', 'Brown', 60000.00, '2022-09-12'),
(7, 'Grace', 'Taylor', 57000.00, '2020-11-03'),
(8, 'Henry', 'Anderson', 66000.00, '2016-04-18'),
(9, 'Ivy', 'Thomas', 49500.00, '2023-02-07'),
(10, 'Jack', 'Lee', 75000.00, '2015-12-01');

select * from employees;

select emp_id as ID from employees;

select salary, salary*1.1 as newSalary from employees;

select concat(first_name, " ", last_name) as "full name" from employees;

create table department (
	dept_id int primary key,
    dept_name varchar(50),
    location varchar(50)
);

insert into department values 
(1, "Engineering", "New York"),
(2, "Marketing", "Los Angeles"),
(3, "Finance", "Chicago");

select * from department;

alter table employees
add column department_id int;

select e.first_name, e.salary from employees e;
select e.first_name, e.salary from employees as e;

select concat(e.first_name," ", e.last_name) as "full name", d.dept_name from employees e
join department d on e.department_id = d.dept_id;

-- alias in subquery
select round(avg(salary),2) as average_salary from employees;

select average_salary.average_salary 
from (select round(avg(salary),2) as average_salary from employees) 
as average_salary;

-- alias on case
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name, salary,
    CASE 
        WHEN salary > 50000 THEN "High"
        ELSE "second high"
    END AS salary_level
FROM employees;

-- practice
select * from employees where department_id = 2;

select round(avg(salary),2) as "Average Salary" from employees;

select concat(first_name, " ", last_name) as "Names" 
from employees where hire_date > "2020-01-01";

select * from employees order by salary desc limit 1;

select * from employees order by hire_date limit 1;

select department_id, count(*) as "Persons in Group" 
from employees group by department_id;

SELECT CONCAT(first_name, ' ', last_name) AS "Full Name",
       YEAR(hire_date) AS join_year
FROM employees
ORDER BY join_year;


-- DISTINCT

create table emp (
	id int auto_increment primary key,
    name varchar(50),
    department varchar(50),
    salary decimal(10,2)
);

INSERT INTO emp (name, department, salary) VALUES
('Alice', 'HR', 50000.00),
('Bob', 'IT', 60000.00),
('Charlie', 'Finance', 55000.00),
('Alice', 'HR', 50000.00),         -- Duplicate of 1st row
('David', 'IT', 60000.00),
('Eve', 'Finance', 55000.00),      -- Duplicate of 3rd row (same dept/salary)
('Frank', 'IT', 60000.00),         -- Same dept/salary as Bob and David
('Grace', 'HR', 50000.00),         -- Same dept/salary as Alice
('Heidi', 'IT', 70000.00),
('Ivan', 'Finance', 55000.00);     -- Same salary/department as Charlie & Eve

select * from emp;
select distinct department as "All Departments" from emp;
select count(distinct department) as "All Departments count" from emp;

-- using distinct on multiple columns
select distinct department, salary from emp;
select distinct salary from emp order by salary desc;
select distinct department from emp where salary > 50000; 


-- using distinct on with functions
select count(distinct department) as "uniq dept" from emp where salary > 50000; 
select distinct concat(name," - ", department) as "Dept wise details" from emp;

























