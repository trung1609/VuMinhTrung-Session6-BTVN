create table luyentap7.Department
(
    id   serial primary key,
    name varchar(50)
);

create table luyentap7.Employee
(
    id            serial primary key,
    full_name     varchar(100),
    department_id int references luyentap7.Department (id),
    salary        numeric(10, 2)
);

insert into luyentap7.Department(name)
values ('HR'),
       ('IT'),
       ('Finance'),
       ('Marketing'),
       ('Sales');

insert into luyentap7.Employee(full_name, department_id, salary)
values ('Alice Johnson', 1, 60000.00),
       ('Bob Smith', 2, 75000.00),
       ('Charlie Brown', 3, 80000.00),
       ('Diana Prince', 4, 72000.00),
       ('Ethan Hunt', 3, 68000.00),
       ('Fiona Gallagher', 2, 77000.00),
       ('George Martin', 3, 82000.00),
       ('Hannah Baker', 1, 61000.00);

-- Cau 1
select e.id,e.full_name, d.name
from luyentap7.Department d
         join luyentap7.employee e on d.id = department_id;

-- Cau 2
select d.id, d.name, avg(e.salary) as average_salary
from luyentap7.Department d
         join luyentap7.Employee e on d.id = e.department_id
group by d.id;

-- Cau 3
select d.id, avg(e.salary)
from luyentap7.Department d
         join luyentap7.employee e on d.id = department_id
group by d.id
having avg(e.salary) > 10000;

select d.id, d.name as department_name, e.full_name as name
from luyentap7.Department d
         left join luyentap7.employee e on d.id = department_id
where e.id is null;