SELECT FirstName + ' ' + LastName AS Client, DATEDIFF(DAY, j.IssueDate, '24 April 2017') AS [Days Going], j.Status
FROM Clients c
JOIN Jobs j ON j.ClientId = c.ClientId
WHERE j.Status <> 'Finished'
ORDER BY [Days Going] DESC, j.ClientId
