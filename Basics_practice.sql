-- Show DATABASES;
-- use school;
-- create DATABASE database_name;


-- create table of student
-- use school;
-- create table Student(
--     Id int,
--     Name varchar(100),
--     Age int
-- );

-- show tables;
-- DESCRIBE Student;

-- create table faculty with primary key ,not null,default value

-- use school;
-- create table Faculty(
--     Faculty_ID int primary key,
--     Name varchar(100),
--     Course int Not NULL,
--     Salary int default 10000
-- );

-- DESCRIBE Student;
-- DESCRIBE Faculty;
--  see difference in columns


-- insert into school.Student VALUES(101,'Mohit',20);
-- insert into school.Student VALUES(102,'Amit',15);
-- insert into school.Student (id,name) values(103,"Nikhil");
-- insert into school.Student (name,id) values("Aman",105);
-- insert into school.Faculty values (101,'ABC',01,20000);
-- insert into school.Faculty (Faculty_ID,name,COURSE) values (102,'XYZ',02);
-- SHOW DATABASES;
-- CREATE DATABASE University;

-- drop table if EXISTS Student;
-- drop table if EXISTS Faculty;

-- Problem statement
-- Create 2 tables

-- Students
-- Columns - RollNumber, Name, Address, ContactNumber
-- RollNumber - Primary Key

-- Faculties
-- Columns - FacultyId, Name, Class, EmailId
-- FacultyId - Primary Key
-- Name - Not null

-- drop table if EXISTS school.Student;
-- create table school.Student(
--     RollNumber int primary key,
--     Name VARCHAR(100),
--     Address VARCHAR(100),
--     ContactNumber int
-- );

-- drop table if EXISTS school.Faculties;
-- create table school.Faculties(
--     FacultyId int primary key,
--     Name VARCHAR(100) not null,
--     Class varchar(100),
--     EmailId VARCHAR(100)
-- );


-- Problem statement
-- Insert data

-- Student Table

-- RollNumber | Name | Address | Contact Number | values: (12, Abhishek, New Delhi, 658689489) ( 25, Aman, Bengaluru, 3256987412) (36, Anshul, Hyderabad, 258746985) (65, Anand, Kolkata, 236541987) (69, Abhishek, New Delhi, 254136854)
-- Faculties

-- FacultyId | Name | Class | EmailId values: (1,Shah, Math, shah@xyz. com) (2,Kumar, Hindi, kumar@xyz. com) (3,Dahiya, English, dahiya@xyz. com) (4,Gairols, Science, gairols@xyz. com)

-- ALTER TABLE school.Student MODIFY ContactNumber BIGINT;
-- INSERT INTO school.Student (RollNumber, Name, Address, ContactNumber) 
-- VALUES
--     (12, 'Abhishek', 'New Delhi', 658689489),
--     (25, 'Aman', 'Bengaluru', 3256987412),
--     (36, 'Anshul', 'Hyderabad', 258746985),
--     (65, 'Anand', 'Kolkata', 236541987),
--     (69, 'Abhishek', 'New Delhi', 254136854);



-- insert into school.Faculties
--     (FacultyId,Name,Class,EmailId)
-- values
--     (1,'Shah', 'Math', 'shah@xyz. com'),
--     (2,'Kumar', 'Hindi', 'kumar@xyz. com'),
--     (3,'Dahiya', 'English', 'dahiya@xyz. com'),
--     (4,'Gairols', 'Science', 'gairols@xyz. com');



-- select * from school.student;
-- alter table school.Student add column DateOfBirth DATE;

-- how to set for particular column

-- UPDATE school.Student
-- SET DateOfBirth = '2000-01-01'  -- Replace with the desired date format or value
-- WHERE DateOfBirth IS NULL;

-- alter table school.student drop column contactnumber;
-- alter table school.student modify column DateOfBirth YEAR;
-- -- UPDATE school.Student SET DateOfBirth = YEAR(DateOfBirth);
-- -- ALTER TABLE school.Student MODIFY COLUMN DateOfBirth YEAR;
-- SELECT * FROM SCHOOL.student;

-- ALTER TABLE school.Student
-- ADD COLUMN temp_year_of_birth YEAR;
-- UPDATE school.Student
-- SET temp_year_of_birth = YEAR(DateOfBirth);

-- ALTER TABLE school.Student
-- DROP COLUMN DateOfBirth;

-- ALTER TABLE school.Student
-- CHANGE COLUMN temp_year_of_birth DateOfBirth YEAR;

-- desc school.student;

-- ---------------------- filter data---------------------------------------------------------------------------------------------------------------------------------------------------
-- to load data frcm source
-- source /Users/akhichoudhary/CN/Analytics and data science/SQL/BASIC/mysqlsampledatabase.sql;

-- q1
-- Consider the employees table with the following details. employees table stores all employee information as well as the organization structure such as who reports to whom.

-- Table- employees
-- employeeNumber | int                | 
-- lastName              | varchar(50)  | 
-- firstName              | varchar(50)  | 
-- extension              | varchar(10)  | 
-- email                     | varchar(100) |
-- officeCode            | varchar(10)  | 
-- reportsTo              | int                 | 
-- jobTitle                  | varchar(50)  | 
-- Get Job Title of 10th person in employees table with respect to insertion in the table.

-- solution
-- SELECT jobTitle
-- FROM employees
-- ORDER BY employeeNumber
-- LIMIT 9, 1;

-- q

-- Problem statement
-- Get OrderNumber from OrderDetails Tables 
-- where quantityOrdered is equal to 59 and 
-- priceEach is greater than 100

-- sol
-- select ordernumber 
-- from orderdetails
-- where quantityOrdered=59
-- and priceEach>100;

-- q

-- Problem statement
-- Given below are the details of customers table. It is one of the tables in classicmodels database. customers stores customer’s data.

-- Table- customers
-- customerNumber                  | int                 | 
-- customerName                     | varchar(50)   |
-- contactLastName                 | varchar(50)   | 
-- contactFirstName                 | varchar(50)   | 
-- phone                                   | varchar(50)   |
-- addressLine1                        | varchar(50)   | 
-- addressLine2                        | varchar(50)   | 
-- city                                        | varchar(50)   | 
-- state                                      | varchar(50)   | 
-- postalCode                            | varchar(15)   | 
-- country                                  | varchar(50)   | 
-- salesRepEmployeeNumber  | int                  | 
-- creditLimit                             | decimal(10,2) | 
-- With SQL, how do you select all the records from a table named "customers" where the "contactFirstName" is "Diego" and the "contactLastName" is "Freyre"?

-- sol
-- select * FROM customers
-- where contactFirstName='Diego'
-- and contactLastName='Freyre';

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ------------- Aggregate functions-------------------------------

-- q
-- Problem statement
-- Find the number of distinct country names in the customers table.

-- select count(distinct country)
-- from customers;

-- q
-- Problem statement
-- ##### From Table-orderdetails get the number of records where quantityOrdered is greater than 50.

-- Note: Answer should be in Integer

-- select count(distinct orderNumber)
-- from orderdetails
-- where quantityOrdered>50;

-- select * from orderdetails;

-- Problem statement
-- Get sum of all payments from

-- i) 2002-01-01 to 2003-01-01

-- ii) 2003-01-01 to 2004-01-01

-- iii) 2004-01-01 to 2005-01-01

-- Which time range has the maximum payment?

-- select max(priceEach) from orderdetails
-- where

-- select sum(amount) from payments where paymentDate>'2004-01-01' and paymentDate<'2005-01-01';
-- -----------------------update delete trunc and drop
-- Problem statement
-- Update MSRP of motorcycles to 100 in the products table and get the sum of MSRP of motorcycles.

-- Note: Answer should be in Integer


-- use classicmodels;
-- UPDATE products
-- SET MSRP = 100
-- WHERE productLine = 'Motorcycles';

-- SELECT SUM(MSRP) AS TotalMSRP
-- FROM products
-- WHERE productLine = 'Motorcycles';

-- --------ordered max
-- Problem statement
-- Which productCode was ordered the most?

-- Refer to the orderdetails table for the same.

-- SELECT productCode, SUM(quantityOrdered) AS totalOrdered
-- FROM orderdetails
-- GROUP BY productCode
-- ORDER BY totalOrdered DESC
-- LIMIT 1;

-- q Get sum of quantityordered of each ordernumber from orderdetails table and tell output of orderNumber = 10425

-- SELECT orderNumber, SUM(quantityOrdered) AS totalQuantityOrdered
-- FROM orderdetails
-- GROUP BY orderNumber
-- HAVING orderNumber = 10425;

-- Get sum of price paid by customerNumber 473 on 2003-10-27 from payments table;

-- use classicmodels;
-- select sum(amount)
--     -> from payments
--     -> where customernumber=473
--     -> and paymentdate='2003-10-27';

-- retrivel-------------------

-- Problem statement
-- List the productLines that has quantity in stock more than 50000. Sort the result in increasing order of quantity. Write down the name of the product Line which has the lowest quantity in stock.

-- Note: Answer should be in lowercase letters.
-- mysql> SELECT productLine
--     -> FROM Products
--     -> GROUP BY productLine
--     -> HAVING SUM(quantityInStock) > 50000
--     -> ORDER BY SUM(quantityInStock) ASC;
-- +--------------+


--  IN and NOT IN operaters ------------------------------------
-- Problem statement
-- Get employeeNumber of President and VP sales.

-- select employeenumber from employees where jobtitle in ('President','VP sales');
-- -------------------q

-- Get details of those employees who don't report to President and VP sales (use employeeNumber from last result).

-- select employeenumber from employees where reportsto not in ('1002','1056') order by employeenumber;

-- BETWEEN AND NOT BETWEEN

-- Q

-- Problem statement
-- Get Different productLines whose msrp is in between 50 and 90 and they are not from productLine ‘Ships’ and ‘Planes’ (Use the original products table) .
--  select productline from products where msrp between 50 and 90 and productline not in ('Ships','Planes');


-- like and escape (use of '\%' for cases where we have % or _ included in parameters already)characters

-- q1
-- Problem statement
-- Get details of those employees whose first name starts with ‘L’ and reports to 1143.

-- Use the employees table for the same.
-- select firstname,lastname from employees where firstname like 'L%' and reportsto='1143';

-- q2
-- Get phone number of customer whose customerName has ‘to-Mo’ In between the name from customers table
-- select phone from customers where customername like '%to-mo%';


-- inner join------------------

-- Problem statement
-- Tick the correct order numbers of 'Atelier graphique' (customer name) from orders and customer table;
-- select ordernumber from orders o join customers c on o.customernumber=c.customernumber where customername='Atelier graphique';

-- multiple tables

-- Get sum of priceeach from orderdetails table for customer name ’Atelier graphique’ from customers table matching orderNumber from orders table
-- select sum(priceeach) from orderdetails os left join orders d on os.ordernumber=d.ordernumber left join customers c on d.customernumber=c.customernumber where c.customername='Atelier graphique';


-- INDEXING (book page number) -------  Very important ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- by default indexing is done basis primary key/unique
-- primary key=unique+not null
-- synatx>> show indexes from table;
-- indexing is done for primary key or unique key
-- for primary key cluster indexing is done(exact replica is created of main table)
-- for unqiue non-cluster indexing is done(reference is given to main table ,no exact table is creatd)
-- except primary and unqiue indexing is done for mul type>>multiple
-- write explain before a query to know how many rows have been scanned
-- for indexed columns less no. of rows will be scanned as compared to other columns. because there is no ordereing for other columns
