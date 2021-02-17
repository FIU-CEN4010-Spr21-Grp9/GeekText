USE [ETL];
GO

-- PUBLISHER --
INSERT INTO [dbo].[publisher] ([publisherName])
VALUES ('N/A');
GO

INSERT INTO [dbo].[publisher] ([publisherName])
SELECT DISTINCT [publisher]
FROM [dbo].[goodreads_books_clean]
WHERE [publisher] IS NOT NULL
ORDER BY [publisher];
GO

-- GENRE --
INSERT INTO [dbo].[genre] ([genreName])
SELECT DISTINCT [category] AS [genreName]
FROM [dbo].[amazon_books_clean]
ORDER BY [category];
GO

-- AUTHOR --
INSERT INTO [dbo].[author] ([authorName])
SELECT DISTINCT RTRIM([author]) AS [author]
FROM
(
	SELECT [author] FROM [dbo].[goodreads_books_clean_authors]
	UNION
	SELECT [author] FROM [dbo].[amazon_books_clean]
) AS [ir1]
WHERE [author] IS NOT NULL
ORDER BY [author];
GO

-- BOOK --
INSERT INTO [dbo].[book]
SELECT DISTINCT [title]
	, [publishDate]
	, [publisherID]
	, [price]
	, [description]
	, [isbn]
	, [isbn13]
FROM
(
	SELECT [gb1].[title]
		, [gb1].[publication_date] AS [publishDate]
		, [pub].[publisherID]
		, 0.99 AS [price]
		, 'N/A' AS[description]
		, [gb1].[isbn]
		, [gb1].[isbn13]
	FROM [dbo].[goodreads_books_clean] AS [gb1]
	INNER JOIN [dbo].[publisher] AS [pub] ON [gb1].[publisher] = [pub].[publisherName]
	UNION
	SELECT [ab1].[title]
		, NULL AS [publishDate]
		, (SELECT [publisherID] FROM [dbo].[publisher] WHERE [publisherName] = 'N/A') AS [publisherID]
		, 0.99 AS [price]
		, 'N/A' AS[description]
		, [ab1].[isbn]
		, NULL AS [isbn13]
	FROM [dbo].[amazon_books_clean] AS [ab1]
) AS [ir1]
ORDER BY [title];

-- BOOK_COVER --
INSERT [dbo].[book_cover]
SELECT DISTINCT [bk1].[bookID]
	, [img].[image_url]
FROM [dbo].[amazon_books_clean] AS [img]
INNER JOIN [dbo].[book] AS [bk1] ON [img].[isbn] = [bk1].[isbn]

-- BOOK_AUTHOR --
-- TRUNCATE TABLE [dbo].[book_author];
-- *** TO DO, FIX DUPLICATES IN [dbo].[goodreads_books_clean_authors] *** --
INSERT INTO [dbo].[book_author]
SELECT DISTINCT [ir2].[bookID]
	, [ir2].[authorID]
	, CASE
		WHEN [ord].[order] IS NOT NULL
			THEN [ord].[order]
		ELSE 99
	END AS [order]
FROM
(
	SELECT DISTINCT
		[ir1].[bookID]
		, [ath].[authorID]
		, [ath].[authorName]
	FROM
	(
		SELECT [bk1].[bookID]
			, [gba].[author]AS [authorName]
			--, [gba].[order]
		FROM [dbo].[book] AS [bk1]
		INNER JOIN [dbo].[goodreads_books_clean] AS [gbc] ON [bk1].[isbn] = [gbc].[isbn]
		INNER JOIN [dbo].[goodreads_books_clean_authors] AS [gba] ON [gbc].[bookID] = [gba].[bookID]
		UNION
		SELECT [bk1].[bookID]
			, [abc].[author] AS [authorName]
			--, 1 AS [order]
		FROM [dbo].[book] AS [bk1]
		INNER JOIN [dbo].[amazon_books_clean] AS [abc] ON [bk1].[isbn] = [abc].[isbn]
	) AS [ir1]
	INNER JOIN [dbo].[author] AS [ath] ON [ir1].[authorName] = [ath].[authorName]
) AS [ir2]	
LEFT JOIN [dbo].[goodreads_books_clean_authors] AS [ord] ON [ir2].[authorName] = [ord].[author]


-- BOOK_GENRE --

