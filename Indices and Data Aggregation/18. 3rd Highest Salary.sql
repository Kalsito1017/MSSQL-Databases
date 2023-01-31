SELECT DISTINCT e.DepartmentID,e.Salary FROM
(SELECT DepartmentID,Salary,DENSE_RANK() OVER 
(PARTITION BY DepartmentID ORDER BY Salary DESC) AS [Ranked]
FROM Employees) AS e
WHERE e.Ranked = 3