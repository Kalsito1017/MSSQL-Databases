SELECT SUM(g.DepositAmount - w.DepositAmount) AS SumDifference FROM WizzardDeposits w
JOIN WizzardDeposits g ON g.Id + 1 = w.Id
