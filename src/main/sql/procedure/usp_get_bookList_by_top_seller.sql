USE [GeekText];
GO

IF EXISTS(SELECT * FROM sys.objects WHERE name = 'usp_get_bookList_by_top_seller')
BEGIN
	DROP PROCEDURE [dbo].[usp_get_bookList_by_top_seller];
END
GO

CREATE PROCEDURE [dbo].[usp_get_bookList_by_top_seller]
AS
BEGIN
/*
Title: usp_get_bookList_by_top_seller.sql
Desc: Create the get book list by top seller sp
Author: Shawn Welsh
History:
	2021-02-20 - SJW - Created

EXEC [dbo].[usp_get_bookList_by_top_seller];
*/

SET NOCOUNT ON;

DECLARE @top INT = 50;

DECLARE @results TABLE
(
	[bookID] INT PRIMARY KEY CLUSTERED
);

INSERT @results
SELECT TOP (@top) [bookID] FROM [dbo].[vw_book_detail];

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
INNER JOIN @results AS [res] ON [det].[bookID] = [res].[bookID]
ORDER BY [det].[bookID];

SET NOCOUNT OFF;

END
GO
