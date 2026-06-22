use swiggy;
select * from restaurants;

-- 1 list the top 5 food type as per revenue generted by top 5 retaurants
select food_type,sum(price*total_rating) as "revenue" from 
    (select * , price*total_rating ,row_number()
    over(partition by food_type order by price*total_rating desc) as "rank"   from restaurants) t
    where t.rank<6
    group by food_type
    order by revenue desc;

-- 2. what is the o total reveneue is generated  by top % retaurants
select sum(price*total_rating) as "revenue" from
        (select *,price*total_rating, row_number() over(order by price*total_rating desc) as "rank" from restaurants) t
        where t.rank<=86.80;

-- 3 check the same fro 20% restaurants
select sum(price*total_rating) as "revenue" from
        (select *,price*total_rating, row_number() over(order by price*total_rating desc) as "rank" from restaurants) t
        where t.rank<=1736;

-- 4. what  % of total reveneue is generated  by top 20% retaurants with respect to total reveneue
with 
q1 as (select sum(price*total_rating) as "top_revenue" from
        (select *,price*total_rating, row_number() over(order by price*total_rating desc) as "rank" from restaurants) t
        where t.rank<=1736),
        q2 as (select sum(price*total_rating) as "total_revenue" from restaurants)
        select (top_revenue/total_revenue)*100 as "revenue %"from q1,q2;
