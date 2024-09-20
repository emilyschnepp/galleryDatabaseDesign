USE master;
GO

--Terminating all active sessions in the database.
ALTER DATABASE ArtistryCollectionDB
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO

--Dropping the database.
DROP DATABASE ArtistryCollectionDB;
GO

--Recreating the database.
CREATE DATABASE ArtistryCollectionDB;
GO
--Using the database.
USE ArtistryCollectionDB;
GO
-- Creating the Name table.
CREATE TABLE dbo.Name
(
	NameID	INT	NOT NULL	PRIMARY KEY,
	FirstName	NVARCHAR(100)	NOT NULL,
	MiddleName NVARCHAR(50),
	LastName NVARCHAR(50),
	Alias NVARCHAR(50)
);
GO
--Populating data for the name table.
INSERT INTO dbo.Name
	([NameID], [FirstName], [MiddleName], [LastName], [Alias])
VALUES
	(1, N'Orlando', N'Blanchard', N'Bloom', N'Legolas'),
	(2, N'Beyonce', N'Giselle', N'Knowles', N'Sasha Fierce'), 
	(3, N'Donna', N'Adrian', N'Summer', N'Queen of Disco'),
	(4, N'Janet', N'Damita Jo', N'Jackson', N'Miss Jackson'),
	(5, N'Britney', N'Jean', N'Spears', N'Princess of Pop'), 
	(6, N'Michael', N'Joseph', N'Jackson', N'King of Pop'),
	(7, N'Taylor', N'Alison', N'Swift', N'T-Swift'), 
	(8, N'Celine', N'Marie Claudette', N'Dion', N'Queen Celine'),
	(9, N'John', N'', N'Deere', N''),
	(10, N'Barbara', N'Joan', N'Streisand', N'Babs');
GO
--Creating the Location table.
CREATE TABLE dbo.Location
(
	LocationID	INT	NOT NULL	PRIMARY KEY,
	BuildingNumber NVARCHAR(10),
	StreetName NVARCHAR(50),
	AddressLine2 NVARCHAR(50),
	City	NVARCHAR(50),
	StateName	NVARCHAR(2),
	Country	NVARCHAR(100) NOT NULL,
	Zip NVARCHAR(10)
);
GO
--Populating data for the Location table.
INSERT INTO dbo.Location
([LocationID], [BuildingNumber], [StreetName], [AddressLine2], [City], [StateName], [Country], [Zip])
VALUES
    (1, N'123', N'Front St', N'Suite 100', N'Traverse City', N'MI', N'USA', N'49684'),
    (2, N'201', N'E River St', N'', N'Savannah', N'GA', N'USA', N'31401'),
    (3, N'789', N'Broadway', N'', N'San Diego', N'CA', N'USA', N'92101'),
    (4, N'1600', N'Amphitheatre Pkwy', N'', N'Mountain View', N'CA', N'USA', N'94043'), 
    (5, N'101', N'Parkway', N'', N'Gatlinburg', N'TN', N'USA', N'37738'),
    (6, N'150', N'4th Ave N', N'', N'Nashville', N'TN', N'USA', N'37219');
GO
--Creating the Artist table.
CREATE TABLE dbo.Artist
(
	ArtistID	INT	NOT NULL	PRIMARY KEY,
	Birthday DATE,
	ArtStyle NVARCHAR(20),
	LocationID INT NOT NULL,
	NameID	INT	NOT NULL, 
	FOREIGN KEY (NameID) REFERENCES dbo.Name(NameID),
	FOREIGN KEY (LocationID) REFERENCES dbo.Location(LocationID)
);
GO
--Populating data for the Artist table. 
INSERT INTO dbo.Artist 
([ArtistID], [Birthday], [ArtStyle], [LocationID], [NameID])
VALUES
    (1, '1977-01-13', N'painting', 1, 1),
    (2, '1981-09-04', N'singing', 2, 2),
    (3, '1948-12-31', N'disco', 3, 3),
    (4, '1966-05-16', N'music', 4, 4),
    (5, '1981-12-02', N'pop', 5, 5),
    (6, '1958-08-29', N'music', 6, 6);
GO
--Creating the Gallery table.
CREATE TABLE dbo.Gallery
(
	GalleryID	INT	NOT NULL	PRIMARY KEY,
	GalleryName	NVARCHAR(50) NOT NULL, 
	PhoneNumber	NVARCHAR(20)	NOT NULL
);
GO
--Populating data for the Gallery table.
INSERT INTO dbo.Gallery
	([GalleryID], [GalleryName], [PhoneNumber])
VALUES
	(1, N'Doghouse', N'(111)111-1111'),
    (2, N'Jacob', N'(222)222-2222'),
    (3, N'Flower', N'(333)333-3333'),
    (4, N'Beasley', N'(444)444-4444'),
    (5, N'Pottery House', N'(555)555-5555'),
    (6, N'Sonoma', N'(676)676-7676'),
    (7, N'Thomas Kincade', N'(777)777-7777'),
    (8, N'Vanderbilt', N'(888)888-8888'),
    (9, N'Chuck', N'(999)999-9999'),
    (10, N'Trolley Stop', N'(000)000-0000');
GO
--Creating the Artwork table.
CREATE TABLE dbo.Artwork
(
	ArtworkID	INT	NOT NULL	PRIMARY KEY,
	YearMade	SMALLINT NOT NULL, 
	ArtType	NVARCHAR(20)	NOT NULL,
	Price DECIMAL(10,2) NOT NULL,
	Title NVARCHAR(100) UNIQUE NOT NULL,
	ArtistID	INT	NOT NULL, 
	FOREIGN KEY (ArtistID) REFERENCES dbo.Artist(ArtistID)
);
GO
--Populating data for the Artwork table.
INSERT INTO dbo.Artwork ([ArtworkID], [YearMade], [ArtType], [Price], [Title], [ArtistID])
VALUES
    (1, 2012, N'painting', 7000000, N'Dog', 1), -- Matching ArtistID = 1
    (2, 1912, N'painting', 1952214, N'Dog1', 2), -- Matching ArtistID = 2
    (3, 1913, N'painting', 48141, N'Dog2', 3), -- Matching ArtistID = 3
    (4, 1894, N'lithograph', 232555, N'Dog3', 4), -- Matching ArtistID = 4
    (5, 1984, N'photograph', 876543, N'Dog4', 5), -- Matching ArtistID = 5
    (6, 1994, N'painting', 897653, N'Dog5', 6); -- Matching ArtistID = 6
GO
--Creating the Customer table.
CREATE TABLE dbo.Customer
(
    CustomerID INT NOT NULL PRIMARY KEY,
    TotalSpend DECIMAL(12, 2) NOT NULL,
    NameID INT NOT NULL,
    FOREIGN KEY (NameID) REFERENCES dbo.Name(NameID)
);
GO
--Populating data for the Customer table.
INSERT INTO dbo.Customer ([CustomerID], [TotalSpend], [NameID])
VALUES 
    (1, 9999.12, 10),
    (2, 1174.00, 9),
    (3, 121.00, 8),
    (4, 999.75, 7),
    (5, 10447895.23, 6),
    (6, 6718508.04, 5),
    (7, 752815.08, 4),
    (8, 9997709.29, 3),
    (9, 481.92, 2),
    (10, 300.44, 1);
GO
--Creating the CustomerAddress table.
CREATE TABLE dbo.CustomerAddress
(
    CustomerAddressID INT NOT NULL PRIMARY KEY, 
	LocationID INT NOT NULL,
	CustomerID INT NOT NULL,
    FOREIGN KEY (LocationID) REFERENCES dbo.Location(LocationID),
	FOREIGN KEY (CustomerID) REFERENCES dbo.Customer(CustomerID)
);
GO
--Populating data for the CustomerAddress table.
INSERT INTO dbo.CustomerAddress ([CustomerAddressID], [LocationID], [CustomerID])
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6); 
GO
--Creating the GalleryCustomer table.
CREATE TABLE dbo.GalleryCustomer
(
    CustomerID INT NOT NULL,
    GalleryID INT NOT NULL,
    NumberOfVisits SMALLINT,
    PRIMARY KEY (CustomerID, GalleryID),
    FOREIGN KEY (CustomerID) REFERENCES dbo.Customer(CustomerID),
    FOREIGN KEY (GalleryID) REFERENCES dbo.Gallery(GalleryID)
);
GO
--Populating data for the GalleryCustomer table.
INSERT INTO dbo.GalleryCustomer ([CustomerID], [GalleryID], [NumberOfVisits])
VALUES
    (1, 1, 14),
    (2, 2, 42),
    (3, 3, 17),
    (4, 4, 32),
    (5, 5, 36),
    (6, 6, 5),
    (7, 7, 12),
    (8, 8, 8),
    (9, 9, 20),
    (10, 10, 12345);
GO
--Creating the ArtGroup table.
CREATE TABLE dbo.ArtGroup
(
	ArtGroupID	INT NOT NULL PRIMARY KEY,
	GroupName	NVARCHAR(20)	NOT NULL
);
GO
--Populating data for the ArtGroup table.
INSERT INTO dbo.ArtGroup
	([ArtGroupID], [GroupName])
VALUES
	(1, N'sculpture'),
	(2, N'still'),
	(3, N'Picasso'),
	(4, N'18th century'),
	(5, N'portrait'),
	(6, N'portrait'),
	(7, N'sculpture'),
	(8, N'still'), 
	(9, N'Picasso'),
	(10, N'sculpture');
GO
--Creating the ArtworkGroup table.
CREATE TABLE dbo.ArtworkGroup
(
    ArtworkID INT NOT NULL,
    ArtGroupID INT NOT NULL,
    PRIMARY KEY (ArtworkID, ArtGroupID),
    FOREIGN KEY (ArtworkID) REFERENCES dbo.Artwork(ArtworkID),
    FOREIGN KEY (ArtGroupID) REFERENCES dbo.ArtGroup(ArtGroupID)
);
GO
--Populating data for the ArtworkGroup table.
INSERT INTO dbo.ArtworkGroup ([ArtworkID], [ArtGroupID])
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6);
GO

--Creating the GalleryArtist table.
CREATE TABLE dbo.GalleryArtist
(
    GalleryID INT NOT NULL,
    ArtistID INT NOT NULL,
    PRIMARY KEY (GalleryID, ArtistID),
    FOREIGN KEY (GalleryID) REFERENCES dbo.Gallery(GalleryID),
    FOREIGN KEY (ArtistID) REFERENCES dbo.Artist(ArtistID)
);
GO
--Populating data for the GalleryArtist table.
INSERT INTO dbo.GalleryArtist ([GalleryID], [ArtistID])
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6);
GO
--Creating the CustomerArtGroup table.
CREATE TABLE dbo.CustomerArtGroup
(
    CustomerID INT NOT NULL,
    ArtGroupID INT NOT NULL,
    PRIMARY KEY (CustomerID, ArtGroupID),
    FOREIGN KEY (CustomerID) REFERENCES dbo.Customer(CustomerID),
    FOREIGN KEY (ArtGroupID) REFERENCES dbo.ArtGroup(ArtGroupID)
);
GO
--Populating data for the CustomerArtGroup table.
INSERT INTO dbo.CustomerArtGroup ([CustomerID], [ArtGroupID])
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6); 
GO
--Creating the CustomerArtist table.
CREATE TABLE dbo.CustomerArtist
(
    CustomerID INT NOT NULL,
    ArtistID INT NOT NULL,
    PRIMARY KEY (CustomerID, ArtistID),
    FOREIGN KEY (CustomerID) REFERENCES dbo.Customer(CustomerID),
    FOREIGN KEY (ArtistID) REFERENCES dbo.Artist(ArtistID)
);
GO
--Populating data for the CustomerArtist table.
INSERT INTO dbo.CustomerArtist ([CustomerID], [ArtistID])
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6); 
GO

--Creating the GalleryArtwork table.
CREATE TABLE dbo.GalleryArtwork
(
    GalleryID INT NOT NULL,
    ArtworkID INT NOT NULL,
    PRIMARY KEY (GalleryID, ArtworkID),
    FOREIGN KEY (GalleryID) REFERENCES dbo.Gallery(GalleryID),
    FOREIGN KEY (ArtworkID) REFERENCES dbo.Artwork(ArtworkID)
);
GO
--Populating data for the GalleryArtwork table.
INSERT INTO dbo.GalleryArtwork ([GalleryID], [ArtworkID])
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6); 
GO
--Creating GalleryAddress table.
CREATE TABLE dbo.GalleryAddress
(
    GalleryAddressID INT NOT NULL PRIMARY KEY,
	LocationID INT NOT NULL, 
	GalleryID INT NOT NULL,
    FOREIGN KEY (LocationID) REFERENCES dbo.Location(LocationID),
	FOREIGN KEY (GalleryID) REFERENCES dbo.Gallery(GalleryID)
);
GO
--Populating data for the GalleryAddress table.
INSERT INTO dbo.GalleryAddress ([GalleryAddressID], [LocationID], [GalleryID])
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6); 
GO

--Selecting all customers who have spent more than $1000. 
SELECT * FROM dbo.Customer WHERE TotalSpend > 1000;

--Conducting an inner join to sum NumberOfVisits per customer across all galleries.
SELECT C.CustomerID, C.TotalSpend, C.NameID, SUM(GC.NumberOfVisits) AS TotalGalleryVisits
FROM dbo.Customer C
JOIN dbo.GalleryCustomer GC ON C.CustomerID = GC.CustomerID
GROUP BY C.CustomerID, C.TotalSpend, C.NameID;
--Conducting an inner join on customer and gallery customer to ascertain which customers have visited galleries more than ten times.
SELECT AVG(C.TotalSpend) AS AvgTotalSpend
FROM dbo.Customer C
JOIN dbo.GalleryCustomer GC ON C.CustomerID = GC.CustomerID
GROUP BY C.CustomerID
HAVING SUM(GC.NumberOfVisits) > 10;
--Conducting an innerjoin that combines the Artist and Artwork tables on ArtistID in order to count the number of pieces created by each artist.
SELECT AR.NameID, COUNT(A.ArtworkID) AS NumberOfArtworks
FROM dbo.Artist AR
JOIN dbo.Artwork A ON AR.ArtistID = A.ArtistID
GROUP BY AR.NameID;
--Conducting an inner join on Customer and GalleryCustomer on CustomerID to check which customers have visited all galleries.
SELECT C.CustomerID
FROM dbo.Customer C
JOIN dbo.GalleryCustomer GC ON C.CustomerID = GC.CustomerID
GROUP BY C.CustomerID
HAVING COUNT(DISTINCT GC.GalleryID) = (SELECT COUNT(*) FROM dbo.Gallery);
--Conducting a full other join of the Customer and GalleryCustomer tables to find out which customers haven't visited a gallery, or which galleries haven't had any customers.
SELECT C.CustomerID, G.GalleryID, GC.NumberOfVisits
FROM dbo.Customer C
FULL OUTER JOIN dbo.GalleryCustomer GC ON C.CustomerID = GC.CustomerID
FULL OUTER JOIN dbo.Gallery G ON GC.GalleryID = G.GalleryID;
