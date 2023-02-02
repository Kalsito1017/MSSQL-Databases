CREATE PROCEDURE usp_GetTownsStartingWith (@String VARCHAR(30))
AS
BEGIN
		  SELECT Name FROM Towns
		  WHERE LEFT(Name,Len(@String)) = @String
END