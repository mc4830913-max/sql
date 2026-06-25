use data1;
select * from indian_dataset order by id asc;

-- add new column for day, month,year
alter table indian_dataset
add column day int,
add column month int,
add column year int ;
select * from indian_dataset order by id asc;

-- update the  new column with extracted  day, month,year
set sql_safe_updates=0;
update indian_dataset
set
 day=day(purchase_date),
  month=month(purchase_date),
   year=year(purchase_date);
 select * from indian_dataset order by id asc;  
 
 -- add a new colum fro a day of the week as name there
 alter table indian_dataset
 add column week_name varchar(50);
 
 set sql_safe_updates=0;
update indian_dataset
set week_name=dayname(purchase_date);
 
 select * from indian_dataset;
 
  -- add a new colum for name of a month and save  as name there
   alter table indian_dataset
 add column month_name varchar(50);
 
 set sql_safe_updates=0;
update indian_dataset
set month_name=monthname(purchase_date);
 
 select * from indian_dataset;
