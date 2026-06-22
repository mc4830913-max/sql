use swiggy;
select * from restaurants;

-- 1. rank every reataurants to most expensive to least expensive 
select *, rank() over(order by price desc) as 'rank' from restaurants;


-- 2. rank every reataurants to most visited to least visited 
select *, rank() over(order by total_rating asc) as 'visit_rank' from restaurants;

-- 3 rank every reataurants to most expensive to least expensive as per city
select *, rank() over(partition by city order by price desc) as 'rank' from restaurants;

-- 4 dense rank every reataurants to most expensive to least expensive as per city
select *, dense_rank() over(partition by city order by price desc) as 'dense_rank' from restaurants;

-- 5. row number every reataurants to most expensive to least expensive as per city
select *,
rank() over(partition by city order by price desc) as 'dense_rank',
dense_rank() over(partition by city order by price desc) as 'dense_rank',
 row_number() over(partition by city order by price desc) as 'row_num' from restaurants;
 
 -- 6 rank every reataurants to most expensive to least expensive as per city along with the city rank(delhi-1, delhi-2)
 select * ,concat(city,"-",row_number() over(partition by city order by price desc)) as 'rank' from  restaurants;
 
 -- 7. top 5 retaurents of every city  as per their revenue 
 select * ,
     price* total_rating as "revenue",
     row_number() over(partition by city order by price*total_rating desc ) as "rank" from restaurants;
     
select * from (select*,
     price* total_rating as "revenue",
     row_number() over(partition by city order by price*total_rating desc) as "rank"
     from restaurants) t
     where t.rank<6;
     
  -- 8. top 5 retaurents of every food_type as per their  revenue  
  select * from (select*,
     price* total_rating as "revenue",
     row_number() over(partition by food_type order by price*total_rating desc) as "rank"
     from restaurants) t
     where t.rank<3;
