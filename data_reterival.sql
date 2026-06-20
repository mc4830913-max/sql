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

------------------------------------------------------------------------------
-- join in sql 
use data1;

select * from student;
select * from default_table;

-- inner join 
select * from student  as s
inner join default_table as d
on s.roll_no=d.roll_no;

-- left join 
select * from student  as s
left join default_table as d
on s.roll_no=d.roll_no;


-- right join 
select * from student  as s
right join default_table as d
on s.roll_no=d.roll_no;

-- cross inner join
select * from student  as s
left join default_table as d
on s.roll_no=d.roll_no
union
select * from student  as s
right join default_table as d
on s.roll_no=d.roll_no;


------------------------------------------------------
-- set operators 
use data1;

select * from student;
select * from default_table;

-- union |remove duplicated
select roll_no  from student union
select roll_no from default_table;

-- union all |donnot remove duplicate 
select roll_no  from student union all
select roll_no from default_table;

-- except |show the dominanating table that not is there in  other table 
select first_name from student except
select name from default_table;

-- intersection 
select roll_no  from student intersect
select roll_no from default_table;

---------------------------------------------------------------------------------
use data1;

CREATE TABLE IF NOT EXISTS users_2021  (UserID INT PRIMARY KEY, Name VARCHAR(50));
CREATE TABLE IF NOT EXISTS users_2022  (UserID INT PRIMARY KEY, Name VARCHAR(50));
CREATE TABLE IF NOT EXISTS users_2023  (UserID INT PRIMARY KEY, Name VARCHAR(50));

INSERT INTO users_2021 (UserID, Name) VALUES (1, 'Ashish'), (2, 'Laura'), (7, 'Prakash');
INSERT INTO users_2022 (UserID, Name) VALUES (1, 'Ashish'), (2, 'Laura'), (3, 'Charlie'), (4, 'Grace');
INSERT INTO users_2023 (UserID, Name) VALUES (1, 'Ashish'), (2, 'Laura'), (3, 'Charlie'), (4, 'Grace'), (5, 'Henry');

select * from users_2021;
select * from users_2022;
select * from users_2023;

-- 1. List the new users added in 2022
select * from users_2022 as t_22
except select * from users_2021 as t_21

-- 2. List the new users added in 2023
select * from users_2023 as t_23
except select * from users_2022 as t_22


-- 3. List the users who left us
select * from users_2021 as t_21
except select * from users_2022 as t_22 except select * from users_2023 as t_23;

-- 4. List all the users that are there throughout the database for year 2021 & 2022
select * from users_2021 as t_21
union select * from users_2022 as t_22 ;

-- 5. List all the users that are there throughout the database
select * from users_2021 as t_21
union  select * from users_2022 as t_22 union select * from users_2023 as t_23;

-- 6. List the users that are there with us from last 3 years
select * from users_2021 as t_21
intersect select * from users_2022 as t_22 intersect select * from users_2023 as t_23;

-- 7. List the all the users except that users who are there with us from 3 years
(select * from users_2021 as t_21
union select * from users_2022 as t_22 union select * from users_2023 as t_23)
 except 
 select * from users_2021 as t_21
intersect select * from users_2022 as t_22 intersect select * from users_2023 as t_23;

-- 8. Operators with Join
select * from users_2021 as t_21
left join users_2022 as t_22
on t_21.USERID=t_22.USERID
except
select * from users_2021 as t_21
right join users_2022 as t_22
on t_21.USERID=t_22.USERID;

select * from users_2021 as t_21
left join users_2022 as t_22
on t_21.USERID=t_22.USERID
union
select * from users_2021 as t_21
right join users_2022 as t_22
on t_21.USERID=t_22.USERID;

select * from users_2021 as t_21
left join users_2022 as t_22
on t_21.USERID=t_22.USERID
intersect
select * from users_2021 as t_21
right join users_2022 as t_22
on t_21.USERID=t_22.USERID;

-- showing valuse that are not common in two table 
(select * from users_2021 as t_21
left join users_2022 as t_22
on t_21.USERID=t_22.USERID
union
select * from users_2021 as t_21
right join users_2022 as t_22
on t_21.USERID=t_22.USERID)
except
(select * from users_2021 as t_21
left join users_2022 as t_22
on t_21.USERID=t_22.USERID
intersect
select * from users_2021 as t_21
right join users_2022 as t_22
on t_21.USERID=t_22.USERID);

-----------------------------------------------------------------------------------


 
 
 
 
 
 

