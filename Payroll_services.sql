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

