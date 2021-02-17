
SELECT DISTINCT
	[b32].[title]
	, [b32].[author]
	, [b32].[category]
	, [b32].[image url]
	--, [gb1].[price]
	--, [gb1].[publisher]
	--, [gb1].[description]
FROM dbo.[amazon_books] AS b32
INNER JOIN dbo.goodreads_books AS gb1 ON b32.title = gb1.title
	AND b32.author = gb1.authors
ORDER BY [b32].[category]
	, [b32].[author]


SELECT *
FROM dbo.[amazon_books] AS b32
INNER JOIN
(
	SELECT title
		, author
		, COUNT(*) AS count_ta
	FROM dbo.[amazon_books]
	GROUP BY title
		, author
	HAVING COUNT(*) > 1
) AS [gc] ON b32.title = [gc].title
	AND b32.author = [gc].author
ORDER BY b32.title
	, b32.author

SELECT *
FROM [dbo].[goodreads_books_clean] AS [gbc]
INNER JOIN [dbo].[goodreads_books_clean_authors] AS [gba] ON [gbc].[bookID] = [gba].[bookID]

SELECT DISTINCT [author]
FROM [dbo].[goodreads_books_clean_authors]
ORDER BY [author]


SELECT *
FROM [dbo].[amazon_books_clean] AS [abc]
LEFT JOIN [dbo].[goodreads_books_clean] AS [gbc]
	ON
	(
		[abc].[isbn] = [gbc].[isbn]
		OR [abc].[title] = [gbc].[title]
	)
--WHERE [gbc].[bookID] IS NULL

/*

INSERT INTO [dbo].[publisher] ([publisherName])
SELECT DISTINCT [publisher]
FROM [dbo].[goodreads_books_clean]
WHERE [publisher] IS NOT NULL
ORDER BY [publisher]

INSERT INTO [dbo].[genre] ([genreName])
SELECT DISTINCT [category] AS [genreName]
FROM [dbo].[amazon_books_clean]
ORDER BY [category];

SELECT DISTINCT [author]
FROM
(
	SELECT [author] FROM [dbo].[goodreads_books_clean_authors]
	UNION
	SELECT [author] FROM [dbo].[amazon_books_clean]
) AS [ir1]
WHERE [author] IS NOT NULL
ORDER BY [author]


*/
