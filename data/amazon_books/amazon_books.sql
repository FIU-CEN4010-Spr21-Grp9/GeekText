USE [ETL];
GO

IF EXISTS(SELECT * FROM sys.objects WHERE name = 'amazon_books')
BEGIN
	DROP TABLE [dbo].[amazon_books];
END
GO

CREATE TABLE [dbo].[amazon_books]
(
	[AMAZON INDEX (ASIN)] VARCHAR(1000) NULL
	, [FILENAME] VARCHAR(1000) NULL
	, [IMAGE URL] VARCHAR(1000) NULL
	, [TITLE] VARCHAR(1000) NULL
	, [AUTHOR] VARCHAR(1000) NULL
	, [CATEGORY ID] VARCHAR(1000) NULL
	, [CATEGORY] VARCHAR(1000) NULL
);
GO

TRUNCATE TABLE [dbo].[amazon_books];
GO

BULK INSERT [dbo].[amazon_books] FROM 'U:\wwwroot\data\amazon_books\Task2\book32-listing.csv' WITH ( FORMAT = 'csv', FIRSTROW = 1 );
GO

SELECT TOP 100 * FROM [dbo].[amazon_books]
GO
