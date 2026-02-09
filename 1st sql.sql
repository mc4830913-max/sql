create database if  not exists analytics;
use analytics;
create table if not exists 1st(
 user_id int primary key,
 user_name varchar(250) not null,
 email varchar(250) not null,
 age int,
 city varchar (225)
);

insert into 1st (user_id,user_name,email,age,city) values
(1, 'user1', 'AAA@example.com', 25, 'City1'),
    (2, 'user2', 'BBB2@example.com', 30, 'City2'),
    (3, 'user3', 'CCC3@example.com', 22, 'City3'),
    (4, 'user4', 'DDD4@example.com', 28, 'City4'),
    (5, 'user5', 'EEE5@example.com', 35, 'City5');
    
    
select *from 1st;
    




