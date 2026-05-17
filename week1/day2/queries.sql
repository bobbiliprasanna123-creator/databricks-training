CREATE TABLE Employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    experience INT
);

INSERT INTO Employees VALUES
(101, 'Rahul', 'IT', 75000, 'Hyderabad', 5),
(102, 'Anjali', 'HR', 45000, 'Chennai', 3),
(103, 'Kiran', 'IT', 82000, 'Bangalore', 6),
(104, 'Sneha', 'Finance', 67000, 'Hyderabad', 4),
(105, 'Aman', 'HR', 39000, 'Pune', 2),
(106, 'Ravi', 'Finance', 91000, 'Mumbai', 8),
(107, 'Divya', 'IT', 55000, 'Chennai', 3),
(108, 'Meena', 'Sales', 48000, 'Bangalore', 2),
(109, 'Arjun', 'Sales', 61000, 'Hyderabad', 5),
(110, 'Pooja', 'IT', 73000, 'Mumbai', 4),
(111, 'Vikas', 'HR', 52000, 'Pune', 3),
(112, 'Nisha', 'Finance', 88000, 'Bangalore', 7),
(113, 'Tarun', 'Sales', 46000, 'Chennai', 2),
(114, 'Kavya', 'IT', 97000, 'Hyderabad', 9),
(115, 'Manoj', 'Finance', 58000, 'Mumbai', 4);


SELECT * FROM employees;

SELECT employee_name, salary
FROM employees;

FROM employees;

SELECT *
FROM employees
WHERE department = 'IT';

-- Display employee names and experience
SELECT employee_name, experience
FROM employees;

SELECT *
FROM employees
WHERE salary > 70000;

SELECT *
FROM employees
WHERE city = 'Hyderabad';

SELECT *
FROM employees
WHERE experience < 4;

SELECT *
FROM employees
WHERE department = 'Finance';

SELECT *
FROM employees
WHERE salary = 52000;

SELECT department,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department;

SELECT department,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

SELECT city,
       COUNT(*) AS employee_count
FROM employees
GROUP BY city;

SELECT department,
       MAX(salary) AS max_salary
FROM employees
GROUP BY department;

SELECT department,
       MIN(experience) AS min_experience
FROM employees
GROUP BY department;

SELECT department,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;

SELECT department,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

SELECT city,
       COUNT(*) AS employee_count
FROM employees
GROUP BY city
HAVING COUNT(*) > 2;

SELECT department,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 200000;

SELECT department,
       MAX(salary) AS max_salary
FROM employees
GROUP BY department
HAVING MAX(salary) > 90000;

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;

SELECT *
FROM employees
ORDER BY experience DESC
LIMIT 3;

SELECT *
FROM employees
WHERE department = 'Finance'
ORDER BY salary DESC
LIMIT 2;

SELECT *
FROM employees
WHERE city = 'Hyderabad'
LIMIT 4;

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1;

SELECT DISTINCT department
FROM employees;

SELECT DISTINCT city
FROM employees;

SELECT DISTINCT salary
FROM employees;

SELECT DISTINCT department, city
FROM employees;

SELECT DISTINCT experience
FROM employees;

SELECT *
FROM employees
WHERE salary >= 80000;

SELECT *
FROM employees
WHERE experience <= 3;

SELECT *
FROM employees
WHERE salary <> 45000;

SELECT *
FROM employees
WHERE salary < 50000;

SELECT *
FROM employees
WHERE experience > 5;

SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 70000;

SELECT *
FROM employees
WHERE city = 'Hyderabad'
OR city = 'Bangalore';

SELECT *
FROM employees
WHERE department = 'HR'
AND experience < 3;

SELECT *
FROM employees
WHERE salary > 60000
OR experience > 6;

SELECT *
FROM employees
WHERE department <> 'Sales';

SELECT *
FROM employees
WHERE city IN ('Hyderabad', 'Mumbai');

SELECT *
FROM employees
WHERE department IN ('IT', 'Finance');

SELECT *
FROM employees
WHERE city NOT IN ('Chennai', 'Pune');

SELECT *
FROM employees
WHERE salary IN (45000, 75000, 91000);

SELECT *
FROM employees
WHERE department NOT IN ('HR', 'Sales');

SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 80000;

SELECT *
FROM employees
WHERE experience BETWEEN 3 AND 6;

SELECT *
FROM employees
WHERE emp_id BETWEEN 105 AND 112;

SELECT *
FROM employees
WHERE salary NOT BETWEEN 40000 AND 60000;

SELECT *
FROM employees
WHERE experience BETWEEN 2 AND 4;

SELECT *
FROM employees
WHERE employee_name LIKE 'R%';


SELECT *
FROM employees
WHERE employee_name LIKE '%a';


SELECT *
FROM employees
WHERE employee_name LIKE '%v%';

SELECT *
FROM employees
WHERE city LIKE 'B%';

SELECT *
FROM employees
WHERE department LIKE '%s';