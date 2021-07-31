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
insert into employee_payroll values('siva','2021-07-31',34344,'M'),('Dhoni','2020-07-31',243518,'M');

**********uc4*********
select*from employee_payroll;
**********uc5*********
select salary,name from employee_payroll where name = 'siva';
select * from employee_payroll where startDate between cast('2020-07-31' as date) and getdate();
**********UC6*********
alter table employee_payroll add gender char(1);
update employee_payroll set gender='M' where name='Dhoni';
update employee_payroll set gender='F' where name='siva';
**********UC7**********
select sum(salary) as totalSalary,gender from employee_payroll group by  gender;
select avg(salary) as avgSalary,gender from employee_payroll group by  gender;
select min(salary) as minSalary,gender from employee_payroll group by  gender;
select max(salary) as maxSalary,gender from employee_payroll group by  gender;
**********UC8**********
alter table employee_payroll add phonenumber bigint
alter table employee_payroll add address varchar(200) Default('INDIA')
alter table employee_payroll add department varchar(20) Default('Engineering')
update employee_payroll 
set phonenumber = 7895463154, address = 'madurai', department = 'engineering' where name = 'siva' 
update employee_payroll 
set phonenumber = 8667361462, address = 'chennai', department = 'engineering' where name = 'Dhoni' 

