CREATE TABLE Employee(
  emp_id INTEGER PRIMARY KEY,
  name VARCHAR(20),
  age INTEGER,
  salary INTEGER,
  department_id INTEGER,
  hire_date DATE,

  FOREIGN KEY( department_id)
  REFERENCES Department(department_id)
);

INSERT INTO Employee VALUES (1, 'John Doe', 28, 50000, 1, '2020-01-15');
INSERT INTO Employee VALUES (2, 'Jane Smith', 32, 60000, 2, '2019-07-10');  
INSERT INTO Employee VALUES (3, 'Bob Brown', 45, 80000, 1, '2018-02-12');
INSERT INTO Employee VALUES (4, 'Alice Blue', 25, 45000, 3, '2021-03-22');
INSERT INTO Employee VALUES (5, 'Charlie .P', 29, 50000, 2, '2019-12-01');

CREATE TABLE Department(
    department_id INTEGER PRIMARY KEY,
    name VARCHAR(20)
);

INSERT INTO Department VALUES (1, 'IT');
INSERT INTO Department VALUES (2, 'HR');
INSERT INTO Department VALUES (3, 'Finance');
INSERT INTO Department VALUES (4, 'Marketing');


CREATE TABLE Project(
    project_id INTEGER,
    name VARCHAR(20),
    department_id INTEGER,
    FOREIGN KEY(department_id)
    REFERENCES Department(department_id)
);

INSERT INTO Project VALUES (1, 'Project Alpha', 1);
INSERT INTO Project VALUES (2, 'Project Beta', 2);
INSERT INTO Project VALUES (3, 'Project Gamma', 1);
INSERT INTO Project VALUES (4, 'Project Delta', 3);
INSERT INTO Project VALUES (5, 'Project Epsilon', 4);


select * from Employee;
select name, salary from Employee;
select name from Employe WHERE age > 30;
select name from Department;
select name from Employee WHERE department_id = 1;


select name from Employee where name like 'J%';
select name from Employee where name like '%e';
select name from Employee where name like '%a%';
select name from Employee where LENGTH(name) = 9;
select name from Employee where name like '_o%';


select name from Employee where hire_date > '2020-01-01';
select name from Employee where MONTH(hire_date) = 1;
select name from Employee where YEAR(hire_date) < 2019;
select name from Employee where hire_date >=2021-03-01;
select* from Employee where hire_date >=CURDATE()-INTERVAL 2 YEAR;

select SUM(salary) from Employee;
select AVG(salary) from Employee;
select MIN(salary) from Employee;
select department_id, COUNT(*) As total_employees from Employee GROUP BY department_id;
select department_id, AVG(salary) As avg_salary from Employee GROUP BY department_id;


SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department;
SELECT department, AVG(age) AS avg_age FROM employees GROUP BY department;
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS employee_count FROM employees GROUP BY YEAR(hire_date) ORDER BY hire_year;
SELECT department,  MAX(salary) AS highest_salary FROM employees GROUP BY department;
SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department ORDER BY avg_salary DESC LIMIT 1;


SELECT department, COUNT(*) AS employee_count FROM employees GROUP BY department HAVING COUNT(*) > 2;
SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department HAVING AVG(salary) > 55000;
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS employee_count FROM employees GROUP BY YEAR(hire_date) HAVING COUNT(*) > 1;
SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department HAVING SUM(salary) < 100000;
SELECT department, MAX(salary) AS highest_salary FROM employees GROUP BY department HAVING MAX(salary) > 75000;


SELECT * FROM employees ORDER BY salary ASC;
SELECT * FROM employees ORDER BY age DESC;
SELECT * FROM employees ORDER BY hire_date ASC; 
SELECT * FROM employees ORDER BY department, salary;
SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department ORDER BY total_salary;


SELECT e.employee_name,  d.department_name FROM employees e JOIN departments d ON e.department_id = d.department_id;
SELECT p.project_name, d.department_name FROM projects p JOIN departments d ON p.department_id = d.department_id;
SELECT e.employee_name, p.project_name FROM employees e JOIN projects p ON e.project_id = p.project_id;
SELECT e.employee_name, d.department_name FROM employees e LEFT JOIN departments d ON e.department_id = d.department_id;
SELECT d.department_name,  e.employee_name FROM departments d LEFT JOIN employees e ON d.department_id = e.department_id;
SELECT e.employee_name FROM employees e LEFT JOIN projects p ON e.project_id = p.project_id WHERE p.project_id IS NULL;
SELECT e.employee_name, COUNT(p.project_id) AS project_count FROM employees e JOIN departments d ON e.department_id = d.department_id LEFT JOIN projects p ON d.department_id = p.department_id GROUP BY e.employee_name;
SELECT d.department_name FROM departments d LEFT JOIN employees e ON d.department_id = e.department_id WHERE e.employee_id IS NULL;
SELECT employee_name FROM employees WHERE department_id = (
    SELECT department_id
    FROM employees
    WHERE employee_name = 'John Doe'
)
AND employee_name <> 'John Doe';
SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY avg_salary DESC
LIMIT 1;

SELECT employee_name, salary FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);
SELECT employee_name, salary FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
SELECT MAX(salary) AS second_highest_salary FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);
SELECT department,  COUNT(*) AS employee_count
FROM employees
GROUP BY department
ORDER BY employee_count DESC
LIMIT 1;
SELECT name, salary, department FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department = e.department
);
SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 2;
SELECT name, age FROM Employee
WHERE age > ALL (
    SELECT age
    FROM Employee
    WHERE department = 'HR'
);
SELECT department, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department
HAVING AVG(salary) > 55000;
SELECT name, department FROM Employee
WHERE department IN (
    SELECT department
    FROM Employee
    GROUP BY department
    HAVING COUNT(projects) >= 2
);
SELECT name, hire_date FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    WHERE name = 'Jane Smith'
);
SELECT SUM(salary) AS total_salary
FROM Employee
WHERE YEAR(hire_date) = 2020;
SELECT department, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department
ORDER BY avg_salary DESC;
SELECT department
FROM Employee
GROUP BY department
HAVING COUNT(*) > 1
AND AVG(salary) > 55000;
SELECT *
FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
ORDER BY hire_date;
SELECT department,
       COUNT(*) AS total_employees,
       AVG(salary) AS avg_salary
FROM Employee
GROUP BY department
HAVING COUNT(*) > 2;
SELECT name, salary
FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department = e.department
);
SELECT name, hire_date
FROM Employee
WHERE hire_date = (
    SELECT MIN(hire_date)
    FROM Employee
);
SELECT department,
       COUNT(projects) AS total_projects
FROM Employee
GROUP BY department
ORDER BY total_projects DESC;
SELECT department, name, salary
FROM Employee e
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE department = e.department
);
SELECT name, salary, age
FROM Employee e
WHERE age > (
    SELECT AVG(age)
    FROM Employee
    WHERE department = e.department
);