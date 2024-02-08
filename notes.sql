show databases;
create database [db_name];
drop database [db_name];

use [db_name];


-- create table;
create table [table_name](col1 COLTYPE(size) extra, ....);
show tables;

-- describe table
desc [table_name];


-- alter table
-- add column
alter table [table_name] ADD [column_name datatype(size),....];

-- modify column
alter table [table_name] MODIFY [column_name] [new datatype] [extra];

-- rename column
alter table [table_name] RENAME COLUMN [old_column_name] TO [new_column_name];

--drop colrumn
alter table [table_name] DROP COLUMN [column_name];

-- insert Command
insert into [table_name] (col1,... ) values (value1, ....), (value12,....) ...;
-- select command
select * from students;


-- update Coloumn
update table_name set col1= value, col2 = value2,... where id = 5;

-- delete command;
delete from [table_name] where [column_name] = ?;

-- select command;
select [col1], [col2].. from students;

-- use of as command;
select name AS Sudent_name, city as Studnet_City from students;
-- 
select * from students where NOT city = "Ballia";
-- order by

select * from students ORDER BY [column_name];

mysql> select * from students ORDER BY name;
+----+--------------+--------+
| id | name         | city   |
+----+--------------+--------+
|  3 | Amit Nand    | Ballia |
|  4 | Ayush Nand   | Ballia |
|  1 | Krishna Nand | Ballia |
|  5 | Manish Nand  | Ballia |
+----+--------------+--------+


-- LIKE %,_
-- name statrting with a
select * from students where name LIKE "A%";
-- ends with i
Select * from Students where name like "%i";
-- second character a
Select * from students where name LIKE '_a%';


-- creating foreign key

mysql> create table laptops(lid int Primary Key, laptop_name varchar(30) not null, price int,
    sid int, foreign key(sid) REFERENCES students(id)
 );

-- add foreign key constraints

ALTER table laptops add FOREIGN KEY (sid) REFERENCES students(id);

mysql> insert into laptops values(1232, "DELL 12322", 34555, 1),(1233, "HP 22", 34505, 1);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from laptops;
+------+-------------+-------+------+
| lid  | laptop_name | price | sid  |
+------+-------------+-------+------+
| 1232 | DELL 12322  | 34555 |    1 |
| 1233 | HP 22       | 34505 |    1 |
+------+-------------+-------+------+


CREATE TABLE qualification(
    q_id int Primary Key auto_increment,
    passes_year varchar(4) not null,
    name varchar(50) not null,
    grade varchar(10) not null,
    sid int,
    FOREIGN KEY(sid) REFERENCES students(id)
);


-- drop foreign key

ALTER TABLE [table_name] DROP FOREIGN KEY [constraints_name];



-- JOINS students, laptops:- To Fetch Data from different tables
    
-- NORMAL JOIN

    mysql> SELECT students.name, students.city, laptops.laptop_name, laptops.price
    ->         FROM students, laptops
    ->         WHERE students.id = laptops.sid;
+--------------+--------+-------------+-------+
| name         | city   | laptop_name | price |
+--------------+--------+-------------+-------+
| Krishna Nand | Ballia | DELL 12322  | 34555 |
| Krishna Nand | Ballia | HP 22       | 34505 |
+--------------+--------+-------------+-------+
2 rows in set (0.00 sec)

mysql> SELECT students.name, students.city, laptops.laptop_name, laptops.price
    ->         FROM students, laptops
    ->         WHERE students.id = laptops.sid
    ->         ORDER BY laptops.price
    ->         ;
+--------------+--------+-------------+-------+
| name         | city   | laptop_name | price |
+--------------+--------+-------------+-------+
| Krishna Nand | Ballia | HP 22       | 34505 |
| Krishna Nand | Ballia | DELL 12322  | 34555 |
+--------------+--------+-------------+-------+
2 rows in set (0.00 sec)

mysql> SELECT students.name, students.city, laptops.laptop_name, laptops.price
    ->         FROM students, laptops
    ->         WHERE students.id = laptops.sid
    ->         ORDER BY laptops.price
    ->         LIMIT 1 OFFSET 1;
+--------------+--------+-------------+-------+
| name         | city   | laptop_name | price |
+--------------+--------+-------------+-------+
| Krishna Nand | Ballia | DELL 12322  | 34555 |
+--------------+--------+-------------+-------+
1 row in set (0.00 sec)



-- Creating stored procedure!!!!

1. Change delimiter
ex: delimiter //
-- creating stored procedure
2. create procedure createUserTable()
     begin
     create table if not exists users(
     user_id int auto_increment primary key,
     first_name varchar(40),
     last_name varchar(40),
     city varchar(40)
     );
     insert into users (first_name, last_name, city) values ("Krishna", "Nand", "Ballia");
     insert into users (first_name, last_name, city) values ("Ankit", "Singh", "Delhi");
     select * from users;
     end //

-- call procedure
3. call createUserTable() //
