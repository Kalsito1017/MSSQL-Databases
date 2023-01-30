SELECT DepositGroup, MagicWandCreator, MIN(DepositCharge) FROM WizzardDeposits w
GROUP BY w.DepositGroup, w.MagicWandCreator