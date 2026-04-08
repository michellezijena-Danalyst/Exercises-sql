select * from `workspace`.`default`.`employees_exercise_2` limit 100;

--Q1 COUNT()FUNCTION: Write sql query to find the total number of employees in the company.
SELECT COUNT(id) AS id
FROM `workspace`.`default`.`employees_exercise_2`;

--Q2 SUM() FUNCTION: Find the total salary paid to all employees in the IT department
SELECT SUM(salary) AS Total_salary,
department
FROM `workspace`.`default`.`employees_exercise_2`
WHERE department = 'IT'
GROUP BY department;

--Q3 AVG() FUNCTION: Write sql query to calculate the average salary of employees in the HR department.
SELECT AVG(salary) AS Avg_salary,
department
FROM `workspace`.`default`.`employees_exercise_2`
WHERE department = 'HR'
GROUP BY department;

--Q4 MIN() AND MAX() FUNCTIONS: Write an sql query to find the highest and lowest salary in the company.
SELECT MIN(salary) AS MIN_salary,
MAX(salary) AS MAX_salary
FROM `workspace`.`default`.`employees_exercise_2`;

--Q5 GROUP BY statement: Write sql query to group employees by department and display the total salary paid in each department.
SELECT SUM(salary) AS Total_salary_per_department,
department
FROM `workspace`.`default`.`employees_exercise_2`
GROUP BY department;

--Q6 GROUP BY and COUNT(): Write a sql query to count how many employees work in each city.
SELECT COUNT(id) AS Number_Of_Employees,
city
FROM `workspace`.`default`.`employees_exercise_2`
GROUP BY city;

--Q7 GROUP BY and ORDER BY: Write a sql query to group employees by department , calculate average salary in each department and order the results in descending order of average salary.
SELECT AVG(salary) AS Average_Salary_Per_Department,
department
FROM `workspace`.`default`.`employees_exercise_2`
GROUP BY department
ORDER BY AVG(salary) DESC;

--Q8 HAVING CLAUSE: Write sql query to find departments where the total salary paid exceeds 100 000.
SELECT SUM(salary) AS Total_salary,
department
FROM `workspace`.`default`.`employees_exercise_2`
GROUP BY department 
HAVING SUM(salary) > 100000;

--Q9 Combining GROUP BY, HAVING  and ORDER BY: Write sql query to list cities where more than 1 employee works, ordered by the number of employees descending.
SELECT COUNT(id) AS Number_of_Employees,
city
FROM `workspace`.`default`.`employees_exercise_2`
GROUP BY city
HAVING COUNT(id) > 1
ORDER BY Number_of_Employees DESC;

--Q10 Combining AGGREGATE FUNCTIONS: Write sql query to find the department with the highest average salary.
SELECT AVG(salary) AS Average_salary,
department
FROM `workspace`.`default`.`employees_exercise_2`
GROUP BY department
ORDER BY Average_salary DESC
LIMIT 1;
