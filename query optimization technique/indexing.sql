
-- indexing the table
use data1;
select * from indian_dataset;

-- simple ndexing 
drop index idx_table on indian_dataset;
create index idx_table on indian_dataset(city);

select id,name,city,purchase_amount,gender from indian_dataset where city="mumbai";

-- composite index
drop index idx_table on indian_dataset;
create index idx_table on indian_dataset(city,gender);

select id,name,city,purchase_amount,gender from indian_dataset where city="mumbai";

-- unique indexing 
drop index idx_table on indian_dataset;
create unique index idx_table on indian_dataset(email);

select id,name,city,purchase_amount,gender from indian_dataset where city="delhi";

-- full text indexing 
drop index idx_table on indian_dataset;
create fulltext index idx_table on indian_dataset(email,name);

select id,name,city,purchase_amount,gender from indian_dataset where match(name,email) against("rajesh");
select id,name,city,purchase_amount,gender from indian_dataset where match(name,email) against("patel");

-- boolean indexing + means present and - means not present 
select id,name,city,purchase_amount,gender from indian_dataset where match(name,email) against("-rajesh +patel"  in boolean mode);
select id,name,city,purchase_amount,gender from indian_dataset where match(name,email) against("+rajesh +patel"  in boolean mode);
select id,name,city,purchase_amount,gender from indian_dataset where match(name,email) against("+rajesh -patel"  in boolean mode);
select id,name,city,purchase_amount,gender from indian_dataset where match(name,email) against("-rajesh -patel"  in boolean mode);





