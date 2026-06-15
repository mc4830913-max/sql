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




















