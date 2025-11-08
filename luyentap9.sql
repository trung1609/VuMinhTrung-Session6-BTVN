create table luyentap9.product
(
    id       serial primary key,
    name     varchar(100),
    category varchar(50),
    price    numeric(10, 2)
);

create table luyentap9.orderdetail
(
    id         serial primary key,
    order_id   int,
    product_id int,
    quantity   int
);

insert into luyentap9.product(name, category, price)
values ('Laptop A', 'Electronics', 12000.00),
       ('Smartphone B', 'Electronics', 80000.00),
       ('Tablet C', 'Electronics', 5000.00),
       ('Headphones D', 'Accessories', 1500.00),
       ('Charger E', 'Accessories', 300.00);
insert into luyentap9.orderdetail(order_id, product_id, quantity)
values (1, 1, 2),
       (1, 4, 1),
       (2, 2, 1),
       (2, 5, 3),
       (3, 3, 2),
       (3, 4, 2);

--Cau 1
select p.name, sum(p.price * o.quantity) as total_sales
from luyentap9.product p
         join luyentap9.orderdetail o on p.id = product_id
group by p.id;

--Cau 2
select p.category, avg(p.price * o.quantity) as average_sales
from luyentap9.product p
         join luyentap9.orderdetail o on p.id = product_id
group by p.category;

--Cau 3
select p.category, avg(p.price * o.quantity) as average_sales
from luyentap9.product p
         join luyentap9.orderdetail o on p.id = o.product_id
group by p.category
having avg(o.quantity * p.price) > 20000;

--Cau 4
select p1.id, p1.name, sum(o1.quantity * p1.price) as total_sales
from luyentap9.product p1
         join luyentap9.orderdetail o1 on p1.id = o1.product_id
group by p1.id
having sum(o1.quantity * p1.price) >= ALL (select avg(total_sales)
                                           from (select sum(o.quantity * p.price) as total_sales
                                                 from luyentap9.product p
                                                          join luyentap9.orderdetail o on p.id = product_id
                                                 group by p.id));

-- Cau 5
select p.id, p.name, o.quantity
from luyentap9.product p
        left join luyentap9.orderdetail o on p.id = o.product_id;





