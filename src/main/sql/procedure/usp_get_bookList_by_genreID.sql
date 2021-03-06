USE [GeekText];
GO

IF EXISTS(SELECT * FROM sys.objects WHERE name = 'usp_get_bookList_by_genreID')
BEGIN
	DROP PROCEDURE [dbo].[usp_get_bookList_by_genreID];
END
GO

CREATE PROCEDURE [dbo].[usp_get_bookList_by_genreID]
(
	@genreID INT = NULL
)
AS
BEGIN
/*
Title: usp_get_bookList_by_genreID.sql
Desc: Create the get book list by genre ID sp
Author: Shawn Welsh
History:
	2021-02-19 - SJW - Created

EXEC [dbo].[usp_get_bookList_by_genreID] @genreID = 1;

*/

SET NOCOUNT ON;

DECLARE @bookIDs TABLE
(
	[bookID] INT PRIMARY KEY
);

IF(@genreID IS NULL)
BEGIN
	INSERT @bookIDs
	SELECT [bookID]
	FROM [dbo].[book]
	ORDER BY [bookID];
END
ELSE
BEGIN
	INSERT @bookIDs
	SELECT [bookID]
	FROM [dbo].[book_genre]
	WHERE [genreID] = @genreID
	ORDER BY [bookID];
END

SELECT [det].[bookID]
	, [det].[title]
	, CAST([det].[publishDate] AS DATE) AS [publish_date]
	, [det].[publisherName] AS [publisher]
	, [det].[genreList] AS [genre_list]
	, [det].[price]
	, [det].[description]
	, [det].[rating]
	, [det].[authorList] AS [author_list]
	, [det].[isbn]
	, [det].[isbn13]
	, [det].[cover_url]
FROM [dbo].[vw_book_detail] AS [det]
INNER JOIN @bookIDs AS [lst] ON [det].[bookID] = [lst].[bookID]
ORDER BY [det].[bookID];

SET NOCOUNT OFF;

END
GO
