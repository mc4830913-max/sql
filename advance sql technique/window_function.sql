use swiggy;
select * from restaurants;

--  window function
-- 1. create a new column  containg the average rating of restaurants throughout tyhe thatset 
select *,round(avg(rating) over(),2) as avg_rating from restaurants;

-- 2. create a new column  containg the average rating_count of restaurants throughout tyhe thatset 
select *,round(avg(total_rating) over(),2) as avg_total_rating from restaurants;

-- 3.create a new column  containg the average cost of restaurants throughout tyhe thatset 
select *,round(avg(price) over(),2) as avg_price from restaurants;

-- 4.create a new column  containg the average,min,max of cost, rating,rating count of restaurants throughout tyhe thatset 
select ID,City,Restaurant,food_type,
    round(min(rating) over() ,2) as min_rating,
	round(max(rating) over() ,2) as max_rating,
	round(avg(rating) over() ,2) as avg_rating,
    
	round(min(total_rating) over() ,2) as min_total_rating,
	round(max(total_rating) over() ,2) as max_total_rating,
	round(avg(total_rating) over() ,2) as avg_total_rating,
    
      round(min(price) over() ,2) as min_cost,
	round(max(price) over() ,2) as max_cost,
	round(avg(price) over() ,2) as avg_cost
 from restaurants;
 
 -- 5.create a column containing the avrage cost of the city  where the specific restaurant is from 
 select *,round(avg(price) over(partition by city),2) as avg_price from restaurants;
 
  -- 6.create a column containing the avrage cost of the food_type where the specific restaurant is serving
 select *,round(avg(price) over(partition by food_type),2) as avg_price from restaurants;

-- 7. create for the both  
 select *,
     round(avg(price) over(partition by city),2) as avg_price_city ,
      round(avg(price) over(partition by food_type),2) as avg_price_food 
 from restaurants;
 
 -- 8.list the restaurants whose cost is more than the avg cost of the reataurants
 select * from restaurants where price> (select avg(price) from restaurants);
-- using window function
select * from (select *, round(avg(price) over(),2) as avg_cost from restaurants) as t where t.price> t.avg_cost;

 -- 9blist the restaurants whose food_type cost is more than the avg cost of the reataurants
 select * from (select *, round(avg(price) over(partition by food_type),2) as avg_cost from restaurants) as t where t.price> t.avg_cost;
