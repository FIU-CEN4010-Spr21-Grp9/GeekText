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
	, [order] INT NULL
);
GO

INSERT INTO [dbo].[goodreads_books_clean_authors]
SELECT DISTINCT [bookID]
	, value AS [author]
	, ROW_NUMBER() OVER (PARTITION BY [bookID] ORDER BY CHARINDEX(value,[authors])) AS [order]
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
ORDER BY [bookID]
	, [value]
GO

DELETE [gba]
FROM [dbo].[goodreads_books_clean_authors] AS [gba]
INNER JOIN
(
	SELECT [gba].[bookID]
		, [gba].[author]
		, MIN([gba].[order]) AS [minOrder]
	FROM [dbo].[goodreads_books_clean_authors] AS [gba]
	INNER JOIN
	(
		SELECT [bookID]
			, [author]
			, COUNT(*) AS [cnt]
		FROM [dbo].[goodreads_books_clean_authors]
		GROUP BY [bookID]
			, [author]
		HAVING COUNT(*) > 1
	) AS [dup] ON [gba].[bookID] = [dup].[bookID]
		AND [gba].[author] = [dup].[author]
	GROUP BY [gba].[bookID]
		, [gba].[author]
) AS [min] ON [gba].[bookID] = [min].[bookID]
	AND [gba].[author] = [min].[author]
	--AND [gba].[order] = [min].[minOrder]
WHERE [gba].[order] != [min].[minOrder]
