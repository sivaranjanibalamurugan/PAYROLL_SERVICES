******UC1*******
create database payroll_services;
use payroll_services;
******UC2*******
create table employee_payroll
(
id int identity(1,1) primary key,
name varchar(200) not null,
salary float,
startDate date
)
*********UC3**********
insert into employee_payroll(name,startDate,salary)values('siva','2021-07-31',34344),('Dhoni','2020-07-31',243518);
select*from employee_payroll;

