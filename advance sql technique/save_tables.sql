use swiggy;
select * from restaurants;


-- 1. create the table od "bangolre_restaurants " conataining only banglore city;
drop table if exists bangalore_rest;
create table if not exists bangalore_rest as
select * from restaurants where city="bangalore";

select * from bangalore_rest;

-- 2. create the table od "city_statistics " conataining aggregate staticsonly  city;
drop table if exists city_statistics;
create table if not exists city_statistics as
select city,avg(rating) as avg_rating, count(*) as num_of_rest  from restaurants 
group by city;

select * from city_statistics;

-- 3 create a new table "expensive_rest" conatining restaurabibg have cost is more than 500
drop table if exists expensive_rest;
create table if not exists expensive_rest as
select * from restaurants where price>500;

select * from expensive_rest;

-- use of alias 
-- 1 selest all column of restaurants conatining alais rest
select * from restaurants as rest ;

-- 2. select city ang avg cost of reastaurant of eacgg using using the alis
select rest.city, rest.avg(price) from
restaurants as rest
group by rest.city;

-- 3. select restaurant that having rating is more thn the av erage rating  of all over the restaurants in the same city using the self redfereencing qreey alais
select rest.* 
from restaurants as rest
where rating>(select avg(rating) from rest where city=rest.city);

--- temporary tables

-- 1. create a temporaray table of restaurtutants using the alias
drop temporary table if exists temp_rest;
create temporary table  temp_rest as 
select * from restaurants;
select * from temp_rest;

-- 2. drop the temporary table
drop temporary table if exists temp_rest;

-- 3.  create a temporaray table of restaurtutants using the alias havig city pune
drop temporary table if exists temp_rest_pune;
create temporary table  temp_rest_pune as 
select * from restaurants where city="pune";
select * from temp_rest_pune;


-- 4. create the table od "bangolre_restaurants " conataining only banglore city;
drop table if exists temp_city_bangalore;
create temporary table temp_city_bangalore as
select * from restaurants
where city="bangalore";
select * from temp_city_bangalore;

-- 5. create the temp table od "city_statistics " conataining aggregate staticsonly  city;
drop table if exists temp_city_statistics;
create temporary table temp_city_statistics as
select city, avg(rating),count(*) as num_rest from restaurants
group by city;

select * from temp_city_statistics;

-- 6.create a new  temp table "expensive_rest" conatining restaurabibg have cost is more than 500
drop temporary table if exists temp_expensive_rest;
create temporary table temp_expensive_rest as
select * from restaurants 
where price>(select avg(price)  from  restaurants);
select * from temp_expensive_rest;


-- 7 create a column expensive restaurants
drop temporary table if exists temp_exp_rest;
create temporary table temp_exp_rest as
select restaurant,price from restaurants 
order by price desc;
select * from temp_exp_rest;
