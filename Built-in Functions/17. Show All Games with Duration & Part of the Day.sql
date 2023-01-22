SELECT Name AS [Game],'Part of the Day' =
        CASE 
		WHEN DATEPART(HOUR, Start) >= 0 AND DATEPART(hour, Start) < 12 THEN 'Morning'
		WHEN DATEPART(HOUR, Start) >= 12 AND DATEPART(hour, Start) < 18 THEN 'Afternoon'
		ELSE 'Evening'
		END,
		Duration =
		CASE WHEN Duration <= 3 THEN 'Extra Short'
		WHEN Duration > 3 AND Duration <= 6 THEN'Short'
		WHEN Duration > 6 THEN 'Long'
		ELSE 'Extra Long'
		END
  FROM Games
  ORDER BY Game, Duration
  