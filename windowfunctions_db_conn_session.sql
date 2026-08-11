-- Level 1
select 
employee_name, salary, 
Round(AVG(salary) OVER()) as avg_Sal
 from employees;

select 
employee_name, salary, 
ROUND(MAX(salary) OVER()) as avg_Sal
 from employees;

select 
employee_name, salary, 
Round(salary - AVG(salary) OVER(),0) as avg_Sal
 from employees;

select 
e.employee_name, e.salary,
d.department_name,
Round(salary-AVG(salary) OVER()) as diff_sal
from employees e
inner join departments d
on e.department_id=d.department_id;

select 
    e.employee_name, 
    e.salary,
    Round(salary - AVG(salary) OVER(),2) as diff_sal,
    CASE
        WHEN salary - AVG(salary) OVER() > 0 Then 'Ameer'
        WHEN salary - AVG(salary) OVER() < 0 Then 'Ghareeb'
        ELSE 'Normal'
    End AS status
From employees e;


-- Level 2

select 
    e.employee_name, 
    e.salary,
    d.department_name,
    Round(AVG(salary) OVER( PARTITION BY e.department_id)) ,
     CASE
        WHEN salary - AVG(salary) OVER(PARTITION BY e.department_id) > 0 Then 'Above'
        WHEN salary - AVG(salary) OVER(PARTITION BY e.department_id) < 0 Then 'Bellow'
        ELSE 'Normal'
    End AS status
from employees e
    INNER JOIN departments d
    on e.department_id=d.department_id;


select 
     e.employee_name,
     e.salary,
     Round(Max(Salary) OVER (PARTITION by e.department_id)) as max_dept
from employees e;


--Level 3
select
    e.employee_name,
    e.salary,
    ROW_NUMBER() OVER (
    ORDER BY salary DESC
)
FROM employees e;

select
    e.employee_name,
    e.salary,
    RANK() OVER (
    ORDER BY salary DESC
)
FROM employees e;

select
    e.employee_name,
    e.salary,
    DENSE_RANK() OVER (
    ORDER BY salary DESC
)
FROM employees e;

-- Level 4

select 
    e.employee_name,
    e.salary,
    d.department_name,
     DENSE_RANK() OVER (
    PARTITION BY e.department_id
    ORDER BY salary DESC
)
FROM employees e
    JOIN departments d
    ON d.department_id=e.department_id;



