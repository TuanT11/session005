create database productDB;
create schema productsc;
drop database productDB;

create table productsc.products(
    product_id serial primary key,
    product_name varchar(100),
    category varchar(100)
);

create table productsc.orders(
    order_id int primary key,
    product_id int references productsc.products(product_id),
    quantity int,
    total_price int
);

select * from productsc.products;
select * from productsc.orders;

INSERT INTO productsc.products (product_id, product_name, category)
VALUES
    (1, 'Laptop Dell', 'Electronics'),
    (2, 'IPhone 15', 'Electronics'),
    (3, 'Bàn học gỗ', 'Furniture'),
    (4, 'Ghế xoay', 'Furniture');

INSERT INTO productsc.orders (order_id, product_id, quantity, total_price)
VALUES
    (101, 1, 2, 2200),
    (102, 2, 3, 3300),
    (103, 3, 5, 2500),
    (104, 4, 4, 1600),
    (105, 1, 1, 1100);

select sum(o.total_price) as total_sale, sum(o.quantity) as total_quantity
from productsc.products p
join productsc.orders o
on p.product_id = o.product_id
group by p.category;

select p.category as category
from productsc.products p
join productsc.orders o
on p.product_id = o.product_id
group by p.category
having sum(o.total_price) > 2000;

select sum(o.total_price) as total_price
from productsc.products p
join productsc.orders o
on p.product_id = o.product_id
group by p.category
order by sum(o.total_price) desc;