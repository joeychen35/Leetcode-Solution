SELECT w1.id 
    FROM weather as w1,weather as w2
    WHERE DATEDIFF(w1.recorddate, w2.recorddate) = 1 
    AND w1.Temperature > w2.Temperature