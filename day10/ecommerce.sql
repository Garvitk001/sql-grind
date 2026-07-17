create TABLE customers(customer_id INTEGER PRIMARY KEY,
name text not null, city text);
SELECT * from customers;

CREATE table products( product_id INTEGER PRIMARY KEY,name text not NULL , category text , price real);

create table orders(order_id integer primary key , 
customer_id  integer , product_id integer ,quantity integer  ,
order_date text , FOREIGN KEY(customer_id) REFERENCES customers(customer_id) 
, FOREIGN KEY(product_id) REFERENCES products(product_id 
);

-- Customers data

INSERT INTO customers (customer_id, name, city)
VALUES
(1, 'Garvit', 'Jaipur'),
(2, 'Arav', 'Kota'),
(3, 'Priya', 'Udaipur'),
(4, 'Neha', 'Jaipur'),
(5, 'Rohan', 'Ajmer');

-- Products data

INSERT INTO products (product_id, name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Mouse', 'Electronics', 800),
(103, 'Office Chair', 'Furniture', 6500),
(104, 'Keyboard', 'Electronics', 1500),
(105, 'Notebook', 'Stationery', 120),
(106, 'Headphones', 'Electronics', 2500);

SELECT * from customers;
SELECT * FROM products;

PRAGMA foreign_keys = ON;

INSERT INTO orders (order_id, customer_id, product_id, quantity, order_date)
VALUES
(1001, 1, 101, 1, '2026-07-01'),
(1002, 1, 102, 2, '2026-07-02'),
(1003, 2, 103, 1, '2026-07-03'),
(1004, 3, 104, 1, '2026-07-04'),
(1005, 4, 105, 5, '2026-07-05'),
(1006, 5, 106, 1, '2026-07-06'),
(1007, 2, 102, 1, '2026-07-07'),
(1008, 3, 101, 1, '2026-07-08'),
(1009, 4, 106, 2, '2026-07-09'),
(1010, 5, 105, 3, '2026-07-10');

SELECT * from orders;
SELECT * from customers;
SELECT * FROM products;

SELECT o.order_id ,
c.name , p.name , o.quantity , 
o.quantity * p.price AS total_amount
from orders as o inner join customers as c ON o.customer_id= c.customer_id
inner join  products as p on o.product_id = p.product_id;

SELECT
    c.name AS customer_name,
    SUM(o.quantity * p.price) AS total_spent
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC;



select 
    p.name , o.quantity , sum(o.quantity * p.price) as Total_revenue
from products as p
inner join orders as o 
    on p.product_id= o.product_id
    group by p.name order by total_revenue desc;

SELECT * from orders;
SELECT * from customers;
SELECT * FROM products;

SELECT
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity * p.price) AS total_revenue
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY c.city
ORDER BY total_revenue DESC;