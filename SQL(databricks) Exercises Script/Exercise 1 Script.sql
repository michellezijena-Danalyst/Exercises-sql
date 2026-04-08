select * from `workspace`.`default`.`employees_db` limit 100;

--Excerise 1: SQL FUNDAMENTALS

--Q1 Retrieve all columns from the employees table.
SELECT*
FROM `workspace`.`default`.`employees_db`;

--Q2 Find all the unique departments in the employees table.
SELECT DISTINCT Department
FROM `workspace`.`default`.`employees_db`;

--Q3 ORDER BY statement: Retrieve all the employee's first names, last names, ordered by salary in descending order.
SELECT First_name,
Last_name,
Salary
FROM `workspace`.`default`.`employees_db`
ORDER BY Salary DESC;

--Q4 LIMIT statement: Retrieve the top 5 highest-paid employees.
SELECT First_name,
Last_name,
Salary
FROM `workspace`.`default`.`employees_db`
ORDER BY Salary DESC
LIMIT 5;

--Q5  WHERE statement: Find employees who work in the IT department.
SELECT First_name,
Last_name,
Department
FROM `workspace`.`default`.`employees_db`
WHERE Department = 'IT';

--Q6 AND statement: Find employees who work in Finance and have salary  greater than 58 000
SELECT First_name,
Last_name,
Salary,
Department
FROM `workspace`.`default`.`employees_db`
WHERE Department = 'Finance' AND Salary > 58000;

--Q7: OR statement: Find employees who work in the HR department OR Marketing department.
SELECT First_name,
Last_name,
Department
FROM `workspace`.`default`.`employees_db`
WHERE Department IN('HR','Marketing'); 

--Q8 NOT statement: Find employees who do not work in the IT department.
SELECT First_name,
Last_name,
Department
FROM `workspace`.`default`.`employees_db`
WHERE NOT Department = 'IT';


--Q9 IN statement: Find employees who are in the HR,IT or Finance department.
SELECT First_name,
Last_name,
Department
FROM `workspace`.`default`.`employees_db`
WHERE Department IN('HR','IT','Finance');

--Q10 Combining conditions: Find employees who are in the IT department, have salary greater than 50 000 & located in New York.
SELECT First_name,
Last_name,
Department,
Salary,
City
FROM `workspace`.`default`.`employees_db`
WHERE Department = 'IT' AND City = 'New York';

--Q11 Combining WHERE, AND and ORDER BY: Retrieve all employees who work in the Finance or Marketing department, earn more  than 52 000 and order the results by salary in descending order.
SELECT First_name,
Last_name,
Department,
Salary
FROM `workspace`.`default`.`employees_db`
WHERE Department IN('HR','IT','Finance') AND Salary > 52000 
ORDER BY Salary DESC;

--Q12 Combining SELECT DISTINCT, WHERE and IN 
SELECT DISTINCT City,
First_name,
Last_name,
Department 
FROM `workspace`.`default`.`employees_db`
WHERE Department NOT IN('IT','HR');

--Q13 Combining WHERE, NOT, AND, and ORDER BY: Retrieve employees who are not in the Finance department, have salary greater than 50 000 and order results by hire date in ascending order.
SELECT First_name,
Last_name,
Department,
Salary,
Hire_Date
FROM `workspace`.`default`.`employees_db`
WHERE Department != 'Finance' AND Salary > 50000
ORDER BY Hire_Date ASC;

--Q14 Combining WHERE, OR, IN and LIMIT
SELECT First_name,
Last_name,
Department,
City
FROM `workspace`.`default`.`employees_db`
WHERE Department = 'IT' OR Department = 'Marketing' AND City IN('Chicago', 'Los Angeles')
LIMIT 3;

