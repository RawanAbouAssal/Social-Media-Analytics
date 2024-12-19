-- 1.Location by Average Engagement
SELECT
l.City,
l.Country,
ROUND(AVG(sm.TotalEngagement), 1) AS AvgEngagement
FROM Users u
JOIN Locations l ON u.LocationID = l. LocationID
JOIN SocialMediaUsage sm ON u.UserID = sm.UserID
GROUP BY l.City, l.Country
ORDER BY AvgEngagement DESC;

-- 2. Daily Average Engagement Time By Country
SELECT
l.Country,
ROUND(AVG(sm.AvgTime), 2) AS AvgEngagementTime
FROM Users u
JOIN Locations l ON u.LocationID = l.LocationID
JOIN SocialMediaUsage sm ON u.UserID = sm.UserID
GROUP BY l.Country
ORDER BY AvgEngagementTime DESC;

-- 3. Platform Popularity by Number of Users
SELECT
    p.PlatformName,
    COUNT(*) AS UserCount
FROM (
    SELECT DISTINCT sm.UserID, sm.PlatformID
    FROM SocialMediaUsage sm
) distinct_users
JOIN Platforms p ON distinct_users.PlatformID = p.PlatformID
GROUP BY p.PlatformName
ORDER BY UserCount DESC;

-- 4. Average Followers per Platform by Location
SELECT
l.City,
l.Country,
p.PlatformName,
ROUND(AVG(sm. Followers), 1) AS AvgFollowers
FROM Locations L
JOIN Users u ON l.LocationID = u. LocationID
JOIN SocialMediaUsage sm ON u. UserID = sm. UserID
JOIN Platforms p ON sm. PlatformID = p. PlatformID
GROUP BY l.City, l.Country, p.PlatformName
ORDER BY AvgFollowers DESC;

-- 5. Daily Usage Time by Platform
SELECT
p.PlatformName,
ROUND(AVG(sm.AvgTime), 5) AS AvgDailyTime
FROM SocialMediaUsage sm
JOIN Platforms p ON sm. PlatformID = p.PlatformID
GROUP BY p.PlatformName
ORDER BY AvgDailyTime DESC;

-- 6. Engagement Categories by Platform
SELECT
p.PlatformName,
ec.CategoryName,
COUNT(uc.UserCategoryID) AS CategoryCount
FROM Platforms p
JOIN SocialMediaUsage sm ON p.PlatformID = sm. PlatformID
JOIN UserCategories uc ON sm. UserID = uc. UserID
JOIN EngagementCategories ec ON uc. CategoryID = ec. CategoryID
GROUP BY p.PlatformName, ec.CategoryName
ORDER BY p.PlatformName, CategoryCount DESC;