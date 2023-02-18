SELECT AccountId,a.FirstName + ' ' + a.LastName AS FullName,
MAX(DATEDIFF(DAY, ArrivalDate, ReturnDate)) AS LongestTrip,
MIN(DATEDIFF(DAY, ArrivalDate, ReturnDate)) AS ShortestTrip
FROM  AccountsTrips ac
JOIN Accounts a ON a.Id = ac.AccountId
JOIN Trips t ON ac.TripId= t.Id
WHERE a.MiddleName IS  NULL AND t.CancelDate IS NULL
Group BY AccountId, FirstName, LastName
ORDER BY LongestTrip DESC, ShortestTrip 