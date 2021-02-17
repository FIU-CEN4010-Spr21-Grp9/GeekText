USE [ETL];
GO

IF EXISTS(SELECT * FROM sys.objects WHERE name = 'goodreads_books')
BEGIN
	DROP TABLE [dbo].[goodreads_books];
END
GO

CREATE TABLE [dbo].[goodreads_books]
(
	[bookID] NVARCHAR(1000) NULL
	, [title] NVARCHAR(1000) NULL
	, [authors] NVARCHAR(1000) NULL
	, [average_rating] NVARCHAR(1000) NULL
	, [isbn] NVARCHAR(1000) NULL
	, [isbn13] NVARCHAR(1000) NULL
	, [language_code] NVARCHAR(1000) NULL
	, [num_pages] NVARCHAR(1000) NULL
	, [ratings_count] NVARCHAR(1000) NULL
	, [text_reviews_count] NVARCHAR(1000) NULL
	, [publication_date] NVARCHAR(1000) NULL
	, [publisher] NVARCHAR(1000) NULL
);
GO

TRUNCATE TABLE [dbo].[goodreads_books];
GO

BULK INSERT [dbo].[goodreads_books] FROM 'U:\wwwroot\data\goodreads\books.csv' WITH ( FIRSTROW = 2, DATAFILETYPE='char', FIELDTERMINATOR='0x2C', ROWTERMINATOR='0x0A' ); --FORMAT = 'csv'
GO

SELECT TOP 100 * FROM [dbo].[goodreads_books] ORDER BY [title]
GO

/*

-- SELECT * FROM [dbo].[goodreads_books] ORDER BY [publication_date]

DECLARE @c INT
	, @m INT
	, @dateTest DATETIME
	, @isbnTest BIGINT
	, @isbn13Test BIGINT;

DECLARE @results TABLE
(
	[ID] INT IDENTITY
	, [bookID] VARCHAR(1000)
	, [publication_date] VARCHAR(1000)
	, [isbn] VARCHAR(1000)
	, [isbn13] VARCHAR(1000)
);

INSERT @results
SELECT [bookID], [publication_date], [isbn], [isbn13]
FROM [dbo].[goodreads_books]
ORDER BY [bookID];

SET @c = 1;
SELECT @m = COUNT(*) FROM @results;

WHILE(@c <= @m)
BEGIN
	BEGIN TRY
		SELECT @dateTest = CAST([publication_date] AS DATETIME)
		FROM @results
		WHERE [ID] = @c;
	END TRY
	BEGIN CATCH
		SELECT [bookID], [publication_date]
		FROM @results
		WHERE [ID] = @c;
	END CATCH

	BEGIN TRY
		SELECT @isbnTest = CAST([isbn] AS BIGINT)
		FROM @results
		WHERE [ID] = @c;
	END TRY
	BEGIN CATCH
		SELECT [bookID], [isbn]
		FROM @results
		WHERE [ID] = @c;
	END CATCH

	BEGIN TRY
		SELECT @isbn13Test = CAST([isbn13] AS BIGINT)
		FROM @results
		WHERE [ID] = @c;
	END TRY
	BEGIN CATCH
		SELECT [bookID], [isbn13]
		FROM @results
		WHERE [ID] = @c;
	END CATCH

	SET @c = @c + 1;
END

*/

