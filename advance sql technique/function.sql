
-- Function to Calculate Age
drop function if exists CalculateAge;
delimiter //
create function CalculateAge(birthdate date) returns int
deterministic
begin
     declare age int;
     set age=year(curdate())-year(birthdate);
     return age;
end //
delimiter ;     

select CalculateAge('2003-08-29') as age;


-- Function to Calculate Tax
drop function if exists CalculateTax;
delimiter //
create function CalculateTax(amount decimal(10,2) ,tax_rate decimal(5,2)) returns decimal(10,2)
deterministic
begin 
       	declare tax decimal(10,2);
		set tax = amount * (tax_rate / 100);
        return tax;
end //
delimiter ;

select CalculateTax(145.6,18) as tax;

      

-- Function to Categorize Age
drop function if exists AgeCategory;
delimiter //
create function AgeCategory(age int) returns varchar(50)
deterministic
begin
     declare agecategory varchar(50);
     if age<18 then
     set agecategory="child";
     elseif age between 18 and 45 then
     set  agecategory="adult";
     else
     set agecategory ="senior citizen";
     end if;
     return agecategory;
end //
delimiter ;     

select AgeCategory(10) as age;
