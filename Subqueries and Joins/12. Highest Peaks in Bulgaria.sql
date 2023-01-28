SELECT mc.CountryCode,m.MountainRange, p.PeakName, p.Elevation FROM Mountains m
JOIN Peaks p ON m.Id = p.MountainId
JOIN MountainsCountries mc ON m.Id = mc.MountainId
WHERE p.Elevation > 2835
AND mc.CountryCode = 'BG'
ORDER BY Elevation DESC
