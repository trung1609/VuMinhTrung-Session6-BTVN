create table luyentap2.Employee(
    id serial primary key ,
    fullname varchar(100),
    department varchar(50),
    salary numeric(10,2),
    hire_date date
);

insert into luyentap2.Employee(fullname, department, salary, hire_date) values
('Nguyen Van A', 'IT', 1500.00, '2020-01-15'),
('Tran Thi B', 'HR', 1200.00, '2019-03-22'),
('Le Van C', 'Finance', 1800.00, '2018-07-30'),
('Pham Thi D', 'IT', 1600.00, '2021-05-10'),
('Hoang Van E', 'Marketing', 1400.00, '2020-11-25'),
('Vu Van F', 'Marketing', 1255.00, '2023-12-20');

update luyentap2.Employee set salary = Employee.salary * 1.1 where department = 'IT';

delete from luyentap2.Employee where Employee.salary < 1300.00;

select employee.id, employee.fullname
from luyentap2.Employee
where employee.fullname ilike '%An%';

select employee.id, employee.fullname, employee.hire_date
from luyentap2.Employee
where hire_date between '2023-01-01' and '2023-12-31';
