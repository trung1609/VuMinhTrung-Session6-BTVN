create table luyentap10.OldCustomers
(
    id   serial primary key,
    name varchar(100),
    city varchar(50)
);

create table luyentap10.NewCustomers
(
    id   serial primary key,
    name varchar(100),
    city varchar(50)
);

insert into luyentap10.OldCustomers (name, city)
values ('Alice', 'New York'),
       ('Bob', 'Los Angeles'),
       ('Charlie', 'Chicago'),
       ('David', 'Houston'),
       ('Eve', 'Phoenix');

insert into luyentap10.NewCustomers (name, city)
values ('Frank', 'Philadelphia'),
       ('Grace', 'San Antonio'),
       ('Heidi', 'San Diego'),
       ('Ivan', 'Dallas'),
       ('Judy', 'San Jose');

-- Cau 1
select o.id, o.name, o.city
from luyentap10.OldCustomers o
union
select n.id, n.name, n.city
from luyentap10.NewCustomers n;

-- Cau 2
select o.id, o.name, o.city
from luyentap10.OldCustomers o
intersect
select n.id, n.name, n.city
from luyentap10.NewCustomers n;

-- Cau 3
select a.city, count(*) as total_customers
from (select n.city
      from luyentap10.NewCustomers n
      union all
      select o.city
      from luyentap10.OldCustomers o) as a
group by a.city;

-- Cau 4
select a.city, count(*) as total_customers
from (select n.city
      from luyentap10.NewCustomers n
      union all
      select o.city
      from luyentap10.OldCustomers o) as a
group by a.city
having count(*) >= (select max(total_customers) as max_customers
                    from (select a.city, count(*) as total_customers
                          from (select n.city
                                from luyentap10.NewCustomers n
                                union all
                                select o.city
                                from luyentap10.OldCustomers o) as a
                          group by a.city) as b);




