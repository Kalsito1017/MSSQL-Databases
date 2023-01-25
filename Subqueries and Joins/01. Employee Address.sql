SELECT TOP(5) EmployeeID, JobTitle,E.AddressID, AddressText  FROM Employees  AS E
 JOIN Addresses AS A ON E.AddressID = A.AddressID
ORDER BY AddressID