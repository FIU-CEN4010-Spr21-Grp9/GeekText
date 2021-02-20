IF EXISTS(SELECT * FROM sys.objects WHERE name = 'google_books_1299')
BEGIN
	DROP TABLE [dbo].[google_books_1299];
END
GO

CREATE TABLE [dbo].[google_books_1299]
(
	[id] VARCHAR(1000) NULL
	, [title] VARCHAR(1000) NULL
	, [author] VARCHAR(1000) NULL
	, [rating] VARCHAR(1000) NULL
	, [voters] VARCHAR(1000) NULL
	, [price] VARCHAR(1000) NULL
	, [currency] VARCHAR(1000) NULL
	, [description] VARCHAR(5000) NULL
	, [publisher] VARCHAR(1000) NULL
	, [page_count] VARCHAR(1000) NULL
	, [generes] VARCHAR(1000) NULL
	, [ISBN] VARCHAR(1000) NULL
	, [language] VARCHAR(1000) NULL
	, [published_date] VARCHAR(1000) NULL
);
GO

TRUNCATE TABLE [dbo].[google_books_1299];
GO

BULK INSERT [dbo].[google_books_1299] FROM 'C:\wwwroot\data\google_books_1299.csv' WITH ( FORMAT = 'csv', FIRSTROW = 2 );
GO

