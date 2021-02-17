USE [ETL];
GO

IF EXISTS(SELECT * FROM sys.objects WHERE name = 'goodreads_books_clean')
BEGIN
	DROP TABLE [dbo].[goodreads_books_clean];
END
GO

CREATE TABLE [dbo].[goodreads_books_clean]
(
	[bookID] INT NULL
	, [title] VARCHAR(1000) NULL
	--, [authors] VARCHAR(1000) NULL
	, [isbn] CHAR(10) NULL
	, [isbn13] BIGINT NULL
	, [publication_date] DATETIME NULL
	, [publisher] VARCHAR(200) NULL
);
GO

TRUNCATE TABLE [dbo].[goodreads_books_clean];
GO

-- SELECT * FROM [dbo].[goodreads_books]

INSERT INTO [dbo].[goodreads_books_clean]
SELECT CAST([res].[bookID] AS INT) [bookID]
	, [res].[title]
	--, [res].[authors]
	, [res].[isbn]
	, CAST([res].[isbn13] AS BIGINT) AS [isbn13]
	, CAST([res].[publication_date] AS DATETIME) AS [publication_date]
	, [res].[publisher]
FROM [dbo].[goodreads_books] AS [res]
INNER JOIN
(
	SELECT [title]
		, [authors]
		, MAX([publication_date]) AS [publication_date]
	FROM
	(
		SELECT [bookID]
			, [title]
			, CASE
				WHEN [authors] LIKE '%/%'
					THEN SUBSTRING([authors],1,(PATINDEX('%/%',[authors])-1))
				ELSE [authors]
			END AS [authors]
			, [average_rating]
			, [isbn]
			, [isbn13]
			, [language_code]
			, [num_pages]
			, [ratings_count]
			, [text_reviews_count]
			, CAST([publication_date] AS DATETIME) AS [publication_date]
			--, [publication_date]
			, [publisher]
		FROM [dbo].[goodreads_books]
		WHERE [num_pages] > 0
	) AS [na]
	GROUP BY [title]
		, [authors]
) AS [uq] ON [res].[title] = [uq].[title]
	AND CAST([res].[publication_date] AS DATETIME) = [uq].[publication_date]
WHERE [res].[language_code] LIKE '%en%';
GO

SELECT * FROM [dbo].[goodreads_books_clean]

