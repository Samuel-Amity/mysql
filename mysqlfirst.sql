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
