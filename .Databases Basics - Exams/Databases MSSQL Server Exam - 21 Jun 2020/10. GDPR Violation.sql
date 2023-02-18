SELECT at.TripId, FirstName + ' ' + ISNULL(MiddleName + ' ', '') + LastName AS [Full Name], c.Name AS [From]
, hc.Name AS [To],
CASE 
 WHEN CancelDate IS NULL THEN  CONVERT(NVARCHAR, DATEDIFF(DAY, ArrivalDate, ReturnDate)) + ' days'
 ELSE 'Canceled'
 END 
 AS Duration
FROM AccountsTrips at
JOIN Accounts a ON a.Id = at.AccountId
JOIN Cities c ON c.Id = a.CityId
JOIN Trips t ON at.TripId = T.Id
JOIN Rooms r ON t.RoomId = r.Id
JOIN Hotels h ON h.Id = r.HotelId
Join Cities hc ON hc.Id = h.CityId
ORDER BY [Full Name], at.TripId



