USE [GeekText];
GO

IF EXISTS(SELECT * FROM sys.objects WHERE name = 'usp_get_bookList_by_rating')
BEGIN
	DROP PROCEDURE [dbo].[usp_get_bookList_by_rating];
END
GO

CREATE PROCEDURE [dbo].[usp_get_bookList_by_rating]
(
	@rating TINYINT
)
AS
BEGIN
/*
Title: usp_get_bookList_by_rating.sql
Desc: Create the get book list by rating sp
Author: Shawn Welsh
History:
	2021-02-19 - SJW - Created

EXEC [dbo].[usp_get_bookList_by_rating] 1
*/

SET NOCOUNT ON;

DECLARE @ratingNum NUMERIC(2,1) = @rating;

SELECT [det].[bookID]
	, [det].[title]
	, [det].[publishDate]
	, [det].[publisherName]
	, [det].[genreList]
	, [det].[price]
	, [det].[description]
	, [det].[rating]
	, [det].[authorList]
	, [det].[isbn]
	, [det].[isbn13]
	, [det].[cover_url]
FROM [dbo].[vw_book_detail] AS [det]
WHERE [det].[rating] >= @ratingNum
ORDER BY [det].[bookID];

SET NOCOUNT OFF;

END
GO
