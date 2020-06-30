SELECT C.Name as Customers
	FROM Customers as C
	LEFT JOIN
	Orders as O
	ON C.Id = O.CustomerId
	WHERE O.CustomerId IS NULL;