CREATE PROC usp_TransferMoney(@senderId INT, @receiverId INT, @amount DECIMAL (15,4))
AS
BEGIN TRANSACTION
EXEC usp_WithdrawMoney @senderId, @amount
EXEC usp_DepositMoney @receiverId , @amount
COMMIT

SELECT * FROM Accounts WHERE Id = 1 OR Id = 2
EXEC usp_TransferMoney 1, 2, 100