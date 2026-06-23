use data1;
select * from indian_dataset;

-- create a procedue 
drop procedure if exists GetUserId;
delimiter //
create procedure GetUserId(in userid int) 
begin 
     select * from indian_dataset where id=userid;
end //
delimiter;     
call GetUserId(10);

-- update purchas amount by percentage
drop procedure if exists PurPer;
delimiter //
   create procedure PurPer(in percentage decimal(10,2))
     begin 
		  update indian_dataset
		  set purchase_amount= purchase_amount*(1+percentage/100);
		  select * from indian_dataset;
     end //
delimiter;
SET SQL_SAFE_UPDATES = 0;
call PurPer(10);

-- delete the law rated  restaurants and logging
drop table if exists low_rated;
create table if not exists low_rated(
          id int,
          name varchar(50),
          rating decimal(3,2),
	      deletion_time timestamp);
select * from low_rated;  

drop procedure if exists delete_low_rated;
delimiter //

     create procedure delete_low_rated(min_rating decimal(3,2))
		begin 
			  insert into low_rated(id,name,rating,deletion_time)
			  select id,restaurant,rating,now() from swiggy.restaurants
			  where rating<min_rating;
			  
			  delete from swiggy.restaurants
			  where rating<min_rating;
		end //
delimiter;

set sql_safe_updates =0
call delete_low_rated(4.0)

select * from swiggy.restaurants;



      
       
          




      
 
