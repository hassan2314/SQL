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

