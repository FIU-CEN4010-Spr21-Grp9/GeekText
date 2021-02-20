USE [GeekText];
GO

IF EXISTS(SELECT * FROM sys.objects WHERE name = 'usp_get_bookList_by_top_sellers')
BEGIN
	DROP PROCEDURE [dbo].[usp_get_bookList_by_top_sellers];
END
GO

CREATE PROCEDURE [dbo].[usp_get_bookList_by_top_sellers]
AS
BEGIN
/*
Title: usp_get_bookList_by_top_sellers.sql
Desc: Create the get book list by top sellers SP
Author: Shawn Welsh
History:
	2021-02-19 - SJW - Created

EXEC [dbo].[usp_get_bookList_by_top_sellers]
*/

SET NOCOUNT ON;

-- TO DO - crerate top sellers list or populate purchase table to aggregate

SELECT TOP 10 [det].[bookID]
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
ORDER BY [det].[bookID];

SET NOCOUNT OFF;

END
GO
