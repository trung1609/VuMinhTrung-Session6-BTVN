create table luyentap8.Customer
(
    id   serial primary key,
    name varchar(100)
);
create table luyentap8.Orders
(
    id           serial primary key,
    customer_id  int references luyentap8.Customer (id),
    order_date   date,
    total_amount numeric(10, 2)
);

insert into luyentap8.Customer(name)
values ('John Doe'),
       ('Jane Smith'),
       ('Alice Johnson'),
       ('Bob Brown'),
       ('Charlie Davis');

insert into luyentap8.Orders(customer_id, order_date, total_amount)
values (1, '2023-01-15', 150.75),
       (2, '2023-02-20', 200.00),
       (1, '2023-03-05', 50.25),
       (3, '2023-04-10', 300.50),
       (4, '2023-05-12', 120.00),
       (2, '2023-06-18', 80.00);

--Cau 1
select c.id, c.name, sum(o.total_amount) as total_amount
from luyentap8.Customer c
         join luyentap8.orders o on c.id = customer_id
group by c.id;


--Cau 2
select c.id, c.name, sum(o.total_amount) as total_revenue
from luyentap8.Customer c
         join luyentap8.orders o on c.id = customer_id
group by c.id
having sum(o.total_amount) >= ALL (select max(total_revenue)
                                   from (select sum(o.total_amount) as total_revenue
                                         from luyentap8.Customer c
                                                  join luyentap8.orders o on c.id = customer_id
                                         group by c.id));

--Cau 3
select c.id, c.name
from luyentap8.Customer c
         left join luyentap8.orders o on c.id = customer_id
where o.id is null;

--Cau 4
select c.id, c.name, avg(o.total_amount) as average_order_value
from luyentap8.Customer c
         join luyentap8.orders o on c.id = customer_id
group by c.id
having avg(o.total_amount) >= ALL (select avg(total_revenue)
                                   from (select sum(o.total_amount) as total_revenue
                                         from luyentap8.Customer c
                                                  join luyentap8.orders o on c.id = customer_id
                                         group by c.id));


