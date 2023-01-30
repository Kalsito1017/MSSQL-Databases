SELECT DISTINCT LEFT (FirstName, 1) AS [FirstLetter] 
FROM WizzardDeposits w
WHERE w.DepositGroup = 'Troll Chest'
GROUP BY LEFT(FirstName, 1)
ORDER BY FirstLetter