SELECT A.Department, A.Employee, A.Salary
    FROM (SELECT D.name AS Department, E.name AS Employee, E.Salary, dense_rank() OVER (PARTITION BY E.DepartmentId ORDER BY E.SALARY DESC) AS Salary_rank From Employee AS E
         INNER JOIN
         Department AS D
         ON E.DepartmentId = D.Id) AS A
    WHERE Salary_rank = 1 
    or Salary_rank = 2 
    or Salary_rank = 3