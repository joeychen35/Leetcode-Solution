SELECT D.Name AS Department, E.Name AS Employee, E.Salary
FROM 
Employee AS E
INNER JOIN
Department AS D
ON E.DepartmentId = D.Id 

WHERE (E.Salary, D.Name) IN 
(SELECT MAX(E.Salary), D.NAME
FROM 
Employee AS E
INNER JOIN
Department AS D
ON E.DepartmentId = D.Id
GROUP BY D.Id)