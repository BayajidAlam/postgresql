-- Active: 1692246012307@@127.0.0.1@5432@test2
## Create Database
CREATE DATABASE db1;

## Rename DATABASE 
ALTER DATABASE db1 RENAME to db2

## Delete DATABASE
DROP DATABASE db1;

--## Create a Student Table
CREATE TABLE student(
  student_id int ,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  cgpa NUMERIC(1,2)
);

--update a table name
Alter TABLE student RENAME to learners;

-- delete a table 
DROP Table learners;

-- create table with CONSTRAINTS
CREATE TABLE "user" (
    user_id SERIAL,
    user_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    age INT DEFAULT 18,
    PRIMARY KEY (user_id, user_name),
    UNIQUE(user_name),
    UNIQUE(email)
);


-- insert into table 
INSERT INTO "user" (user_id, user_name,age, email)
VALUES (1, 'bayajid1',22, 'bayajid2001@gmail.com')
RETURNING * ;

-- delete all row without deleting the table 
TRUNCATE TABLE "user";

-- alter table 
 -->add colum,drop colum,change datatype of a COLUMN
 --> rename a colum, set default value for a colum 
 -->add CONSTRAINT to a COLUMN,drop CONSTRAINT for a COLUMN  
 --rename TABLE

-- add a column 
 ALTER TABLE "user"
 add COLUMN demo text;

-- delete a column 
ALTER Table "user"
drop COLUMN age

-- change data type to a column  
ALTER TABLE "user"
alter COLUMN demo type FLOAT4;
-- set default value 
ALTER TABLE "user"
ALTER COLUMN demo SET DEFAULT 'Bangladesh';
-- remove default value
ALTER TABLE "user"
ALTER COLUMN demo DROP DEFAULT;


-- Rename column 
ALTER Table "user"
RENAME COLUMN demo to country

-- add constraint 
ALTER TABLE "user"
ALTER COLUMN country set not null

-- add constraint  
ALTER Table "user"
ADD constraint unique_email UNIQUE(email)

-- delete a constraint  
ALTER Table "user"
DROP constraint unique_email

-- get all row of a table  
select * from "user";






-- Foreign Key Constraint And Data Integrity
-- Employee Table
-- Each employee  belongs to a department

-- create table
CREATE TABLE employee (
  empId SERIAL PRIMARY KEY,
  empName VARCHAR(50) NOT NULL,
  departmentId INT,
  CONSTRAINT fk_constraint_dept
    FOREIGN KEY(departmentId)
    REFERENCES Department(deptID)
);

-- insert into employee table
INSERT INTO employee VALUES(1,'Bayajid',1);

-- Department TABLE
-- Each department has many employee 
-- create table
CREATE TABLE Department(
  deptID SERIAL PRIMARY KEY,
  deptName VARCHAR(50)
);

-- insert into Department table
INSERT INTO Department VALUES(1,'IT')

-- see table
SELECT * from Department
SELECT * from employee





-- Updation And Deletion 
-- create courses table
CREATE Table courses (
  course_id SERIAL PRIMARY KEY,
  course_name VARCHAR(255) not NULL,
  description VARCHAR(255),
  published_data DATE
);
-- Insert into courses table
INSERT INTO courses (course_name, description, published_data)
VALUES
  ('Course 1', 'Description for Course 1', '2023-08-17'),
  ('Course 2', 'Description for Course 2', NULL),
  ('Course 3', NULL,NULL),
  ('Course 4', 'Description for Course 4', '2023-08-20'),
  ('Course 5', 'Description for Course 5', '2023-08-21');

-- update table row 
-- UPDATE table_name
-- set 
-- column1 = value1 
-- COLUMN2 = value2 
-- WHERE CONDITION

UPDATE courses
set
course_name = 'Postgres2',
"description" = 'Dummy Text2'
WHERE course_id = 1 OR course_id = 5


-- DELETE 
DELETE from courses
WHERE course_id = 5;

SELECT * from courses;






-- Select Basics
CREATE TABLE if NOT EXISTS departments (
  deptId SERIAL PRIMARY KEY,
  name TEXT not null
);

INSERT INTO departments VALUES(4,'New');

CREATE TABLE if NOT EXISTS employees2 (
    empId SERIAL PRIMARY KEY,
    name TEXT not null,
    email text not  null,
    salary INTEGER not null,
    joining_date DATE NOT null,
    deptId INTEGER not null,
    CONSTRAINT fk_deptId 
        FOREIGN KEY(deptId)
        REFERENCES departments(deptId)
)

-- Insert data into employees table
INSERT INTO employees2 (name, email, salary, joining_date, deptId)
VALUES
  ('John Doe', 'john@example.com', 50000, '2023-08-17', 1),
  ('Jane Smith', 'jane@example.com', 55000, '2023-08-18', 2),
  ('Michael Johnson', 'michael@example.com', 60000, '2023-08-19', 3),
  ('Emily Brown', 'emily@example.com', 52000, '2023-08-20', 4),
  ('William Jones', 'william@example.com', 58000, '2023-08-21', 5),
  ('Olivia Davis', 'olivia@example.com', 53000, '2023-08-22', 1),
  ('James Wilson', 'james@example.com', 56000, '2023-08-23', 2),
  ('Sophia Taylor', 'sophia@example.com', 59000, '2023-08-24', 3),
  ('Liam Anderson', 'liam@example.com', 54000, '2023-08-25', 4),
  ('Emma Martinez', 'emma@example.com', 57000, '2023-08-26', 5);


-- select all fields/rows
SELECT * from departments;
SELECT * from employees2;


-- Limit And Offset
SELECT * FROM employees2
ORDER BY name
ASC LIMIT 5 OFFSET 2

-- highest salary of the table 
SELECT * from employees2
ORDER BY salary 
DESC LIMIT 1;

-- third highest salary of the table 
SELECT * from employees2
ORDER BY salary 
DESC LIMIT 1 OFFSET 2;

-- other way 
SELECT max(salary)  as highest_salary
from employees2

-- IN, NOT IN ,BETWEEN, LIKE, IS
-- IN
SELECT * FROM employees2 
WHERE empid IN (1,3,5);

-- Not In
SELECT * FROM employees2 
WHERE empid NOT IN (1,3,5);

-- Between
SELECT * FROM employees2 
WHERE salary BETWEEN 52000 and 55000;

-- Like(searching in string) && Case sensative
SELECT * FROM employees2 
WHERE name LIKE '%a%';

-- first char as a 
SELECT * FROM employees2 
WHERE name LIKE 'J%';

-- last char as a 
SELECT * FROM employees2 
WHERE name LIKE '%h';

-- specific position(here 2nd)
SELECT * FROM employees2 
WHERE name LIKE '_r%';

-- specific position(Frist 2 character then r and last e two character)
SELECT * FROM employees2 
WHERE name LIKE '__r__';

-- specific position(start with a and end with o)
SELECT * FROM employees2 
WHERE name LIKE 'a%o';

SELECT * FROM employees2 
WHERE deptid is NULL;






-- Active: 1692246012307@@127.0.0.1@5432@postgres@public

-- joining 
CREATE TABLE department2 (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(100)
);
-- Insert data into department2 table

DROP Table department2;


CREATE TABLE employees3 (
  employee_id INT PRIMARY KEY,
  full_name VARCHAR(100),
  department_id INT,
  job_role VARCHAR(100),
  manager_id INT,
  FOREIGN KEY (department_id) REFERENCES department2(department_id)
)



SELECT * from department2;
SELECT * from employees3

-- Inner Join 
SELECT *
from employees3
INNER JOIN department2 on department2.department_id = employees3.department_id;

-- LEFT JOIN 
SELECT *
from employees3
LEFT JOIN department2 on department2.department_id = employees3.department_id;

-- RIGHT JOIN 
SELECT *
from employees3
RIGHT JOIN department2 on department2.department_id = employees3.department_id;

--  FULL JOIN 
SELECT *
from employees3
FULL JOIN department2 on department2.department_id = employees3.department_id;


--  NATURAL JOIN 
SELECT *
from employees3
NATURAL JOIN department2;


--  CROSS JOIN 
SELECT *
from employees3
CROSS JOIN department2;


-- AGGREGATE FUNCTION 
SELECT AVG(salary) averageSalary FROM employees2;
SELECT MIN(salary) averageSalary FROM employees2;
SELECT max(salary) averageSalary FROM employees2;

-- avg of every department 
SELECT deptid,AVG(salary) from employees2 GROUP BY deptid;


-- for example(with some inappropieate)
-- SELECT d.name,AVG(e.salary), max(e.salary) FROM employees2 e
-- FULL JOIN department2 d on e.deptId = d.dept
-- GROUP BY d.name Having avg(e.salary) > 52000

-- SELECT d.name,SUM(e.salary), min(e.salary), count(*) FROM employees2 e
-- FULL JOIN employees2 e on e.deptId = d.dept
-- GROUP BY d.deptId