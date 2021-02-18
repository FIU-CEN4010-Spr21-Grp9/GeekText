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
VALUES ('N/A');
GO
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
		, [ir1].[isbn]
		, [ath].[authorID]
		, [ath].[authorName]
	FROM
	(
		SELECT DISTINCT [bk1].[bookID]
			, [bk1].[isbn]
			, [gba].[author]AS [authorName]
			--, [gba].[order]
		FROM [dbo].[book] AS [bk1]
		INNER JOIN [dbo].[goodreads_books_clean] AS [gbc] ON [bk1].[isbn] = [gbc].[isbn]
		INNER JOIN [dbo].[goodreads_books_clean_authors] AS [gba] ON [gbc].[bookID] = [gba].[bookID]
		UNION
		SELECT [bk1].[bookID]
			, [bk1].[isbn]
			, [abc].[author] AS [authorName]
			--, 1 AS [order]
		FROM [dbo].[book] AS [bk1]
		INNER JOIN [dbo].[amazon_books_clean] AS [abc] ON [bk1].[isbn] = [abc].[isbn]
	) AS [ir1]
	INNER JOIN [dbo].[author] AS [ath] ON [ir1].[authorName] = [ath].[authorName]
) AS [ir2]
LEFT JOIN [dbo].[goodreads_books_clean] AS [gbc] ON [ir2].[isbn] = [gbc].[isbn]
LEFT JOIN [dbo].[goodreads_books_clean_authors] AS [ord] ON [ir2].[authorName] = [ord].[author]
	AND [gbc].[bookID] = [ord].[bookID]


-- BOOK_GENRE --
INSERT INTO [dbo].[book_genre]
SELECT DISTINCT
	[genreID]
	, [bookID]
FROM
(
	SELECT DISTINCT [bk1].[bookID]
		, [gnr].[genreID]
	FROM [dbo].[amazon_books_clean] AS [abc]
	INNER JOIN [dbo].[genre] AS [gnr] ON [abc].[category] = [gnr].[genreName]
	INNER JOIN [dbo].[book] AS [bk1] ON [abc].[isbn] = [bk1].[isbn]
	UNION
	SELECT DISTINCT [bk1].[bookID]
		, (SELECT [genreID] FROM [dbo].[genre] WHERE [genreName] = 'N/A') AS [genreID]
	FROM [dbo].[goodreads_books_clean] AS [gbc]
	INNER JOIN [dbo].[book] AS [bk1] ON [gbc].[isbn] = [bk1].[isbn]
) AS [ir1];
GO

----------------------------------------
USE [GeekText];
GO

-- AUTHOR --
SET IDENTITY_INSERT [dbo].[author] ON;
GO

INSERT INTO [dbo].[author] ([authorID], [authorName])
SELECT [authorID], [authorName]
FROM [ETL].[dbo].[author]
ORDER BY [authorID];
GO

SET IDENTITY_INSERT [dbo].[author] OFF;
GO

-- GENRE --
SET IDENTITY_INSERT [dbo].[genre] ON;
GO

INSERT INTO [dbo].[genre] ([genreID], [genreName])
SELECT [genreID], [genreName]
FROM [ETL].[dbo].[genre]
ORDER BY [genreID];
GO

SET IDENTITY_INSERT [dbo].[genre] OFF;
GO

-- PUBLISHER --
SET IDENTITY_INSERT [dbo].[publisher] ON;
GO

INSERT INTO [dbo].[publisher] ([publisherID], [publisherName])
SELECT [publisherID], [publisherName]
FROM [ETL].[dbo].[publisher]
ORDER BY [publisherID];
GO

SET IDENTITY_INSERT [dbo].[publisher] OFF;
GO

-- BOOK --
SET IDENTITY_INSERT [dbo].[book] ON;
GO

INSERT INTO [dbo].[book]
(
	[bookID]
	, [title]
	, [publishDate]
	, [publisherID]
	, [price]
	, [description]
	, [isbn]
	, [isbn13]
)
SELECT [bookID]
	, [title]
	, [publishDate]
	, [publisherID]
	, [price]
	, [description]
	, [isbn]
	, [isbn13]
FROM [ETL].[dbo].[book]
ORDER BY [bookID];
GO

SET IDENTITY_INSERT [dbo].[book] OFF;
GO

-- BOOK_AUTHOR --
INSERT INTO [dbo].[book_author] ([bookID], [authorID], [order])
SELECT [bookID], [authorID], [order]
FROM [ETL].[dbo].[book_author]
ORDER BY [bookID], [authorID];
GO

-- BOOK_COVER --
SET IDENTITY_INSERT [dbo].[book_cover] ON;
GO

INSERT INTO [dbo].[book_cover] ([coverID], [bookID], [image_url])
SELECT [coverID], [bookID], [image_url]
FROM [ETL].[dbo].[book_cover]
ORDER BY [coverID];
GO

SET IDENTITY_INSERT [dbo].[book_cover] OFF;
GO

-- BOOK_GENRE --
INSERT INTO [dbo].[book_genre] ([bookID], [genreID])
SELECT [bookID], [genreID]
FROM [ETL].[dbo].[book_genre]
ORDER BY [bookID], [genreID];
GO

