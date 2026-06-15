----data retrivel 

use newschema;
select * from clean_olist_order_payment_dataset;
select order_id,payment_value  from  clean_olist_order_payment_dataset;

select order_id as ID from clean_olist_order_payment_dataset;

select * from clean_olist_order_payment_dataset  where payment_value >100;

select * from clean_olist_order_payment_dataset  where payment_value >100 and payment_category="single";

select * from clean_olist_order_payment_dataset  where payment_value >100 and payment_value < 200;

select * from clean_olist_order_payment_dataset  where payment_value between 100 and 200;

select * from clean_olist_order_payment_dataset  where payment_type= "boleto" or payment_type= "voucher"; 

select * from clean_olist_products_dataset where product_category_name like "be%"

select * from clean_olist_products_dataset where product_category_name="b%" or product_category_name like "%e"

select * from clean_olist_products_dataset limit 5;

select * from clean_olist_products_dataset limit 5 offset 10;

select * from clean_olist_products_dataset where product_category_name="bebes" limit 5 ;

select * from clean_olist_products_dataset order by product_weight_g desc;

-------------------------------------------------------------------------------------------------------------------------------------------------
-- caese in sql 

use newschema;

select * from clean_olist_products_dataset;

select product_category_name as name  from clean_olist_products_dataset;

-- --basic case 
select product_id,
case product_category_name
     when "bebes" then "bebes category"
     else "other"
end as name  from clean_olist_products_dataset;

-- caese for the bebes and perfumia 
select product_id,
case product_category_name
     when "bebes" then "bebes category"
     when "perfumaria" then "perfumaria category"
     else "other"
end as name  from clean_olist_products_dataset;

-- caese with quantity 
select product_id,
case 
     when product_photos_qty =1  then "Low-volume customer "
     when product_photos_qty >=2 and product_photos_qty<=5 then "medium-volume customer"
     else "high-volume customer"
end as quantity  from clean_olist_products_dataset;

-- nested case
select product_id,
case 
     when product_photos_qty =1 then
		case 
			when product_category_name ="bebes" then "low volume bebes category"
            else "low category"
            end
     when product_photos_qty >=2 and product_photos_qty<=5 then "medium-volume customer"
     else "high-volume customer"
end as quantity  from clean_olist_products_dataset;


-- null caeses
select product_id,
case 
     when product_category_name is null then "not assigned product name"
     else product_category_name 
end as quantity  from clean_olist_products_dataset;

---------------------------------------------------------------------------------------------------------------------------------------------------










































