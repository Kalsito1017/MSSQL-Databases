CREATE TABLE NotificationEmails
(

 Id INT PRIMARY KEY  IDENTITY,
 Recipient INT FOREIGN KEY REFERENCES Accounts(Id),
 Subject VARCHAR(50),
 Body VARCHAR(MAX)
)

GO

CREATE TRIGGER tr_EmailsNotificationsAfterInsert
ON Logs AFTER INSERT 
AS
BEGIN
INSERT INTO NotificationEmails(Recipient,Subject,Body)
SELECT i.AccountID, 
CONCAT('Balance change for account: ',i.AccountId),
CONCAT('On ',GETDATE(),' your balance was changed from ',i.NewSum,' to ',i.OldSum)
  FROM inserted AS i
END

SELECT * FROM NotificationEmails 
UPDATE Accounts
SET Balance += 100
WHERE Id = 1
