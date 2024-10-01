create database tachmac_db;
use tachmac_db;
create table techcloud_employees
(
emp_id int,first_name varchar(123),last_name varchar(132),gender enum('M','T','F'),age int);
create table tachsoft_employees
(
emp_id int,first_name varchar(200),last_name varchar(123),gender enum('M','F','T'),age int);


create table tachhyve_employees
(

emp_id int,first_name varchar(132),last_name varchar(123),gender enum('M','F','T'),age int);
-- adding primary key to employee_id
alter table tachsoft_employees add primary key (emp_id);
alter table techcloud_employees add primary key (emp_id);
alter table tachhyve_employees add primary key (emp_id);

-- adding modifiying the age column with check constraint
alter table tachsoft_employees add constraint chk_age check (age between 21 and 55);
alter table techcloud_employees modify age int  check (age between 21 and 55);
alter table tachhyve_employees modify age int check (age between 21 and 55);

-- adding new column proficiency_level
alter table tachsoft_employees add column proficiency_level int;
alter table techcloud_employees add column proficiency_level int;
alter table tachhyve_employees add column proficiency_level int;

-- modify emp_id to varchar
alter table tachsoft_employees modify emp_id varchar(123);
alter table techcloud_employees modify emp_id varchar(200);
alter table tachhyve_employees modify emp_id varchar(145);

insert into tachsoft_employees(emp_id,first_name,last_name,gender,age,proficiency_level
)values
('TH0001','ELI','EVANS','M',26,1),
('TH0002','CARLOS','SIMMONS','M',32,2),
('TH0003','KATHIE','BRYANT','F',25,1),
('TH0004','JOEY','HUGHES','M',41,4),
('TH0005','ALICE','MATTHEWS','F',52,4);

insert into techcloud_employees (emp_id,first_name,last_name,gender,age,proficiency_level) values
("TC0001","TERESA","BRYANT","F",39,2),
("TC0002","ALEXIS","PATTERSON","M",48,5),
("TC0003","ROSE","BELL","F",42,3),
("TC0004","GEMMA","WATKINS","F",44,3),
("TC0005","KINGSTON","MARTINEZ","M",29,2);
select * from tachhyve_employees;
insert into tachhyve_employees (emp_id,first_name,last_name,gender,age,proficiency_level) values
("TS0001","PETER","BURTLER","M",44,4),
("TS0002","HAROLD","SIMMONS","M",54,4),
("TS0003","JULIANA","SANDERS","F",36,2),
("TS0004","PAUL","WARD","M",29,2),
("TS0005","NICOLE","BRYANT","F",30);

create table tachhyve_employees_bkp as select * from tachhyve_employees;
create table tachsoft_employees_bkp as select * from tachhyve_employees;
create table techcloud_employees_bkp as select * from techcloud_employees;
delete from tachhyve_employees where emp_id=("ts0001");
delete from tachsoft_employees where emp_id=("th0001");
delete from techcloud_employees where emp_id=("th0005");
use tacmac_db;
create table tachhyvecloud_employees like tachhyve_employees;

insert into tachhyve_employees(emp_id,first_name,last_name,gender,age,proficiency_level)
select emp_id,first_name,last_name,gender,age,proficiency_level
from techcloud_employees
union
select emp_id,first_name,last_name,gender,age,proficiency_level
from techcloud_employees;

select * from techhyvecloud_employees;
truncate table techcloud_employees;
truncate table tachhyve_employees;
