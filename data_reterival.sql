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
