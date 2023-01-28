SELECT e.FirstName, e.LastName, e.HireDate, d.Name FROM Employees AS e
 JOIN Departments d ON d.DepartmentID = e.DepartmentID AND d.Name IN('Sales', 'Finance')
WHERE e.HireDate > '1.1.1999'
ORDER BY HireDate 