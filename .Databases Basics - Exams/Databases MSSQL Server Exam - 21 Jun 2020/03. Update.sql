SELECT * FROM Rooms WHERE HotelId IN (5,7,9)
UPDATE Rooms
SET Price = Price * 1.14
WHERE HotelId IN (5,7,9)