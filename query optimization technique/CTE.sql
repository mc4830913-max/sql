
-- common table expression
-- indexing the table
use data1;
select * from indian_dataset;

-- example 1
with filterdata as (
select id,name,city, purchase_amount,gender 
from indian_dataset
where gender="M"
) 
select * from filterdata where purchase_amount>500;

-- example 2 
with highpurchase as (
select id,name,city, purchase_amount,gender 
from indian_dataset
where gender="M"
) 
select name,city from highpurchase where purchase_amount>1000 and city="mumbai";

-- example 3
with avgpurchase as (
select id,name,avg( purchase_amount) as avg_pur
from indian_dataset
group by id,name
) 
select name,id,avg_pur from avgpurchase;

-- example 4
with preaggregated as (
select id,name,count(*) as count_num ,sum(purchase_amount) as total_purchase
from indian_dataset
group by id,name
) 
select name,id,count_num,total_purchase,total_purchase/count_num from preaggregated;

-- example 5
with sum_purchase as (
select city,sum(purchase_amount) as total_purchase
from indian_dataset
group by city
) ,
avg_purchase as
(
select city,avg(purchase_amount) as avg_purchase
from indian_dataset
group by city
) 

select sp.city,sp.total_purchase,ap.avg_purchase
from sum_purchase  as sp
join avg_purchase as ap
on ap.city=sp.city





