CREATE FUNCTION udf_GetCost(@jobId INT)
RETURNS DECIMAL(15,2)
AS
BEGIN
DECLARE @result DECIMAL(15,2);
SET @result = (select SUM(p.Price * op.Quantity) AS totalSum FROM Jobs j
JOIN Orders AS o ON o.JobId = j.JobId
JOIN OrderParts op ON op.OrderId = o.OrderId
JOIN Parts p ON p.PartId = op.PartId
WHERE j.JobId = @jobId
GROUP BY j.JobId)
 
 IF(@result IS NULL)
 SET @result = 0
 RETURN @result

END
