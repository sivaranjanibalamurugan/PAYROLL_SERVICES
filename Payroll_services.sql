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
insert into employee_payroll(name,startDate,salary)values('siva','2021-07-31',34344,'M'),('Dhoni','2020-07-31',243518,'M');
**********uc4*********
select*from employee_payroll;
**********uc5*********
select salary,name from employee_payroll where name = 'siva';
select * from employee_payroll where startDate between cast('2020-07-31' as date) and getdate();
**********UC6*********
alter table employee_payroll add gender char(1);
update employee_payroll set gender='M';


