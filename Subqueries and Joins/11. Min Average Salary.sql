SELECT TOP(1) (SELECT AVG(Salary)) AS [MinAverageSalary] FROM Employees 
GROUP BY DepartmentID
ORDER BY (MinAverageSalary)
