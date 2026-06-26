
-- analysing the order of excecution 
use data1;
select * from indian_dataset;

-- exceution order of from 
select * from indian_dataset;
-- 1.from
-- 2. select

-- exceution order of where clause
select * from indian_dataset 
where purchase_amount>900;
-- 1.from
-- 2. where
-- 3. select

-- exceution order of order by  and limit 
select * from indian_dataset 
where purchase_amount>900
order by name desc limit 5 ;
-- 1.from
-- 2. where
-- 3. select
-- 4. order by 
-- 5. limit 

-- exceution order of group by
select city,avg(purchase_amount) from indian_dataset 
where city="pune"
group by city
order by city desc ;

-- 1.from
-- 2. where
-- 3. group by
-- 4. select
-- 5. order by 

-- exceution order of having clause
select city,avg(purchase_amount) from indian_dataset 
group by city
having avg(purchase_amount)>500
order by city desc ;
-- 1.from
-- 2. group by
-- 3. having 
-- 4. select
-- 5. order by 

-- join exceution order
select * from users_2021 as u1
left join users_2022 as u2
on u1.UserID=u1.UserID;
-- 1. from
-- 2. join
-- 3. select

-- execution order of subquery
select * from indian_dataset
where purchase_amount>( select avg(purchase_amount) from indian_dataset);
-- 1.subquery (from)
-- 2. subquery (select)
-- 3. from
-- 4. where
-- 5 select


-- Order of Execution
-- 1. FROM: Determines the source tables and joins if any.
-- 2. WHERE: Applies row filtering.
-- 3. GROUP BY: Groups rows by specified columns.
-- 4. HAVING: Applies group filtering.
-- 5. SELECT: Determines which columns to include in the final result set.
-- 6. ORDER BY: Sorts the result set.
-- 7. LIMIT: Restricts the number of rows in the result set.
