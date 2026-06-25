use data1;
select * from indian_dataset; 

-- find the row with not duplicates
select distinct * from indian_dataset; 

-- find the unique value based on id
select distinct id from indian_dataset; 

-- find the unique value based on city
select distinct city from indian_dataset; 

-- find the unique value based on name
select distinct name from indian_dataset order by name desc;

-- find the unique value based on id using rank
select id,name,age,email,city,phone_number,gender,state,purchase_amount,purchase_date from
(
	select *,row_number() over(partition by id order by id) as "rank" from indian_dataset 
 ) as subtable 
 where subtable.rank=1;
 
 -- find the unique value based on multiple column 
select id,name,age,email,city,phone_number,gender,state,purchase_amount,purchase_date from
(
	select *,row_number() over(partition by id,name order by id) as "rank" from indian_dataset 
 ) as subtable 
 where subtable.rank=1;

