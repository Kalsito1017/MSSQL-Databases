SELECT * FROM Parts p
JOIN PartsNeeded pn ON pn.PartId = p.PartId
JOIN OrderParts op ON op.PartId = p.PartId
JOIN Jobs j ON j.JobId = pn.JobId
LEFT JOIN Orders AS o ON o.JobId = j.JobId
WHERE j.Status != 'Finished' AND p.StockQty + op.Quantity < pn.Quantity



