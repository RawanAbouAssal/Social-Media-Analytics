INSERT INTO AgeGroups (AgeGroup)
SELECT DISTINCT AgeGroup
FROM processed_social;

INSERT INTO Locations (City, Country)
SELECT DISTINCT City, Country
FROM processed_social;

INSERT INTO Platforms (PlatformName)
SELECT DISTINCT PreferredPlatform
FROM processed_social;

INSERT INTO Users (Name, Gender, Age, AgeGroupID, LocationID, PreferredPlatformID)
SELECT 
    Name,
    Gender,
    Age,
    (SELECT AgeGroupID FROM AgeGroups WHERE AgeGroup = ps.AgeGroup),
    (SELECT LocationID FROM Locations WHERE City = ps.City AND Country = ps.Country),
    (SELECT PlatformID FROM Platforms WHERE PlatformName = ps.PreferredPlatform)
FROM processed_social ps;

INSERT INTO SocialMediaUsage (UserID, PlatformID, Followers, PostsNumber, AvgTime, TotalEngagement)
SELECT 
    (SELECT UserID FROM Users WHERE Name = ps.Name),
    (SELECT PlatformID FROM Platforms WHERE PlatformName = ps.PlatformName),
    Followers,
    PostsNumber,
    AvgTime,
    TotalEngagement
FROM processed_social ps;

INSERT INTO EngagementCategories (CategoryName)
SELECT DISTINCT EngagementCategory
FROM processed_social;

INSERT INTO UserCategories (UserID, CategoryID)
SELECT 
    (SELECT UserID FROM Users WHERE Name = ps.Name),
    (SELECT CategoryID FROM EngagementCategories WHERE CategoryName = ps.EngagementCategory)
FROM processed_social ps;