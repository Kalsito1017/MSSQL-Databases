CREATE PROCEDURE usp_GetEmployeesFromTown (@STRING VARCHAR(50))
AS
BEGIN
SELECT FirstName AS [First Name], LastName AS [Last Name] 
FROM Employees e
JOIN Addresses ad ON e.AddressID = ad.AddressID
JOIN Towns t ON t.TownID = ad.TownID
WHERE t.Name = @STRING
END