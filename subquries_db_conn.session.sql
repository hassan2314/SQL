CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary INT,
    department_id INT,
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

INSERT INTO employees VALUES
(101, 'Ali', 50000, 1, NULL),
(102, 'Ahmed', 65000, 2, 101),
(103, 'Sara', 80000, 2, 101),
(104, 'Fatima', 45000, 1, 101),
(105, 'Usman', 70000, 3, 103),
(106, 'Ayesha', 90000, 3, 103),
(107, 'Bilal', 40000, 4, 102),
(108, 'Hina', 75000, 4, 102),
(109, 'Zain', 55000, 2, 103),
(110, 'Noor', 60000, 1, 101);

-- Level 1

SELECT employees.employee_name
 FROM employees
 WHERE employees.salary > 
 (SELECT AVG(salary) from employees);

 SELECT employees.employee_name
 FROM employees
 WHERE salary = (SELECT max(salary) from employees);

Select employee_name, salary
from employees
where salary < (Select min(salary) from employees where department_id = (select department_id from departments where department_name='IT'));
 
Select employee_name
From employees
where department_id = (Select department_id from employees where employee_name='Sara' );

select employee_name
From employees
where manager_id = (select manager_id from employees where employee_name='Usman' );

-- Level 2

Select employee_name
From employees
where department_id=
In
(select department_id 
from departments 
where department_name 
like('M%'));

Select employee_name
From employeides
where department_id in
(
    select department_id 
    From employees
    group by department_id
    having count(*)>1
);

Select employee_name
From employees
where employee_id
In (
    select manager_id
    from employees 
    Where manager_id is not null
);

-- Level 3

SELECT employee_name, salary
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE department_id = 1
);

SELECT employee_name 
FROM employees
where salary > ANY (
    select salary
    FROM employees
    WHERE department_id=3
);

--Level 4

SELECT department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);

SELECT employee_name
FROM employees e1
WHERE EXISTS (
    SELECT 1
    FROM employees e2
    WHERE e2.manager_id = e1.employee_id
);

--Level 5

select e.employee_name, d.department_name
from employees e
join departments d
on d.department_id =e.department_id
where salary >
(
    select AVG(salary)
     as avg_sal
    from employees e2
    where e2.department_id =e.department_id
);


select e.employee_name, d.department_name
from employees e
join departments d 
on e.department_id=d.department_id
where salary = (
select max(salary)
from employees e2
where e2.department_id=e.department_id
);

select e.employee_name, d.department_name
from employees e
join departments d 
on e.department_id=d.department_id
where salary = (
select min(salary)
from employees e2
where e2.department_id=e.department_id
);

--Level 6

select e.employee_name, 
m.employee_name as Manager
from employees e
INNER JOIN employees m ON e.manager_id = m.employee_id
where e.manager_id is not null and e.salary >(
    select salary
    from employees e2
where e2.employee_id=e.manager_id
);

SELECT MAX(salary)
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);







