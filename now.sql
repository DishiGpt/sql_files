drop database bank;
create database bank;
use bank;

create table employee( 
employee_no int primary key,
employee_name varchar(30),
address varchar(40),
salary float,
age smallint);

alter table employee 
add email varchar(40);

insert into employee(employee_no,employee_name,address,salary,age,email)
values
(1,'Lily','kamla nagar',1200000,32,'abcd@gmail.com'),
(2,'Rose','ashok nagar',1400000,30,'pqrs@gmail.com'),
(3,'Lavender','kamla nagar',1500000,34,'efgh@gmail.com'),
(4,'Daisy','shakti nagar',1300000,28,'wxyz@gmail.com'),
(5,'Lilac','adarsh nagar',1600000,31,'mnop@gmail.com');

select * from employee;
select * from employee where salary=(select max(salary) from employee);

select * from employee where salary=(select min(salary) from employee);

select avg(salary) from employee as average_salary;

select count(employee_no) from employee as total_employees;