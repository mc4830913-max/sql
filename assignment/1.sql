-- create database myntra;
use myntra;

-- showing the Dataset
select * from data;

-- showing specific columns
select brand_name,sizes from data;

-- showing specific column in specific order
select brand_tag,product_tag from data;

-- create new column with mathemtical functions | Making Discounted Amount
select marked_price,discounted_price,marked_price-discounted_price as "discounted_amount" from data;


-- create new column with mathemtical functions | Making Rating Count * Rating
select rating,rating_count,rating*rating_count as "total_rating" from data;

-- create new column with mathemtical functions | Making Discount Percentage
select marked_price,discounted_price,(marked_price-discounted_price)*100/(marked_price) as "discounted_percentage" from data;

-- Finding UNIQUE values
select distinct(brand_name) from data;
select distinct(product_tag) from data;
select distinct(brand_tag) from data;

-- Adding Where Clause
 select brand_name,brand_tag,product_tag from data 
where brand_name="biba";
  select brand_name,brand_tag,product_tag from data 
where brand_name="MANGO";
   select brand_name,brand_tag,product_tag from data 
where brand_name="adidas";

-- Adding Distinct with Where | Unique Products served by biba
 select distinct(product_tag),brand_name from data 
where brand_name="biba";

Adding Distinct with Where | Unique Products served by Adidas
 select distinct(product_tag),brand_name from data
 where brand_name="adidas";

Products with Multiple Where Clause with AND
select product_tag,brand_name from data where brand_name="adidas" and product_tag="tshirts";
select product_name,product_tag,brand_name,brand_tag,discounted_price from data 
where brand_name="adidas"
 and discounted_price>5000
 and discounted_price<15000;


-- Products with BETWEEN
select product_name,product_tag,brand_name,brand_tag,discounted_price from data 
where brand_name="adidas" and  discounted_price between 5000 and 10000;

-- Adding more filters
select product_name,brand_tag,discounted_price,rating from data
 where brand_name="adidas"
 and discounted_price>1000
 and rating<=4;


-- Lets go one steps ahead
select product_name,product_tag,brand_name,brand_tag,discounted_price,rating from data 
where brand_name in ("adidas" ,"biba","puma") and 
 discounted_price between 5000 and 10000
 and rating <=4;

-- One More
select distinct(product_tag),brand_name,rating,discounted_price,sizes from data 
where brand_name ="H&M" 
and discounted_price>5000 and
rating>=4
 ;

-- Using OR
select product_name,product_tag,brand_name,brand_tag,discounted_price,rating from data 
where product_tag="tshirts" or rating>=3;

-- Using NOT
select product_name,product_tag,brand_name,brand_tag,discounted_price from data 
where not (brand_name="adidas" ,brand_name="biba") and  discounted_price between 5000 and 10000;

-- Using IN
select product_name,product_tag,brand_name,brand_tag,discounted_price from data 
where brand_name in ("adidas" ,"biba") and  discounted_price between 5000 and 10000;


-- Using NOT IN
select product_name,product_tag,brand_name,brand_tag,discounted_price from data 
where brand_name in ("adidas" ,"biba") and  discounted_price between 5050 and 10000;
