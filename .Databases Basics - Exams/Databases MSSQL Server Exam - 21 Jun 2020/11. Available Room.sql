CREATE FUNCTION udf_GetAvailableRoom(@HotelId INT, @Date DATE, @People INT)
RETURNS NVARCHAR(MAX)
BEGIN


      DECLARE @RoomInfo VARCHAR(MAX) = (SELECT TOP(1)'Room ' + CONVERT(varchar, r.Id) + ': ' + r.Type + ' (' + CONVERT(VARCHAR, r.Beds) + ' beds) - $' + CONVERT(varchar, (BaseRate + Price) * @People) AS FinalPrice FROM Rooms r
JOIN Hotels h ON r.HotelId = h.Id

WHERE Beds >= @People AND HotelId = @HotelId AND
    NOT EXISTS(SELECT * FROM Trips t WHERE t.RoomId = r.Id AND CancelDate IS  NULL 
	 AND @Date BETWEEN ArrivalDate AND ReturnDate)
ORDER BY (BaseRate + Price) * @People DESC)
IF @RoomInfo IS NULL
  RETURN 'No rooms available';
RETURN @RoomInfo;

END
--GO

--DECLARE @HotelId INT = 112
--DECLARE @Date DATE = '2011-12-17'
--DECLARE @People INT = 2
--SELECT TOP(1)'Room ' + CONVERT(varchar, r.Id) + ': ' + r.Type + ' (' + CONVERT(VARCHAR, r.Beds) + ' beds) - $' + CONVERT(varchar, (BaseRate + Price) * @People) AS FinalPrice FROM Rooms r
--JOIN Hotels h ON r.HotelId = h.Id

--WHERE Beds >= @People AND HotelId = @HotelId AND
--    NOT EXISTS(SELECT * FROM Trips t WHERE t.RoomId = r.Id AND CancelDate IS  NULL 
--	 AND @Date BETWEEN ArrivalDate AND ReturnDate)
--ORDER BY (BaseRate + Price) * @People DESC

--SELECT dbo.udf_GetAvailableRoom(112, '2011-12-17', 2)
--SELECT dbo.udf_GetAvailableRoom(94, '2015-07-26', 3)