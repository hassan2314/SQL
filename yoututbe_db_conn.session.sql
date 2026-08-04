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

