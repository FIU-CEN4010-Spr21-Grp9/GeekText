USE [ETL];
GO

IF EXISTS(SELECT * FROM sys.objects WHERE name = 'amazon_books_clean')
BEGIN
	DROP TABLE [dbo].[amazon_books_clean];
END
GO

CREATE TABLE [dbo].[amazon_books_clean]
(
	[asin] VARCHAR(20)
	, [filename] VARCHAR(50)
	, [image_url] VARCHAR(1000)
	, [title] VARCHAR(500)
	, [author] VARCHAR(1000) NULL
	, [category] VARCHAR(200)
	, [isbn] CHAR(10) NULL
);
GO

TRUNCATE TABLE [dbo].[amazon_books_clean];
GO

INSERT [dbo].[amazon_books_clean]
SELECT [AMAZON INDEX (ASIN)] AS [asin]
	, [filename]
	, [IMAGE URL] AS [image_url]
	, [title]
	, [author]
	, [category]
	, REPLACE([FILENAME],'.jpg','') AS [isbn]
FROM [dbo].[amazon_books] AS [ab1]
WHERE [AMAZON INDEX (ASIN)] NOT IN
(
	SELECT [AMAZON INDEX (ASIN)]
	-- SELECT [AMAZON INDEX (ASIN)], [author]
	FROM
	(
		SELECT [AMAZON INDEX (ASIN)]
			, REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([author],' ', ''),'.',''),'''',''),'-',''),'/','') AS [author]
		FROM
		(
			SELECT DISTINCT [AMAZON INDEX (ASIN)], [author]
			FROM [dbo].[amazon_books]
			--WHERE [authors] NOT LIKE '%/%'
		) AS [nd]
	) AS [nc]
	WHERE [author] LIKE '%[^a-Z0-9]%'
		AND [author] IS NOT NULL
		AND LEN([author]) > 1
);
GO

SELECT TOP 100 * FROM [dbo].[amazon_books_clean]
GO
