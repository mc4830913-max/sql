use data1;

select * from indian_dataset;

-- strat transaction 
start transaction;
set sql_safe_updates=0;
update indian_dataset 
set purchase_amount=1600 where id =1;
select * from indian_dataset;

-- rollback transaction 
start transaction;
set sql_safe_updates=0;
update indian_dataset 
set purchase_amount=1300 where id =1;
select * from indian_dataset;
rollback;
select * from indian_dataset;

-- commit transaction
start transaction;
set sql_safe_updates=0;
update indian_dataset 
set purchase_amount=1400 where id =1;
commit;
select * from indian_dataset;

-- commit and rollback
start transaction;
  INSERT INTO indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
  (11, 'monika chauhan', 23, 'Male', 'mona@example.com', '9878943214', 'Lucknow', 'Uttar Pradesh', 990.00, '2023-05-20');
   select * from indian_dataset where id =11;
   select * from indian_dataset;
   commit;
   rollback;
select * from indian_dataset;


-- commit and rollback with multiple commnads
start transaction;
  INSERT INTO indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
  (12, 'monika chauhan', 23, 'female', 'mona@example.com', '9878943214', 'Lucknow', 'Uttar Pradesh', 990.00, '2023-05-20'),
    (13, 'karan chauhan', 23, 'Male', 'mona@example.com', '9878943214', 'Lucknow', 'Uttar Pradesh', 990.00, '2023-05-20');
   select * from indian_dataset;
   commit;
   rollback;
select * from indian_dataset;


-- multiple rollback
start transaction;
  INSERT INTO indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
  (14, 'monika chauhan', 23, 'female', 'mona@example.com', '9878943214', 'Lucknow', 'Uttar Pradesh', 990.00, '2023-05-20'),
    (15, 'karan chauhan', 23, 'Male', 'mona@example.com', '9878943214', 'Lucknow', 'Uttar Pradesh', 990.00, '2023-05-20');
   select * from indian_dataset;
   rollback;
select * from indian_dataset;


