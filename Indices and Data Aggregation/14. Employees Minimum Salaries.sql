SELECT e.DepartmentID, MIN(e.Salary) FROM Employees e

GROUP BY e.DepartmentID
HAVING e.DepartmentID IN(2, 5,7)