SELECT mc.CountryCode, COUNT(mc.CountryCode) FROM MountainsCountries mc

JOIN Mountains m ON m.Id = mc.MountainId
WHERE mc.CountryCode IN ('US', 'RU', 'BG')
GROUP BY mc.CountryCode
