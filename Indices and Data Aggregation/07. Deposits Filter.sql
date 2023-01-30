SELECT DepositGroup, SUM(w.DepositAmount) AS TotalSum FROM WizzardDeposits w
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY w.DepositGroup
HAVING SUM(w.DepositAmount) < 150000
ORDER BY TotalSum DESC
