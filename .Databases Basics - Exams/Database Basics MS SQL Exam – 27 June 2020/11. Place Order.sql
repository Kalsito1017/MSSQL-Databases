CREATE PROC usp_PlaceOrder
(@jobId INT, 
@serialNumber VARCHAR(50),
@Quantity INT
)
AS

DECLARE @status VARCHAR(10) = (SELECT Status FROM Jobs WHERE JobId = @jobId)
DECLARE @partId VARCHAR(10) = (SELECT PartId FROM Parts WHERE SerialNumber = @serialNumber)

IF(@status = 'Finished')
THROW 50011, 'This job is not active!', 1
ELSE IF(@Quantity <= 0)
THROW 50012,'Part quantity must be more than zero!', 1
ELSE IF(@status IS NULL)
THROW 50013, 'Job not found', 1
ELSE IF (@partId IS NULL)
THROW 50014, 'Part not found!', 1 
DECLARE @orderId INT = (Select OrderId from Orders WHERE JobId = @jobId)

IF(@orderId IS NULL)
INSERT INTO Orders(JobId, IssueDate) VALUES
(
@jobId,
NULL
)

SET @orderId = (SELECT OrderId FROM Orders WHERE JobId = @jobId)

INSERT INTO OrderParts (OrderId, PartId) VALUES
(
  @orderId, @partId
)
DECLARE @issueDate DATE = (SELECT  IssueDate FROM Orders WHERE OrderId = @orderId)
IF(@issueDate IS NULL)
INSERT INTO OrderParts  (OrderId, PartId, Quantity) VALUES
(
   @orderId, @partId, @Quantity
)
ELSE
 UPDATE OrderParts 
 SET Quantity += @Quantity
 WHERE OrderId = @orderId AND PartId = @partId
 DECLARE @err_msg AS NVARCHAR(MAX);
BEGIN TRY
  EXEC usp_PlaceOrder 1, 'ZeroQuantity', 0
END TRY

BEGIN CATCH
  SET @err_msg = ERROR_MESSAGE();
  SELECT @err_msg
END CATCH

