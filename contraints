create database if not exists monika;
use monika;
drop table if exists sample;
create table if not exists sample
(user_id varchar(30) primary key,
user_name varchar(220) not null,
age int check (age >= 18),
email varchar(30) not null unique,
city varchar(30),
active boolean default true,
constraint valid_city check (city in('city1','city2','city3','city4','city5'))
);

insert into sample(user_id,user_name,age,email,city)
values(1001, 'user1', 25,'user1@example.com','City5'),
    (1002, 'user2',19, 'user2@example.com','City2'),
    (1004, 'user3',25, 'user3@example.com','City5'),
    (1005, 'user4', 25,'user4@example.com','City1'),
    (1006, 'user5',20, 'user5@example.com','City2'),
    (1007, 'user6',25, 'user6@example.com','City5'),
    (1008, 'user7', 25,'user7@example.com','City1'),
    (1009, 'user8',19, 'user8@example.com','City5'),
    (1010, 'user9',25, 'user9@example.com','City5'),
    (1011, 'user10', 24,'user10@example.com','City1'),
    (1012, 'user12',39, 'user11@example.com','City2'),
    (1013, 'user13',25, 'user12@example.com','City3');

select *from sample;
