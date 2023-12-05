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