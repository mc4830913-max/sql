use data1;
select * from indian_dataset order by id asc;

-- update the name
set sql_safe_updates=0;
update indian_dataset
set name=trim(name),
name=lower(name);
select * from indian_dataset order by id asc;

-- update gender
set sql_safe_updates=0;
update indian_dataset
set gender=lower(trim(gender));
select * from indian_dataset order by id asc;

-- update city
set sql_safe_updates=0;
update indian_dataset
set city=lower(trim(city));
select * from indian_dataset order by id asc;

-- update state
set sql_safe_updates=0;
update indian_dataset
set state=lower(trim(state));
select * from indian_dataset order by id asc;

-- update email and clean
set sql_safe_updates=0;
update indian_dataset
set email=lower(trim(regexp_replace(email,'[^a-zA-Z0-9@.]+','' )));
select * from indian_dataset order by id asc;

-- update phone_number
set sql_safe_updates=0;
update indian_dataset
set phone_number=regexp_replace(phone_number,'[^0-9]+','' );
select * from indian_dataset order by id asc;

-- extracting username
alter table indian_dataset add column username varchar(50);

set sql_safe_updates=0;
update indian_dataset
set username=substring_index(email,'@',1);
select * from indian_dataset order by id asc;

-- create location
alter table indian_dataset add column location varchar(50);

set sql_safe_updates=0;
update indian_dataset
set location=concat(city,"_",state);
select * from indian_dataset order by id asc;

-- amount without gst
alter table indian_dataset add column without_gst varchar(50);

set sql_safe_updates=0;
update indian_dataset
set without_gst=purchase_amount*0.88;
select * from indian_dataset order by id asc;

-- adding expiry date
alter table indian_dataset add column expiry_date varchar(50);

set sql_safe_updates=0;
update indian_dataset
set expiry_date=date_add(purchase_date,interval 3 year);
select * from indian_dataset order by id asc;

-- remving row eith ivalid phone number	
delete from indian_dataset
where length(phone_number)!=10 or  phone_number regexp '^0-9';
select * from indian_dataset order by id asc;

-- clean the gender 
set sql_safe_updates=0;
update indian_dataset
set gender = case
	when gender  in ("male","Male","MALE""M","m") then "M"
    when gender in ("FEMALE","Female","female""F","f") then "F"
    else "other"
    end;
 select * from indian_dataset order by id asc;   
 
 -- cleaning and validating age
 delete from indian_dataset 
 where age <=0 or  age>=100;
  select * from indian_dataset order by id asc;  
 
