-- -----UC1-----

CREATE DATABASE payroll_service;
show databases;
use payroll_service;
select database();

 -- -----UC2-----
drop table employee_payroll;
CREATE TABLE employee_payroll
(
id INT unsigned NOT NULL AUTO_INCREMENT,
name VARCHAR(150) NOT NULL,
salary Double NOT NULL,
startdate DATE NOT NULL,
PRIMARY KEY (id)
);
describe employee_payroll;

-- -----UC3-----

INSERT INTO employee_payroll (name, salary, startdate) values
('Marry',5000,'2021-01-14'),
('Neha',7000,'2021-07-22'),
('Mohan','4000','2020-09-20');

-- -----UC4------

Select * from employee_payroll;

-- ---UC5-----

select salary from employee_payroll where name = 'Marry';
select * from employee_payroll where startdate between CAST('2020-01-14' AS DATE) and DATE(NOW());
-- select * from employee_payroll where startdate between CAST('2021-07-22' AS DATE) and DATE(NOW())

-- ---UC6-----

alter table employee_payroll add gender CHAR(1) after name;
use payroll_service;
update employee_payroll set gender = 'F' where name = 'Marry';
update employee_payroll set gender = 'F' where name = 'Neha';
update employee_payroll set gender = 'M' where name = 'Mohan';

-- ---UC7-----

select avg(salary) from employee_payroll where gender = 'F' group by gender;
select max(salary) from employee_payroll group by gender;
select min(salary) from employee_payroll group by gender;
select sum(salary) from employee_payroll group by gender;
select gender, count(salary) from employee_payroll group by gender;

-- -----UC8-----

alter table employee_payroll add phone_number varchar(150) after name;
alter table employee_payroll add address varchar(250) after phone_number;
alter table employee_payroll add department varchar(150) not null after address;
alter table employee_payroll alter address set default 'TBD';
insert into employee_payroll(name,salary,startdate,department) values
('bridgelabz',20000,'2020-02-16','IT'),
('bridgelabz',15000,'2020-02-16','HR'),
('bridgelabz',10000,'2020-02-16','Finance');

-- -----UC9-----

alter table employee_payroll rename column salary to basic_pay;
alter table employee_payroll add deductions double not null after basic_pay;
alter table employee_payroll add taxable_pay double not null after deductions;
alter table employee_payroll add tax double not null after taxable_pay;
alter table employee_payroll add net_pay double not null after tax;

-- ---UC11-----

create table company  ( company_id int auto_increment primary key,  name_of_company varchar(150) );
insert into company(name_of_company) values ('Capgemini');
insert into company(name_of_company) values ('BridgeLabz');
insert into company(name_of_company) values ('Oracle');

create table department ( department_id int auto_increment primary key, department_name varchar(150)  );
insert into department(department_name) values ('Sales');
insert into department(department_name) values ('Marketing');

create table employee ( emp_id int auto_increment primary key, company_id int, department_id int, name varchar(150) not null, gender char, phone_number long , address varchar(250) );
alter table employee add foreign key (company_id) references company(company_id);
alter table employee add foreign key (department_id) references department(department_id);
insert into employee(company_id, department_id, name, gender, phone_number, address) values ( 1, 1, 'Venesa', 'F', 894561237, 'Pune Maharashtra');
insert into employee(company_id, department_id, name, gender, phone_number, address) values ( 1, 1, 'Avinash', 'M', 89009889, 'Bangalore Karnataka');
insert into employee(company_id, department_id, name, gender, phone_number, address) values ( 1, 1, 'Teresa', 'F', 98765435678, 'Shimla HP');
insert into employee(company_id, department_id, name, gender, phone_number, address) values ( 1, 2, 'Teresa', 'F', 98765435678, 'Shimla HP');

create table payroll  ( emp_id int , basic_pay double, deduction double, taxable double, tax double, net_pay double);
alter table payroll add foreign key (emp_id) references employee(emp_id);
insert into payroll values (1, 2000, 100, 300, 500, 1500);
insert into payroll values (2, 4000, 100, 500, 400, 2500);
insert into payroll values (3, 3000, 100, 300, 500, 2000);
insert into payroll values (4, 4000, 200, 600, 700, 2200);

drop table emp_dept ;
create table emp_dept  ( emp_id int, department_name varchar(20) );
alter table emp_dept add foreign key (emp_id) references employee(emp_id);
insert into emp_dept values (1,'Sales');
insert into emp_dept values (2,'Sales');
insert into emp_dept values (3,'Sales');
insert into emp_dept values (4,'Marketing');

