use myntra;
select * from data;

-- 1. Finding the names of unique brands
select distinct(brand_name) from data;

-- 2. Finding the number of unique brands
select count(distinct(brand_name)) from data;

-- 3. Finding the number of products in each brands
select brand_name,count(product_name) as 'products'from data
group by brand_name;

-- 4. Finding the top 5 brand who has the most number of products | different product in their inventory
select brand_name,count(product_name) as 'products'from data
group by brand_name
order by products desc limit 5;

-- 5. Finding the top 5 brand who sold the most number of products
select brand_name ,sum(rating_count) as 'products_sold'from data
group by brand_name
order by products_sold desc limit 5;

-- 6. Finding the top 5 most expensive brands based on their discounted price
select brand_name,round(avg(discounted_price)) as 'dis_price'from data
group by brand_name
order by dis_price desc limit 5;


-- 7. Finding the top 5 least expensive brands based on their discounted price
select brand_name,round(avg(discounted_price),2) as 'dis_price'from data
group by brand_name
order by dis_price asc limit 5;

-- 8. Finding the top 10 best-selling product categories 
select product_tag,sum(rating_count) as 'rating'from data
group by product_tag
order by rating desc limit 10;

-- 9. Finding the top 10 brands who gives maximum discount
select brand_tag, avg(discount_percent)  as 'max_discount' from data
group by brand_tag
order by max_discount desc limit 5;

-- 10. Finding the top 5 most expensive product categories
select product_tag,avg(discounted_price) as 'price'from data
group by product_tag
order by price desc limit 5;

-- 11. Brand Report Card
select brand_tag,
sum(rating_count) as "rated_people",
avg(rating_count) as "avg_rate",
min(marked_price) as "min_price",
max(marked_price) as "max_price" from data
group by brand_tag;

-- 11.0  product  Report Card
select product_tag,
sum(rating_count) as "rated_people",
avg(rating_count) as "avg_rate",
min(marked_price) as "min_price",
max(marked_price) as "max_price" from data
group by product_tag;

-- 12. Which product_category of any brand is sold the most?
select brand_tag,product_tag,sum(rating_count) as "people_rated" from data
group by brand_tag,product_tag
order by people_rated desc limit 10;

-- 13. List top 5 brands which has sold most number of tshirts
select brand_tag,product_tag,sum(rating_count) as "tshirts" 
from data
where product_tag="tshirts"
group by brand_tag
order by tshirts desc limit 5;

-- 14. List top 5 brands which has sold most number of shirts
select brand_tag,product_tag,sum(rating_count) as "shirts" from data
where product_tag="shirts"
group by brand_tag
order by shirts  desc limit 5;

-- 15. List top 5 brands which has sold most number of jeans
select brand_tag,product_tag,sum(rating_count) as "jeans",avg(discounted_price) from data
where product_tag="jeans"
group by brand_tag
order by jeans desc limit 5;

-- 16. List top 5 brands which has sold most number of dresses
select brand_tag,product_tag,sum(rating_count) as "dresses",avg(discounted_price) from data
where product_tag="dresses"
group by brand_tag
order by dresses desc limit 5;

-- 17. Most popular product name listed in Myntra
select product_name,count(product_name) as "order_count" from data
group by product_name
order by order_count desc limit 5;

-- 18. Number of products sold for every rating (0 - 5)
select rating,count(rating) as "freq" from data
group by rating
order by freq desc;

-- 19. Number of products sold for every rating by nike
select brand_name,product_name,rating ,count(rating) as "freq" from data
where brand_name="nike"
group by rating,product_name
order by freq desc;

-- 20. Number of products sold for every rating in tshirt category
select brand_name,product_name,rating ,count(rating) as "freq" from data
where product_name="tshirts"
group by rating,brand_name
order by freq desc;


-- 21. Relation between price of the thisrt and its rating wrt to people rated
select product_tag,rating ,round(avg(rating_count),2) as "product_count" ,round(avg(discounted_price),2)
from data
where product_tag="tshirts"
group by rating
order by rating desc;

-- 22. Find the average rating for each product category (product tag) along with the number of products and total rating count
select product_tag ,round(avg(rating),2) as "freq" ,sum(rating_count),count(*) as "products" from data
group by product_tag
order by freq desc;

-- 23. Find the brand with the highest average rating among products with a discounted price greater than 5000
select brand_tag,product_tag,avg(rating) as "freq" from data
where discounted_price>5000
group by brand_tag,product_tag
order by freq desc;
