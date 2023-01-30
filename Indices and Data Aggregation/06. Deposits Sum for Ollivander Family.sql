SELECT DepositGroup,SUM(w.DepositAmount) FROM WizzardDeposits w
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY w.DepositGroup