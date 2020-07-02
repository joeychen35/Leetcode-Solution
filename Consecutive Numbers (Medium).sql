SELECT DISTINCT num as ConsecutiveNums
    FROM (SELECT Id, Num, ROW_NUMBER() OVER (ORDER BY Id) - ROW_NUMBER() OVER (PARTITION BY Num ORDER BY Id) as RowNumber
    FROM Logs) as A
    GROUP BY RowNumber, num
    HAVING count(1) >= 3;
   