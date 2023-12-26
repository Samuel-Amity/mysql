-- TYPES OF SQL CMDS

-- DDL COMMANDS

-- 1 crt DB
create database facebook;
use facebook;
show databases;
select database(); -- show selected db
drop database facebook;

-- 2 creating table
create table sales
(
order_id int,
seller_name varchar(255),
product varchar(255),
price int,
quantity int,
address varchar(255),
pan_card char,
order_date date);

show tables; -- show al tab in db
describe sales; -- show tabke details

create table customer
(
cus_id int not null unique primary key,
cus_name varchar(200) default "not available",
cus_address varchar(255),
phone_no int,
purchase_date date,
age int check (age>=18)
);

drop table customer;
describe customer;
create table sales
(
order_id int unique,
seller_name varchar(255) not null,
product varchar(255) default 'NA',
price int default 0,
quantity int check (quantity>2),
address varchar(255) not null,
pan_card char not null,
order_date date not null,
foreign key (order_id) references customer(cus_id)
);

describe sales;

-- 3 ALter cmd ----------------------------

create table student(
id int not null unique primary key,
name varchar(255) not null default "NA",
age int not null,
class int not null
);

describe student;
alter table student add column marks int; -- add a column for marks 
alter table student add grade int; -- works without column also
alter table student modify grade varchar(50); -- modify feild schema
alter table student drop marks;
alter table student drop grade;
alter table student rename column name to full_name; -- rename column 
alter table student rename to teacher; -- rename whole table

describe student;

-- DML COMMANDS

-- insert delete update

describe student;

-- 1 Insert

insert into student(id,name,age,class)
values
(1, 'mohit', 18, 12),
(2, 'rohit', 17, 11);

select * from student;

insert into student(id,name,age,class)
values
(3, 'jatin', 14, 8),
(4, 'shweta', 19,12),
(5, 'prateek', 14, 8),
(6, 'vishnu', 12, 7),
(7, 'mahesh', 17, 10),
(8, 'aparna', 16, 11),
(9, 'jatin', 17, 11),
(10, 'rohit',13,8);

-- DQL COMMAND -- SELECT

select * from student;
select name,age,id ,class from student; -- shows in typed order
-- distinct
select distinct name from student; -- to hide all duplicate
-- limit \, offset, orderby
select * from student limit 5; -- show only first 5
select * from student limit 5 offset 3; -- offset to skip starting entries
select * from student order by class; -- order by asending order 
select * from student order by class asc;
select * from student order by class desc; -- "desc" decending order
select * from student order by class desc,age;
select * from student order by class, age desc;

-- where clause =, !=, <, <=, >, >=

select * from student where class>10;
select * from student where age<=15;
select * from student where name = "sam";
select * from student where id=7;

-- AND OR NOT IN BTW LIKE

select * from student where class>=11 and age <18 and name = "jatin"; -- AND
select * from student where class>=11 or age <18 or name = "rohit" ; -- OR
select * from student where not name = "shweta" ; -- NOT 
select * from student where age between 13 and 17; -- BTW
select * from student where name in ("rohit","jatin", "aparna"); -- IN -- select * from student where name = "rohit" or name = "jatin" or name = "aprna";
-- LIKE -- patern matching
-- % - wild card
-- _ - wildcard [-]
select * from student where name like "a%" ;
select * from student where name like "%a";
select * from student where name like "%t_";
select * from student where name like "__a%";
select * from student where name like "%ti%";

-- Aggregate Functions
-- min()
-- max()
-- count()
-- sum()
-- average()
-- standard()

-- sql alises --> AS {desired_name}

select min(age) as minimum_age from student;
select max(age) as maximum_age from student;
select count(class) as total from student;
select sum(age) from student;
select avg(age) as average_age from student;
select std(age) as standard_age from student;

-- Update -- setsql_safe_updates = 0;

update student set age = 20 where id=2;
update student set age = 25, class = 10 where id=4;
update student set name = "pooja";
-- update employee set esalary=4000,dob='1993-08-30' where eid=1;

-- Delete
delete from student;
delete from student where id=1;

-- TCL -- roll back, savepoint, commit

start transaction;
update student set class = 12 where id =3;
commit;
-- OR
rollback;

begin;

delete from student;
rollback;
select * from student

begin;
select* from student;
savepoint point1;
update student set class = 15 where id=3;
savepoint point2;
delete from student where id=2;
savepoint point3;
update student set age = 45;
rollback to point2;
commit; -- or rollback

-- Group By

select * from student;

select class, count(*) from student group by class;
select class, count(*) as total from student
group by class having total>=2;

-- Joints

create table marks (
id int not null,
subject varchar(255) not null,
marks int not null,

primary key (id,subject)
);
describe marks;
insert into marks 
values (9, 'maths', 89),
(2, 'english', 75),
(1, 'maths', 91),
(4, 'science', 97),
(10, 'computer', 83),
(1, 'english', 55),
(3, 'maths',58);
select * from marks;
select * from student;

-- 1. Inner join
select name,age, subject, class
from student
join marks
on student.id = marks.id;

-- 2. Left join
select name,age, subject, class
from student
left join marks
on student.id = marks.id;

-- 3. Right join
select name,age, subject, class
from student
right join marks
on student.id = marks.id;

-- 4. Full outer join 
-- by using 

-- Union
select name,age, subject, class
from student
left join marks
on student.id = marks.id
union
select name,age, subject, class
from student
right join marks
on student.id = marks.id;

-- Union.all
select name,age, subject, class
from student
left join marks
on student.id = marks.id
union all
select name,age, subject, class
from student
right join marks
on student.id = marks.id;

-- 5. Cross Join

select name,age, subject, class
from student
cross join marks;

-- 6. Self join

select * from student;

-- Inner self join
select t1.name,t2.age
from student t1
join student t2
on t1.id = t2.id;

-- Left self join
select t1.name,t2.age
from student t1
left join student t2
on t1.id = t2.id;

-- Right self join
select t1.name,t2.age
from student t1
right join student t2
on t1.id = t2.id;


-- -----------------------------------


CREATE TABLE Employees(
EmployeesID INT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
 ManagerID int);
 
 -- Insert sample data
INSERT INTO Employees (EmployeesID, FirstName, LastName, ManagerID)
VALUES
  (1, 'John', 'Doe', NULL),   -- John Doe is the top-level manager (ManagerID is NULL)
  (2, 'Alice', 'Smith', 1),   -- Alice Smith reports to John Doe
  (3, 'Bob', 'Johnson', 1),    -- Bob Johnson also reports to John Doe
  (4, 'Charlie', 'Brown', 2),  -- Charlie Brown reports to Alice Smith
  (5, 'David', 'Wilson', 3);   -- David Wilson reports to Bob Johnson
  
  select * from Employees;
  
SELECT 
  e1.FirstName AS e_first_name,
  e1.LastName AS e_last_name,
  e2.FirstName AS M_First_name,
  e2.LastName AS m_last_name
FROM Employees e1
JOIN Employees e2 
ON e1.ManagerID = e2.EmployeesID;

-- types of Fn

-- 1. Aggregate Fn -- done above

-- 2. Math Fn
select pi() as result;
select power(2,3);
select truncate(1.2345678, 2);
select sqrt(25);
select exp(5);
select mod(15,4); -- modulus = reminder

-- 3. Date fn
select now();
select curdate();
select current_time(); -- select curtime();
select sysdate(); -- System date
select year(sysdate()); -- show only year in sysdate
select month(now()); -- show current month
/*select date_format("2017-06-05" , "%y"); -- : %Y - full and %y - 2 digit
select date_format("2017-06-05","%m %d %y"); 
select date_format("2017-06-05","%M %d %Y"); -- M = Full name of month
*/
select datediff('2010-12-30', '2010-11-30')  as differnece; -- diffrence btw two year --
/*select date_add(current_date(), interval 10 year); -- add 10 years
select date_add(current_date(), interval 5 month);
select date_add(current_date(), interval 10 day); 
*/
/*select date_sub(current_date(), interval 10 year); -- subt 10 years
select date_sub(current_date(), interval 5 month); -- sub 5 mo
select date_sub(current_date(), interval 5 day); -- sub 5 day
*/

-- 4. String Fn
select concat("hello" " " "world"); -- Join both
select *, concat(name, " SHarma") as full_name from student; -- adds sharma to name
select name,length(name) from student; -- how many charecter long is name
select *, upper(name) from student; -- UPPer case name
select lower("DATA SCIENCE"); -- put data in lower case
select substring("We are learning My sql", 8, 8); -- show only "learning" which is starting at pos 8 
select left("Fullstack", 4); -- show 4 left char
select right("Fullstack", 4); -- show 4 right char
select trim("      Rohit     ");
select replace("We are learning My Sql" , "My Sql" , "Python"); -- replace Mysql with python;
-- SELECT POSITION('lo' IN 'Hello') AS result; 

-- IF ELSE 
select *,
case
	when class = 8 then "its eight"
	when class = 10 then "its ten"
    when class = 11 then "its ten"
else "you are a kid"
end as Class_name
from student;
select *,
case 
	when age>=18 then "You are eligible for voting"
    when age<18 then "You are kid"
end as voting
from student;
select *,
case 
	when age>=18 then "You are eligible for voting"
else "you are kid"
end as age_criteria
from student;

select *,
case
	when age<=14 then "younger"
    else "older"
    end as New_age
    from student;
    
    select *,
    if(age<=14, "younger" , "older") as age_status
    from student;
    
    select *,
    if(class<=10 , "Primary school" , "high school") as Class_change
    from student;
    
-- DCL
-- GrANT AND REVOKE

create user "ravi@123" identified by "r@123";
show grants for "ravi@123"; -- show no. of grants
grant select, update, delete on facebook.* to "rave@123"; -- Grant
revoke select, update on facebook.* from "rave@123"; -- Revoke
drop user "ravi@123"; -- Delete 

-- Sub Query

/*
Find out all those who are having age greater than average age
 */
 select * from student
where age > (select avg(age) from student); --  can put age > 15 also
select name from student where id in
(select id from student where class>10);

-- Import / Export

create database IRIS23;
show tables;
select * from profit;
create database import;
