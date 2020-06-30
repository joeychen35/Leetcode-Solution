Delete p1 FROM Person AS p1
    INNER JOIN Person AS P2
    WHERE p1.id > p2.id 
    AND p1.Email = p2. Email;