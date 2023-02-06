CREATE TABLE Logs
(
   LogId INT NOT NULL IDENTITY,
   AccountId INT FOREIGN KEY REFERENCES Accounts(Id),
   OldSum Money,
   NewSum Money
)
CREATE TRIGGER tr_ChangeBalance ON Accounts
AFTER UPDATE
AS
BEGIN
   INSERT INTO Logs(AccountId, OldSum, NewSum)
   SELECT i.Id, d.Balance, i.Balance FROM inserted i
   JOIN deleted d ON i.Id = d.Id

END

