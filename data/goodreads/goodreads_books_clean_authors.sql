USE [ETL];
GO

IF EXISTS(SELECT * FROM sys.objects WHERE name = 'goodreads_books_clean_authors')
BEGIN
	DROP TABLE [dbo].[goodreads_books_clean_authors];
END
GO

CREATE TABLE [dbo].[goodreads_books_clean_authors]
(
	[bookID] INT
	, [author] VARCHAR(200)
);
GO

INSERT INTO [dbo].[goodreads_books_clean_authors]
SELECT [bookID], value AS [author]
FROM [dbo].[goodreads_books]
CROSS APPLY STRING_SPLIT([authors], '/')
WHERE [bookID] NOT IN
	(
		SELECT [bookID]--, [authors]
		FROM
		(
			SELECT [bookID], REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([authors],' ', ''),'.',''),'''',''),'-',''),'/','') AS [authors]
			FROM
			(
				SELECT DISTINCT [bookID], [authors]
				FROM [dbo].[goodreads_books]
				--WHERE [authors] NOT LIKE '%/%'
			) AS [nd]
		) AS [nc]
		WHERE [authors] LIKE '%[^a-Z0-9]%'
	)