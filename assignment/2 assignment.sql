
use swiggy;

alter table restaurants change `Avg ratings` avg_rating varchar(50) not null;
alter table restaurants change `Food type` food_type text(50) not null;
alter table restaurants change `Delivery time` delivery_time varchar(50) not null;
alter table restaurants change `Total ratings` total_rating varchar(50) not null;
select * from restaurants order by city asc;


-- 1. Which restaurant of Delhi is visied by least number of people?
select * from restaurants
where city="Delhi" and total_rating=(select min(total_rating) from restaurants);

-- 2. Which restaurant has generated maximum revenue all over india?
select * from restaurants
where price*total_rating =(select max(price*total_rating) from restaurants);

-- 3. How many restaurants are having rating more than the average rating?
select * from restaurants
where avg_rating> (select avg(avg_rating) from restaurants);

-- 4. Which restaurant of babalore has generated most revenue?
select * from restaurants
where city="Bangalore" and price*total_rating =(select max(price*total_rating) from restaurants);

-- 5. Which restaurant chain has maximum number of restaurants?
select restaurant,count(restaurant) as c
from restaurants
group by restaurant
order by c desc ;

-- 6. Which restaurant chain has generated maximum revenue?
select restaurant,sum(price*total_rating) as revenue
from restaurants
group by restaurant
order by revenue desc ;

-- 7. Which city has maximum number of restaurants?
select city,count(restaurant) as num
from restaurants
group by city
order by num desc;

-- 8. Which city has generated maximum revenue all over india?
select city,sum(price*total_rating) as revenue
from restaurants
group by city
order by revenue desc ;

-- 9. List 10 least expensive cuisines?
select city,food_type,avg(price) as expense
from restaurants
where city="Delhi"
group by food_type
order by expense asc limit 5;

-- 10. List 10 most expensive cuisines?
select city,food_type,avg(price) as expense
from restaurants
where city="Delhi"
group by food_type
order by expense desc limit 5;

-- 11. What is the city is having Biryani as most popular cuisine
select city,food_type,avg(price) as expense
from restaurants
where food_type="biryani"
group by city
order by expense asc;

-- 12. List top 10 unique restaurants with unique name only thorughout the dataset as per generate maximum revenue (Single restaurant with that name)
select restaurant,sum(price*total_rating) as expense
from restaurants
group by restaurant
having count(restaurant)=1
order by expense desc limit 10;
