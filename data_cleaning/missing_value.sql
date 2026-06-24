select * from indian_dataset;

--  Missing Values
select * from indian_dataset where age is null or name is null or gender is null
or email is null or phone_number is null or city is null or state is null or purchase_amount is null
or purchase_date is null ;

-- find row without missing values
select * from indian_dataset where age is not  null and name is not null and gender is not null
and email is not null and phone_number is not null and city is not  null and state is not null and purchase_amount is not null
and purchase_date is not null ;

-- saving table without null values 
create table if not exists not_null_table
	select * from indian_dataset where age is not  null and name is not null and gender is not null
	and email is not null and phone_number is not null and city is not  null and state is not null and purchase_amount is not null
	and purchase_date is not null ;
select * from not_null_table;

-- fill missing value age with specific value 
set sql_safe_updates=0;
update indian_dataset set age = coalesce(age,0);
select * from indian_dataset;

-- filling null with specific value
set sql_safe_updates=0;
update indian_dataset  
set 
    name =coalesce(name,"unkown"),
    gender=coalesce(gender,"unkown") ,
    email =coalesce(email,"unkown"),
    phone_number=coalesce(phone_number,"unkown"),
    city =coalesce(city,"unkown"),
    state =coalesce(state,"unkown"),
    purchase_amount= coalesce(purchase_amount,"1200.00"),
    purchase_date= coalesce(purchase_date,"2024-03-20");
 select * from indian_dataset;   

-- filling null amount with average amount
set sql_safe_updates=0;
update indian_dataset
set purchase_amount=(
						select avg_amount from (
						select avg(purchase_amount) as avg_amount from indian_dataset
                        ) as subquery
				)
			where purchase_amount is null;
select * from indian_dataset;            

-- filling  null city with most frequent city 
set sql_safe_updates=0;
update indian_dataset
set city= ( select most_freq_city from
				(
				select city as most_freq_city ,count(*) as "freq" from indian_dataset
				where city is not null
				group by city
				order by count(*) desc
				limit 1)
                as subquery 
           ) where city is null;
select * from indian_dataset;             
           
