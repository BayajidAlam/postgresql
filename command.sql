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
