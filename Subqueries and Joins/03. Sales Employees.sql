SELECT e.EmployeeID, e.FirstName, e.LastName, d.Name  FROM Employees e
JOIN Departments d ON d.DepartmentID = e.DepartmentID AND d.Name IN('Sales')
ORDER BY e.EmployeeID