use swiggy;

-- syntax error 
selct * from restaurants;
select * from restaurants;

-- logical exception
select * from restaurants  where rating<2.0and rating >4.0;

-- data type exception 
select * from restaurants where city="bengalore";

-- performance function error
select * from restaurants where rating=4.0;

-- aggregrate error 
select city,count(*) from restaurants
group by city;

-- subquery exception
select * from restaurants where id=(select id from restaurants where city="punjab");

-- constraint error
insert into restaurants(id,city,rating)
values(211,"pune",3.0);

-- exception handling if tha table doesnot exist
drop procedure if exists error_handle;
delimiter //
create procedure error_handle ()
begin 
      declare continue handler for sqlexception
          begin 
            select "this table doest not exists" as message;
          end;
          select * from rest_table;
       end// 
delimiter;   

call error_handle();    

-- exception handing while data insertion
drop procedure if exists error_handle_data;
delimiter //
create procedure error_handle_data ()
begin 
      declare continue handler for sqlexception
          begin 
            select " the data is not valid " as message;
          end;
          insert into restaurants(id,rating,city)
            values(211,3.0,"punjab");
       end// 
delimiter;   

call error_handle_data();    



