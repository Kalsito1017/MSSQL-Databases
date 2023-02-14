SELECT FirstName + ' ' + LastName AS Mechanic, AVG(DATEDIFF(DAY, j.IssueDate, j.FinishDate)) AS [Average Days]
FROM Mechanics m
JOIN Jobs j ON j.MechanicId = m.MechanicId
GROUP BY j.MechanicId, (FirstName + ' ' + LastName)
ORDER BY j.MechanicId