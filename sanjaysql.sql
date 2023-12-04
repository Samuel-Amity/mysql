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

-- where clause

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

-- Update -- setsql_safe_updates = 0;

update student set age = 20 where id=2;
update student set age = 25, class = 10 where id=4;
update student set name = "pooja";

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