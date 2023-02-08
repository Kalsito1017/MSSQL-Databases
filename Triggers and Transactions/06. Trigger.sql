SELECT *  FROM Users AS u
JOIN UsersGames ug ON ug.UserId = u.Id
JOIN Games AS g ON g.Id = ug.GameId
WHERE g.Name = 'Bali' AND u.Username IN('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid','monoxidecos')

UPDATE UsersGames
SET Cash += 50000
WHERE GameId = (SELECT Id FROM Games WHERE Name = 'Bali')
AND UserId IN (SELECT Id FROM Users WHERE Username IN('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid','monoxidecos'))


SELECT * FROM Items WHERE Id = 2
SELECT * FROM UsersGames


CREATE TRIGGER tr_RestrictItems ON UserGameItems INSTEAD OF INSERT
AS
DECLARE @itemId INT = (SELECT ItemId from inserted)
DECLARE @userGameId Int = (SELECT UserGameId FROM inserted)

DECLARE @itemLevel INT = (SELECT MinLevel FROM Items WHERE Id = @itemId)
DECLARE @userGameLevel INT = (SELECT Level FROM UsersGames WHERE Id = @userGameId)

IF (@userGameLevel >= @itemLevel)
BEGIN
 INSERT INTO UserGameItems(ItemId, UserGameId) VALUES
 (@itemId, @userGameId
 )

END


