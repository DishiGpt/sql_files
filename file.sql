
create table branches( 
branch_id int primary key, 
branch_name varchar(25), 
branchmanager_id int unique,
contact_no int,
email varchar(30));

create table transactions( 
transaction_id int primary key,
foreign key (branch_id) references branches(branch_id),
foreign key (employee_id) references employee(employee_id),
transaction_amount decimal(7,2) not null,
transaction_type varchar(20),
customer_id int );

create table employee( 
employee_no int primary key,
employee_name varchar(30),
address varchar(40),
salary float,
age smallint);

alter table employee 
add email varchar(40);
select * from employee;

insert into employee(employee_no,employee_name,address,salary,age,email)
values
(1,'Lily','kamla nagar',1200000,32,'abcd@gmail.com'),
(2,'Rose','ashok nagar',1400000,30,'pqrs@gmail.com'),
(3,'Lavender','kamla nagar',1500000,34,'efgh@gmail.com'),
(4,'Daisy','shakti nagar',1300000,28,'wxyz@gmail.com'),
(5,'Lilac','adarsh nagar',1600000,31,'mnop@gmail.com');

select * from employee where salary=(select max(salary) from employee);
select * from employee where salary=(select min(salary) from employee);
select avg(salary) from employee;
select count(employee_no) from employee;
/*create table employee with id,add,age,salary,name
add email insert 5 records display them, query for max min avg count*/
