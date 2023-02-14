SELECT FirstName + ' ' + LastName AS Mechanic, j.Status, j.IssueDate  FROM Mechanics m
JOIN Jobs j ON j.MechanicId = m.MechanicId
ORDER BY m.MechanicId, j.IssueDate, j.JobId