SELECT e.EmployeeID, e.FirstName,

CASE
    WHEN p.StartDate >= '2005' THEN NULL
	ELSE  p.Name
END AS [ProjectName]
FROM Employees e
JOIN EmployeesProjects ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON p.ProjectID = EP.ProjectID
WHERE e.EmployeeID = 24 AND p.StartDate >= 2005

