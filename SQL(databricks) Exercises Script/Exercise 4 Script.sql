select * from `workspace`.`default`.`employees_exer4` limit 100;

--SQL Practice Exercise 4: Joins, UNION, Filtering, and Aggregates

--Q1 Retrieve all employees and their assigned projects using an INNER JOIN.
select A.EmployeeID, A.FirstName, A.LastName, A.Department, A.Salary, B.ProjectID, B.ProjectName,B.Budget, B.Status
from `workspace`.`default`.`employees_exer4` as A
inner join `workspace`.`default`.`the_projects` as B
on A.EmployeeID = B.EmployeeID;

--Q2 Retrieve all employees and their assigned projects, including employees who have no projects using a LEFT JOIN.
select A.EmployeeID, A.FirstName, A.LastName, A.Department, A.Salary,
B.ProjectID, B.ProjectName, B.Budget, B.Status
from `workspace`.`default`.`employees_exer4` as A
left join `workspace`.`default`.`the_projects` as B
on A.EmployeeID = B.EmployeeID;

--Q3 Retrieve all projects and their assigned employees, including projects that have no employees using a RIGHT JOIN.
select B.ProjectID, B.ProjectName, B.Budget, B.Status, A.EmployeeID, A.FirstName,
A.LastName, A.Department, A.Salary
from `workspace`.`default`.`employees_exer4` as A
right join `workspace`.`default`.`the_projects` as B
on A.EmployeeID = B.EmployeeID;

--Q4 Retrieve all employees and projects, including those without a match in either table using a FULL OUTER JOIN.
select A.EmployeeID, A.FirstName, A.LastName, A.Department, A.Salary,
B.ProjectID, B.ProjectName, B.Budget, B.Status
from `workspace`.`default`.`employees_exer4` as A
full outer join `workspace`.`default`.`the_projects` as B
on A.EmployeeID = B.EmployeeID;

--UNION & UNION ALL 

--Q5 Retrieve a list of all unique cities where employees are located and project statuses.
select distinct City as Location
from `workspace`.`default`.`employees_exer4`
union
select distinct Status
from `workspace`.`default`.`the_projects` ;

--Q6 Retrieve a list of all cities where employees are located and project statuses, allowing duplicates.
select City as Location
from `workspace`.`default`.`employees_exer4`
union all
select Status
from `workspace`.`default`.`the_projects` ;

 --Filtering Statements
--Q7 Retrieve employees who earn more than 70,000
select EmployeeID, FirstName, LastName, Department, Salary
from `workspace`.`default`.`employees_exer4`
where Salary > 70000;

--Q8 Retrieve employees working in either IT or Finance departments.
select EmployeeID, FirstName, LastName, Department, Salary
from `workspace`.`default`.`employees_exer4`
where Department = 'IT' or Department = 'Finance';

--Q9 Retrieve projects that are not yet completed.
select ProjectID, ProjectName, Budget, Status
from `workspace`.`default`.`the_projects`
where Status != 'Completed';

--Q10 Retrieve projects that have a budget greater than 70,000 and are not completed.
select ProjectID, ProjectName, Budget, Status
from `workspace`.`default`.`the_projects`
where Budget > 70000 and Status != 'Completed';

--11. Retrieve employees from New York OR Toronto, ordered by salary in descending order.
select EmployeeID, FirstName, LastName, Department, Salary, City
from `workspace`.`default`.`employees_exer4`
where City = 'New York' or City = 'Toronto'
order by Salary desc;

--12. Retrieve the top 3 highest-paid employees.
select EmployeeID, FirstName, LastName, Department, Salary
from `workspace`.`default`.`employees_exer4`
order by Salary desc
limit 3;

--Aggregate Functions with GROUP BY & HAVING
--Q13 Find the total salary per department, sorted in descending order.
select sum(Salary) as Total_salary, Department
from `workspace`.`default`.`employees_exer4`
group by Department
order by Total_salary desc;

--Q14 Find the average salary per city, but only include cities where the average salary is greater than 65,000.
select avg(Salary) as Average_salary, City
from `workspace`.`default`.`employees_exer4`
group by City
Having Average_salary > 65000;

--Q15 Count the number of employees per department, including only departments with more than 1 employee.
select count(EmployeeID) as Employee_count,
Department
from `workspace`.`default`.`employees_exer4`
group by Department
having Employee_count > 1;

--Q16 Retrieve the number of projects per status, but only include statuses with at least 2 projects.
select count(ProjectID) as ProjectCount, Status
from `workspace`.`default`.`the_projects`
group by Status
having ProjectCount >= 2;

--Q17 Retrieve the total project budget per employee, but only for employees who are managing projects worth more than 150,000.
select SUM(Budget) as TotalProjectBudget, A.EmployeeID, FirstName, LastName
from `workspace`.`default`.`employees_exer4` as A
inner join `workspace`.`default`.`the_projects` as B
on A.EmployeeID = B.EmployeeID
group by A.EmployeeID, FirstName, LastName
having TotalProjectBudget > 150000;
