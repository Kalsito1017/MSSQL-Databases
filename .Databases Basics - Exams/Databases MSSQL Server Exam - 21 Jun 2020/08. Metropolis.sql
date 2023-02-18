SELECT TOP(10) c.Id,c.Name, c.CountryCode AS Country, COUNT(*) AS Accounts 
FROM Accounts a
JOIN Cities c ON a.CityId = c.Id
GROUP BY C.Id,c.Name, C.CountryCode 
ORDER BY Accounts DESC