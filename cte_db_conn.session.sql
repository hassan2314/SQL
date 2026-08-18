WITH sal_avg AS(
    SELECT AVG(salary) as salary_average
    FROM employees
)
SELECT 
    e.employee_name,
    e.salary,
    d.department_name,
    sa.salary_average
FROM employees e
JOIN departments d 
    ON d.department_id = e.department_id
CROSS JOIN sal_avg sa
WHERE sa.salary_average <  e.salary;

