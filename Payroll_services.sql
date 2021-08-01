--UC1--Creating the payroll_services table--
create database payroll_services;
use payroll_services;
--UC2-Creating table for employee payroll with attributes columns id,name, salary and start date--
create table employee_payroll
(
id int identity(1,1) primary key,
name varchar(200) not null,
salary float,
startDate date
)
--UC3-Inserting the data into the table --
insert into employee_payroll values('siva','2021-07-31',34344,'M'),('Dhoni','2020-07-31',243518,'M');

--UC4-Retriving the data --
select*from employee_payroll;
--UC5-Retriving data --
select salary,name from employee_payroll where name = 'siva';
select * from employee_payroll where startDate between cast('2020-07-31' as date) and getdate();
--UC6-Alter and Update the table--
alter table employee_payroll add gender char(1);
update employee_payroll set gender='M' where name='Dhoni';
update employee_payroll set gender='F' where name='siva';
--UC7-Finding sum avg,min,max--
select sum(salary) as totalSalary,gender from employee_payroll group by  gender;
select avg(salary) as avgSalary,gender from employee_payroll group by  gender;
select min(salary) as minSalary,gender from employee_payroll group by  gender;
select max(salary) as maxSalary,gender from employee_payroll group by  gender;
--UC8-Adding Employee info--
alter table employee_payroll add phonenumber bigint
alter table employee_payroll add address varchar(200) Default('INDIA')
alter table employee_payroll add department varchar(20) Default('Engineering')
update employee_payroll 
set phonenumber = 7895463154, address = 'madurai', department = 'engineering' where name = 'siva' 
update employee_payroll 
set phonenumber = 8667361462, address = 'chennai', department = 'engineering' where name = 'Dhoni' 
--UC9-Altering employee table --
alter table employee_payroll drop column salary
alter table employee_payroll add BasicPay int ,Deduction float,TaxablePay float , IncomeTax float,NetPay float 
--UC10-Adding Terrisa's details as marketing and Sale department--
insert into employee_payroll values ('Terissa' ,'2000-10-10','F','9786146315','virudhunagar','Marketing and sales','10000','200','100','1000','100')
select * from employee_payroll where name = 'Terissa'
---UC11- Modifiying the tables using er diagrams
--creating employee table with employee details--
create table Employee
(
emp_Id int identity(1,1) primary key,
 employee_name varchar(200),
 company_id int,
 dept_id int,
 phoneNumber bigint,
 address varchar(300),
 city varchar(100),
 state varchar(100),
 startDate date
)
--creating the company table with company name and company id
create table Company
(
  company_id int primary key,
  company_name varchar(200)
)
--creating the department table with Department id and department  name--
create table Department
(
  Dept_id int primary key,
  Dept_name varchar(200)
)
--creating the payRoll table with salary details--
create table PayRoll
(
  Emp_id int,
  BasicPay int, 
  Deduction float, 
  TaxablePay float, 
  Tax float,
  NetPay float
)
--creating employee department table  connecting employee and department--
create table Employee_Department
(
  Emp_id int,
  Dept_id int
)

insert into Department values(1,'Engineering')
insert into Department values(2,'HR')
insert into Department values(3,'Sales')
insert into Department values(4,'Marketing')
insert into Department values(5,'Intelligence')
select * from Department

Alter table Employee_Department ADD FOREIGN KEY (Emp_id) REFERENCES Employee(Emp_id)
Alter table PayRoll add foreign key(Emp_id) references Employee(Emp_id)

insert into Company values(1,'Zoho')
insert into Company values(2,'TVS')
insert into Company values(3,'TCS')

Alter table Employee drop column dept_id
select * from Employee
--inserting the values in the employee table--
insert into Employee values('siva',1,8667361462,'temple street','chennai','Tamilnadu','2020-06-10')
insert into Employee values('bala',1,9786164316,'East road','trichy','Tamilnadu','2020-07-12')
insert into Employee values('Karthi',1,9876543215,'north road','salem','Tamilnadu','2020-09-5')
insert into Employee values('Terissa',1,8765432195,'anna nagar','madurai','Tamilnadu','2000-10-10')
insert into Employee values('Mathi',3,4563217890,'melur','madurai','Tamilnadu','2015-05-16')

update Employee set phoneNumber=8667361462 where employee_name='siva'
update Employee set phoneNumber=4563217890 where employee_name='Muthu'
update Employee set phoneNumber=9786164316 where employee_name='bala'

update Employee set startDate='2020-09-5' where emp_id=3
update Employee set startDate='2000-10-10' where emp_Id=4

alter table Employee add gender varchar(1)
update Employee set gender='M' where employee_name='siva' or employee_name='bala' or employee_name='Karthi'
update Employee set gender='F' where employee_name='Terissa' or employee_name='Mathi' 

--insering the department of the employee--
insert into Employee_Department values(1,3)
insert into Employee_Department values(2,2)
insert into Employee_Department values(3,1)
insert into Employee_Department values(4,4)
insert into Employee_Department values(5,5)

select * from Employee_Department

--Adding the salary details in the pay roll--
insert into PayRoll(Emp_id,BasicPay,Deduction,TaxablePay,Tax) values((select emp_id from Employee where employee_name='siva'),20000,2000,1500,500)
insert into PayRoll(Emp_id,BasicPay,Deduction,TaxablePay,Tax) values(2,50000,10000,500,200),(3,35000,4500,300,245),(4,29000,5640,789,409),(5,45000,789,3456,300)
update PayRoll set NetPay=(BasicPay-Deduction)

select * from PayRoll

select * from PayRoll where Emp_id in (select Emp_id from Employee_Department where Dept_id=4)
--UC7-Finding sum avg,min,max--
select sum(PayRoll.NetPay) as totalsalary,Employee.gender from PayRoll,Employee group by gender
select max(PayRoll.NetPay) as Minsalary,Employee.gender from PayRoll,Employee group by gender
select min(PayRoll.NetPay) as Maxsalary,Employee.gender from PayRoll,Employee group by gender
select avg(PayRoll.NetPay) as Avgsalary,Employee.gender from PayRoll,Employee group by gender

