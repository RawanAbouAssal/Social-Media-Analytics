-- 1. Create Users Table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Gender ENUM('Male', 'Female', 'Other'),
    Age INT,
    AgeGroupID INT,
    LocationID INT,
    PreferredPlatformID INT,
    FOREIGN KEY (AgeGroupID) REFERENCES AgeGroups(AgeGroupID),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID),
    FOREIGN KEY (PreferredPlatformID) REFERENCES Platforms(PlatformID)
);

-- 2. Create AgeGroups Table
CREATE TABLE AgeGroups (
    AgeGroupID INT AUTO_INCREMENT PRIMARY KEY,
    AgeGroup VARCHAR(50)
);

-- 3. Create Locations Table
CREATE TABLE Locations (
    LocationID INT AUTO_INCREMENT PRIMARY KEY,
    City VARCHAR(255),
    Country VARCHAR(255)
);

-- 4. Create Platforms Table
CREATE TABLE Platforms (
    PlatformID INT AUTO_INCREMENT PRIMARY KEY,
    PlatformName VARCHAR(255)
);

-- 5. Create SocialMediaUsage Table
CREATE TABLE SocialMediaUsage (
    UsageID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    PlatformID INT,
    Followers INT,
    PostsNumber INT,
    AvgTime FLOAT,
    TotalEngagement FLOAT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (PlatformID) REFERENCES Platforms(PlatformID)
);

-- 6. Create EngagementCategories Table
CREATE TABLE EngagementCategories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(255)
);

-- 7. Create UserCategories Table
CREATE TABLE UserCategories (
    UserCategoryID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    CategoryID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CategoryID) REFERENCES EngagementCategories(CategoryID)
);
