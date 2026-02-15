create database hp;
use hp;
drop table if exists AASMA;
create table if not exists AASMA(
USER_ID INT PRIMARY KEY auto_increment,  -- WHOLE NUMBER
NAME VARCHAR(327) NOT NULL,             --  FOR character
BRANCH ENUM('CSE','ECE','CIVIL'),         --  FOR MULTIPLE STRING INTO SINGLE DATA TYPE
SALARY decimal(10,2) NOT NULL,          --  DEFINE decimal PLACE AFTER AND BEFORE
WEIGHT FLOAT,                           --   DECIMAL VALUES
AGE BIT(5),                              
image BLOB                             -- TO INSERT IMAGE
);
INSERT INTO AASMA (NAME, BRANCH,SALARY,WEIGHT,AGE,image) VALUES
('Anirudh', 'CSE', 500000.4,80.5,5,load_file("C:\Users\Monika\OneDrive\Pictures\1.jpg"));
-- ('Yuvan', 'ECE', 350000.4,45.56,3),
-- ('Harris', 'CIVIL', 400000.8,35.6785,6);
select *from AASMA;
DESC AASMA;
