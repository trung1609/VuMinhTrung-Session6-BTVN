create table luyentap3.Customer(
    id serial primary key ,
    name varchar(100),
    email varchar(100),
    phone varchar(20),
    points int
);

insert into luyentap3.Customer (name, email, phone, points) VALUES
                                                                ('Nguyen Van A', 'nguyenvana@gmail.com', 0123456789,56),
                                                                ('Tran Thi B', null, 0987654321,34),
                                                                ('Le Van C', 'levanc@gmail.com', 0834873853,78),
                                                                ('Nguyen Van Huy', 'nguyenvanhuy@gmail.com', 0123456854,98),
                                                                ('Tran Thi Binh', 'tranthibinh@gmail.com', 0987521321,86),
                                                                ('Le Van Cuong', 'levancuong@gmail.com', 0838372853,71);

select distinct customer.name
from luyentap3.Customer;

select customer.id, customer.name
from luyentap3.Customer
where email is null;

select customer.name, customer.points
from luyentap3.Customer
order by points desc limit 3 offset 1;

select customer.name
from luyentap3.Customer
order by customer.name desc ;