use data1;
select * from indian_dataset order by id asc;

-- finding the outliers based on z-score 
select *,
abs(purchase_amount-avg(purchase_amount) over())/stddev(purchase_amount) over() 
from indian_dataset;

-- remove  the outliers based onspecific  z-score 
select * from(
select *,
abs(purchase_amount-avg(purchase_amount) over())/stddev(purchase_amount) over() as "std"
from indian_dataset) as sub_table
where sub_table.`std`<1;
