
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
 
 -------------------------------------------------------------------------------------------------------------------------------------------
 -- inseting the data

drop table if exists Student;
create table if not exists Student(
             roll_no serial primary key,
             first_name varchar(50),
             last_name varchar(50),
             department varchar(50),
             age int check(age >18),
             addmission_date date 
             );
select * from Student;             
 
 -- inset value in single rows
 insert into Student(roll_no , first_name,last_name, department,age,addmission_date)
 values(1,"monika","chauhan","CSE",23,'2022-11-20');
 select * from Student;
 
  -- inset value in multiplr rows rows
 insert into Student(roll_no , first_name,last_name, department,age,addmission_date)
 values(2,"Anushka","sharma","ECE",20,'2022-11-10'),
 (3,"priya","mittal","CE",22,'2022-11-05'),
 (4,"pavel","patel","CIVIL",21,'2022-11-02'),
 (5,"rohit","sharma","CSE",23,'2022-11-04');
 select * from Student;
 
 -- insert the partial data 
  insert into Student(roll_no , first_name,last_name)
 values(6,"Aakash","prajapati");
 select * from Student;
 
 -- insert data without orders
insert into Student(addmission_date, last_name,first_name, roll_no)
 values("2022-11-13","kashyap","laxmi",7);
 select * from Student;


-- adding cuurent date and default values
drop table if exists default_table;
create table if not exists default_table(
             roll_no serial primary key,
             name varchar(50) not null,
             department varchar(50) default "not filled",
             addmission_date timestamp default current_timestamp
             );
select * from default_table;  
 
 -- insert single valuse
 insert into default_table(name) values("Monika");
 select * from default_table;
 
  -- insert multiple values valuse
 insert into default_table(name) values("anuskha"),("preety"),("laxmi"),("komal"),("hussan"),("chetna");
 select * from default_table;
 
 insert into default_table(name,department) values("anu","cse"),("priya","Bca"),("lovi","Bba"),("kamal","Ce");
 select * from default_table
 
insert into default_table(name,addmission_date) values("pragati","2022-11-29");
select * from default_table;
