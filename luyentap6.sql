create table luyentap6.Orders
(
    id           serial primary key,
    customer_id  int,
    order_date   date,
    total_amount numeric(10, 2)
);

insert into luyentap6.Orders(customer_id, order_date, total_amount)
VALUES (1, '2023-01-15', 150.00),
       (2, '2023-01-16', 200.50),
       (1, '2024-01-17', 75.25),
       (3, '2025-01-18', 300.00),
       (2, '2023-01-19', 50.75),
       (1, '2022-01-20', 120.00),
       (3, '2021-01-21', 220.40),
       (2, '2023-01-22', 80.00),
       (1, '2022-01-23', 90.10),
       (3, '2023-01-24', 400.00);

--Cau 1
select sum(total_amount) as total_revenue,
       count(orders.id)  as total_orders,
       avg(total_amount) as average_order_value
from luyentap6.Orders;

--Cau 2
select extract(year from order_date) as order_year,
       sum(total_amount) as total_revenue
from luyentap6.Orders o
group by extract(year from order_date);

--Cau 3
select extract(year from order_date) as order_year,
       sum(total_amount) as total_revenue
from luyentap6.Orders
group by extract(year from order_date)
having sum(total_amount) > 500;

--Cau 4
select o.id, o.total_amount
from luyentap6.Orders o
order by total_amount desc
limit 5;



