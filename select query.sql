use hp;
select * from `10-03-2026`;
select count(distinct product_name) from `10-03-2026`;
select count(rating) from `10-03-2026` where rating != 0;
select product_name,sizes from `10-03-2026` where sizes="onesize";
SELECT product_name, rating 
FROM `10-03-2026`
WHERE rating > 4;
SELECT product_name,rating 
FROM `10-03-2026`
WHERE rating IS NULL;
select product_name,discounted_price from `10-03-2026` order by discounted_price
 desc limit 20; 
SELECT COUNT(*) AS total_products 
FROM `10-03-2026`;
SELECT product_name, COUNT(*) 
FROM `10-03-2026`
GROUP BY rating=4
HAVING COUNT(*) > 1;
select max(brand_name),count(*) as total_products from `10-03-2026`
group by brand_name
order by total_products asc
limit 10; 
