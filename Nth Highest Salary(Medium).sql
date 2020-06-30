CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT MAX(A.Salary)
		FROM (SELECT salary, DENSE_RANK() OVER (ORDER BY SALARY DESC) as rank_number FROM Employee ) as A
      WHERE rank_number = N
  )
  END