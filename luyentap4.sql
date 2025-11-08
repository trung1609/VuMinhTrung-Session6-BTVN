create table luyentap4.OrderInfo(
    id serial primary key ,
    customer_id int,
    order_date date,
    total numeric(10,2),
    status varchar(20)
);

insert into luyentap4.OrderInfo(customer_id, order_date, total, status) VALUES
(1, '2024-01-15', 550.00, 'Completed'),
(2, '2024-10-16', 200.50, 'Pending'),
(1, '2024-01-17', 75.25, 'Shipped'),
(3, '2024-10-18', 300.00, 'Completed'),
(2, '2024-01-19', 50.00, 'Cancelled');

select orderinfo.id, sum(total) as total from luyentap4.OrderInfo
group by orderinfo.id
having sum(total) > 500.00;

select orderinfo.id, order_date
from luyentap4.OrderInfo
where order_date between '2024-10-01' and '2024-10-31';

select orderinfo.id, orderinfo.status
from luyentap4.OrderInfo
where status <> 'Completed';





