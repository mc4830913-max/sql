use analytics;
drop table if exists inventory_store;
create table if not exists inventory_store(
product_id varchar(15) primary key,
product_quantity int,
manufacturing_date date,
product_name varchar(222) not null,
product_category varchar(222),
product_marked_price int not null,
product_dis_per int,
product_img varbinary(100),
rating int,
review boolean);

alter table inventory_store
add column revenue int;


drop table if exists transactions;
create table if not exists transactions(
transaction_id varchar(20) primary key,
product_id varchar(20) not null,
quantity int,
date_of_purchase datetime default current_timestamp,
billing_amount int,
payment_mode varchar(10),
phone_no varchar(15) not null unique,
store_id varchar(20) not null);

drop table if exists users;
create table if not exists users(
phone_no varchar(15) primary key,
user_name varchar(220) not null,
Date_of_birth date,
gmail varchar(220) not null,
address varchar(220) not null
);


drop table if exists stores;
create table if not exists stores(
store_id varchar(20) primary key,
location varchar(220) not null,
contact varchar(15) not null unique,
contract_date date);

drop table if exists store_employees;
create table if not exists store_employees(
employee_id varchar(20) primary key,
store_id varchar(20) not null,
fr_owner varchar(40) not null,
location varchar(220) not null,
contact varchar(15) not null unique,
contract_date date);

select *from inventory_store;
select *from transactions;
select *from users;
select *from stores;
select *from store_employees;
