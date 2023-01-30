SELECT DepositGroup,SUM(w.DepositAmount) FROM WizzardDeposits w
GROUP BY w.DepositGroup