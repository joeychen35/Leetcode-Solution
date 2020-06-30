SELECT A.Name as Employee FROM Employee as A
    INNER JOIN Employee AS B
    ON A.ManagerId = B.Id
    WHERE A.Salary > B.Salary