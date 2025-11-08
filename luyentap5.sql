create table luyentap5.Course(
    id serial primary key ,
    title varchar(100),
    instructor varchar(50),
    price numeric(10,2),
    duration int
);

insert into luyentap5.Course(title, instructor, price, duration) VALUES
('Database Systems', 'Alice Johnson', 150.00, 40),
('Web Development', 'Bob Smith', 200.00, 60),
('Data Science', 'Charlie Brown', 250.00, 80),
('Machine Learning', 'Diana Prince', 1000.00, 100),
('Cloud Computing', 'Ethan Hunt', 1800.00, 50),
('OOP', 'Martin', 270.00, 50),
('C/C++ Language', 'Alex', 100.00, 120),
('DSA', 'Alexander', 1700.00, 50);


update luyentap5.Course set price = Course.price * 1.15
where Course.duration > 30;

delete from luyentap5.Course where Course.title like '%Demo%';

select id, title
from luyentap5.Course
where title like '%SQL%';

select id, title, price
from luyentap5.Course
where price between 500 and 2000
order by price desc
limit 3;



