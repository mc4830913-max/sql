
-- create first table 
drop table if exists Student;
create table if not exists Student(
             roll_no int,
             name varchar(50),
             department varchar(50),
             age int);
select * from Student;             
  
 -- table with constraint 
drop table if exists Student;
create table if not exists Student(
             roll_no int unique,
             name varchar(50) not null ,
             department varchar(50),
             age int check(age>18) 
             );     
select * from Student;    


drop table if exists Student;
create table if not exists Student(
             roll_no int unique auto_increment,
             name varchar(50) not null ,
             department varchar(50),
             age int check(age>18) ,
             admission_date date
             );     
select * from Student;  

---ddl_commands 
-- adding new column in table 
alter table Student add column gmail varchar(50);
select * from Student;

-- rename column in table 
alter table Student change column name  student_name varchar(50) not null;
select * from Student;

-- drop  column in table 
alter table Student drop column department;
select * from Student;

-- adding new column in table by default value
alter table Student modify column gmail varchar(50) default "not provided ";
select * from Student;


------------------------------------------------------------------------------------------------------------------------------------------
-- keys and constraints

-- primary key 
drop table if exists Student;
create table if not exists Student(
             roll_no serial primary key,
             name varchar(50),
             department varchar(50));
select * from Student;             
 
 -- composite key 
drop table if exists orders;
create table orders(
 order_id serial,
 customer_id int,
 puchase_date date,
 primary key(order_id,customer_id)
 );
           
 select * from orders; 
 
 -- foreign key
drop table if exists orders;
create table orders(
 order_id serial,
 customer_id int,
 puchase_date date,
foreign key(customer_id) references Student(roll_no)
 );
           
 select * from orders; 
 
 -- unique constraint 
drop table if exists Student;
create table if not exists Student(
             roll_no serial primary key,
             name varchar(50),
             department varchar(50),
             email varchar(50) unique,
             phone_no int(15) unique
             );
select * from Student;   
 
 -- check constraint 
drop table if exists Student;
create table if not exists Student(
             roll_no serial primary key,
             name varchar(50),
             department varchar(50),
             age int check(age>=18));
select * from Student;   
 
 
 
