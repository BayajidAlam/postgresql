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