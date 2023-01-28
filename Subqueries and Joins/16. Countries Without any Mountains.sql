SELECT COUNT(*) FROM Countries c
LEFT Join MountainsCountries mc ON mc.CountryCode = c.CountryCode
WHERE mc.MountainId IS NULL