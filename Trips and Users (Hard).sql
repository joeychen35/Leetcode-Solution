SELECT total_req_table.Day, ROUND(IFNULL(total_cancel_req/total_req,0),2) as 'Cancellation Rate' FROM
(SELECT T.Request_at as Day, Count(*) as total_req FROM Trips as T
    LEFT JOIN  
        (SELECT * 
            FROM Users
            WHERE Role = 'client') as C
    ON T.Client_Id = C.Users_Id
    LEFT JOIN
        (SELECT * 
            FROM Users
            WHERE Role = 'driver') as D
    ON T.Driver_Id = D.Users_Id
    WHERE C.Banned = 'No' AND D.Banned = 'No'
    GROUP BY Request_at) as total_req_table
    LEFT JOIN
    (SELECT T.Request_at as Day, Count(*) as total_cancel_req FROM Trips as T
        LEFT JOIN  
            (SELECT * 
                FROM Users
                WHERE Role = 'client') as C
        ON T.Client_Id = C.Users_Id
        LEFT JOIN
            (SELECT * 
                FROM Users
                WHERE Role = 'driver') as D
        ON T.Driver_Id = D.Users_Id
        WHERE C.Banned = 'No' AND D.Banned = 'No' AND T.STATUS LIKE "cancelled_by_%"
        GROUP BY T.Request_at) AS cancel_table
    ON total_req_table.Day = cancel_table.Day
    WHERE total_req_table.Day BETWEEN '2013-10-01' AND '2013-10-03';

    