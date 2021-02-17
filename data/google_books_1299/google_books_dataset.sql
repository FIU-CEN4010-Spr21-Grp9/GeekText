IF EXISTS(SELECT * FROM sys.objects WHERE name = 'google_books_dataset')
BEGIN
	DROP TABLE [dbo].[google_books_dataset];
END
GO

CREATE TABLE [dbo].[google_books_dataset]
(
	[id] VARCHAR(1000) NULL
	, [title] VARCHAR(1000) NULL
	, [authors] VARCHAR(1000) NULL
	, [language] VARCHAR(1000) NULL
	, [categories] VARCHAR(1000) NULL
	, [averageRating] VARCHAR(1000) NULL
	, [maturityRating] VARCHAR(1000) NULL
	, [publisher] VARCHAR(1000) NULL
	, [publishedDate] VARCHAR(1000) NULL
	, [pageCount] VARCHAR(1000) NULL
);
GO

TRUNCATE TABLE [dbo].[google_books_dataset];
GO

BULK INSERT [dbo].[google_books_dataset] FROM 'C:\wwwroot\data\google_books_dataset.csv' WITH ( FORMAT = 'csv', FIRSTROW = 2 );
GO

