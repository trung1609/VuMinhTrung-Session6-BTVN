create table luyentap1.Product
(
    id serial primary key,
    name varchar(100),
    category varchar(50),
    price numeric(10,2),
    stock int
);

insert into luyentap1.Product(name, category, price, stock) VALUES
                                                                ('Apple iPhone 13', 'Electronics', 799.00, 50),
                                                                ('Samsung Galaxy S21', 'Electronics', 699.00, 30),
                                                                ('Sony WH-1000XM4', 'Electronics', 349.99, 20),
                                                                ('Dell XPS 13', 'Computers', 999.99, 15),
                                                                ('MacBook Pro', 'Computers', 1299.00, 10);

-- Cau 1
select p.id, p.name, p.category, p.price, p.stock
from luyentap1.Product p;

-- Cau 2
select p.id, p.name, p.price
from luyentap1.Product p
order by p.price desc
limit 3;

-- Cau 3
select p.id, p.name, p.category, p.price
from luyentap1.Product p
where p.category = 'Electronics' and p.price < 10000000;

-- Cau 4
select p.id, p.name, p.stock
from luyentap1.Product p
order by p.stock asc ;

