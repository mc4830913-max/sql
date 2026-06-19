-- pattern matching
use myntra;

-- find the product with brand name end with a
select * from data where brand_name like "%a";

-- find the product with brand name start with s
select * from data where brand_name like "s%";

-- find the product with brand name contain as
select * from data where brand_name like "%as%";

-- find the product with brand anme contain ash
select * from data where product_name like "%ash%";

-- find the product with brand name end with a
select * from data where brand_name like "%a%b";

-- find the product with product name end with a
select * from data where product_name like "d%a";

-- find the product with brand name is exactly 6 character
select * from data where brand_name like "_____";

-- find the product with product name whose 2nd character is fuxed
select * from data where product_name like "_a_d%";

-----------------------------------------------------------------
-- aggregation function
use myntra;
select * from data;

-- finding the number of product in the dataset
select count(*) as total_products from data;
select count(product_name) from data;

-- finding the average of discounted and marked price  in the dataset
select avg(discounted_price) as average_dis from data;
select avg(marked_price) as average_mark from data;

-- finding the max of discounted and marked price  in the dataset
select max(discounted_price) as max_dis from data;
select max(marked_price) as max_mark from data;

-- finding the min of discounted and marked price  in the dataset
select min(discounted_price) as min_dis from data;
select min(marked_price) as min_mark from data;

-- finding the rating by peoples 
select sum(rating_count) as total_rating from data;

-- finding the unique brands
select distinct(brand_name) from data;

-- finding the total unique brands
select count(distinct(brand_name)) from data;

---------------------------------------------------------------------------

use myntra;
select * from data;

-- basic query:to find the avg rating of products
select avg(rating) as "avg_rating" from data;

-- subquery with where clause: find the brand name whose avg rating more then all avg ratings 
select brand_name from data 
where rating> (select avg(rating) as "avg_rating" from data);

-- subquery in select clause: retrive the product name along with the avg rating of the products 
select product_name,rating, 
(select avg(rating) from data) from data;

-- subquery with multiple results: find the total rating clount of products for each brand comparedto the allover average ratring 
select brand_name,(select sum(rating)  from data where brand_name=p.brand_name) as total_rating_count 
from (select distinct brand_name from data) as p;

 
 
 
 
 
 

