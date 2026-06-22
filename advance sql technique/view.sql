use swiggy;
select * from restaurants;

-- 1 create a view 
drop view if exists rest;
create view rest as(
select city,restaurant,price, rating,total_rating as "orders", food_type,
   price*total_rating as "revenue" from restaurants);
   
select * from rest;   

-- 2 create a view  fro end user
drop view if exists end_user;
create view end_user as(
select city,restaurant,price, rating,total_rating as "orders",food_type
   from restaurants);
   
   select * from end_user;
   
-- 3. create a view of sweet dishes 
drop view if exists dishes;
create view dishes as(
select * from restaurants 
where food_type in ("chinese","sweets"));
   
   select * from dishes;
   
-- 4. create a view of top 100 resturants
drop view if exists top_100;
create view top_100 as( 
select * from restaurants order by total_rating asc limit 100);
select * from top_100;

-- 5. create a view of least 100 resturants
drop view if exists least_100;
create view least_100 as( 
select * from restaurants order by total_rating desc limit 100);
select * from least_100;

-- 6. create a view of top 1000 expensive  resturants 
drop view if exists top_1000_exp;
create view top_1000_exp as( 
select * from restaurants order by price desc limit 1000);
select * from top_1000_exp;

-- 7. create a view fro top rated restaurants as per city 
drop view if exists top_rated_rest_per_city;
create view top_rated_rest_per_city as
select * from (select * ,row_number() over(partition by city order by rating*total_rating desc) as "rank" from restaurants) as t
where t.rank=1 ;
select * from top_rated_rest_per_city;
   
 
  
