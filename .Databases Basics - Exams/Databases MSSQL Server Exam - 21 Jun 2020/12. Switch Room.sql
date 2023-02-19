CREATE  PROC usp_SwitchRoom(@TripId INT, @TargetRoomId INT)
AS

     DECLARE @TripHotelId INT = (SELECT r.HotelId FROM Trips t
	 JOIN Rooms r ON t.RoomId = r.Id
	 WHERE t.Id = @TripId);
	 DECLARE @TargetRoomHotelId INT = (SELECT HotelId FROM Rooms WHERE Id = @TargetRoomId)
	 IF(@TripHotelId != @TargetRoomHotelId)
	   THROW 50001, 'Target room is in another hotel!', 1
	 --IF()
	 --RAISERROR('Not enough beds in target room!');
	 DECLARE @TripAccounts INT = (SELECT COUNT(*) FROM AccountsTrips WHERE TripId = @TripId);
	 DECLARE @TargerRoomBeds INT = (SELECT Beds FROM Rooms WHERE Id = @TargetRoomId)
	 IF(@TripAccounts > @TargerRoomBeds)
	 THROW 50002, 'Not enough beds in target room!', 1
	 UPDATE Trips SET RoomId = @TargetRoomId WHERE Id = @TripId



EXEC usp_SwitchRoom 10, 11
SELECT RoomId FROM Trips WHERE Id = 10
EXEC usp_SwitchRoom 10, 7
EXEC usp_SwitchRoom 10, 8




