create database ecommerce;
use ecommerce;
create table grocery(productid INT PRIMARY KEY,product_name VARCHAR(255),quantity INT,price INT);
insert into grocery(productid,product_name,quantity,price) 
  values (1,"toothpaste",2,23),
         (2,"refined oil",2,200),
         (3,"vessel soap",4,250),
         (4,"coconut oil",2,100),
         (5,"bath soap",4,250),
         (6,"harpic",1,150);
select * from grocery;

create table customer(customerid INT PRIMARY KEY,customer_name VARCHAR(255),mode VARCHAR(255));
insert into customer(customerid,customer_name,mode) 
 values (1,"surendra","online"),
        (2,"paresh","offline"),
        (3,"mahesh","online"),
        (4,"jayesh","offline"),
        (5,"archana","online"),
        (6,"sandip","offline");
select * from customer;

alter table grocery add customerid int(5);
update grocery set customerid =2 where productid=1;
update grocery set customerid =3 where productid=2;
update grocery set customerid =5 where productid=3;
update grocery set customerid =6 where productid=4;
update grocery set customerid =5 where productid=5;
update grocery set customerid =2 where productid=6;

select c.customer_name, c.mode, g.product_name, g.price 
from customer c 
left join grocery g 
on c.customerid = g.customerid; 

select g.product_name, g.price, g.quantity, c.customer_name, c.mode
from grocery g 
right join customer c 
on g.customerid = c.customerid; 

select c.customer_name, c.mode, g.product_name, g.price, g.quantity
from customer c
inner join grocery g
on  c.customerid = g.customerid;

select sum(price*quantity) AS total_spend
from grocery;

select avg(price) AS avg_price
from grocery;

select mode, count(*) AS total_customers
from customer
group by mode;