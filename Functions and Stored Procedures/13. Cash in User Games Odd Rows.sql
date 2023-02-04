CREATE FUNCTION ufn_CashInUsersGames (@gameName VARCHAR(MAX))
RETURNS TABLE
AS
RETURN (SELECT SUM(k.TotalCash) AS SumCash FROM( SELECT Cash AS TotalCash ,
ROW_NUMBER() OVER(ORDER BY Cash DESC) AS RowNumber
       FROM Games g
    JOIN UsersGames ug ON ug.GameId = g.Id
	WHERE g.Name = @gameName	
	) AS k
WHERE k.RowNumber % 2 = 1)


