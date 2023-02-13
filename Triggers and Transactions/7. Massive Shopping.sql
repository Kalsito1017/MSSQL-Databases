SELECT i.Name FROM Users u
  JOIN UsersGames ug ON ug.UserId = u.Id
  JOIN Games g ON g.Id = ug.GameId
  JOIN UserGameItems ugi ON ugi.UserGameId = ug.Id
  JOIN Items i ON i.Id = ugi.ItemId
WHERE u.Username = 'Stamat' AND g.Name = 'Safflower'
ORDER BY i.Name