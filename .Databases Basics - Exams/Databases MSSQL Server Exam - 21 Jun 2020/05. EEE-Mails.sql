SELECT FirstName, LastName, FORMAT(BirthDate,'MM-dd-yyyy') AS BirthDate, c.Name AS Hometown, a.Email FROM Accounts a
JOIN Cities c ON c.Id = a.CityId
WHERE a.Email LIKE 'e%'
ORDER BY c.Name 