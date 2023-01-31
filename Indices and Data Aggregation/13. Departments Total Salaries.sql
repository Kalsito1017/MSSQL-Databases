SELECT e.DepartmentID, SUM(e.Salary) FROM Employees e
GROUP BY e.DepartmentID