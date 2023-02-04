CREATE FUNCTION ufn_CalculateFutureValue (@sum DECIMAL(15,2), @yearly FLOAT, @years INT)

RETURNS DECIMAL(15,4)
BEGIN
    DECLARE @Result DECIMAL(15,4) 
	SET @Result = (@sum *POWER((1 + @yearly), @years)) 
     RETURN @Result
END