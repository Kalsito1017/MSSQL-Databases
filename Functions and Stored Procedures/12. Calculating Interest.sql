CREATE PROC usp_CalculateFutureValueForAccount (@accountId INT, @interestRate Float)
AS
BEGIN
SELECT a.Id AS [Account Id], 
FirstName AS [First Name], LastName AS [Last Name], 
Balance AS [Current Balance],
dbo.ufn_CalculateFutureValue(a.Balance, @interestRate, 5) AS [Balance in 5 years]
FROM AccountHolders ah
JOIN Accounts AS a ON a.AccountHolderId = ah.Id
WHERE a.Id = @accountId
END