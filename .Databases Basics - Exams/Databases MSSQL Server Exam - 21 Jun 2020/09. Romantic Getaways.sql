SELECT AccountId AS Id, Email, ac.Name AS City, Count(*) AS Trips 
FROM AccountsTrips at
JOIN Accounts a ON at.AccountId = a.Id
JOIN Cities ac ON ac.Id = a.CityId
JOIN Trips t ON t.Id = at.TripId
JOIN Rooms r ON t.RoomId = r.Id
JOIN Hotels h ON h.Id = r.HotelId
JOIN Cities hc ON hc.Id = h.CityId
WHERE hc.Id =  ac.Id
GROUP BY AccountId, Email, ac.Name
order BY Trips DESC, AccountId 