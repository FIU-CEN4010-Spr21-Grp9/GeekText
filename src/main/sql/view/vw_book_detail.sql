IF EXISTS(SELECT * FROM sys.views WHERE name = 'vw_book_detail')
BEGIN
	DROP VIEW [dbo].[vw_book_detail];
END
GO
/*
Title: vw_book_detail.sql
Desc: Create the vw_book_detail view
Author: Shawn Welsh
History:
	2021-02-08 - SJW - Created

*/
CREATE VIEW [dbo].[vw_book_detail]
AS
SELECT [bk].[bookID]
	, [bk].[title]
	, [bk].[publishDate]
	, [pb].[publisherName]
	, [gn].[genreName]
	, [gn].[genreDescription]
	, [bk].[price]
	, [bk].[description]
	, [dbo].[udf_get_book_rating]([bk].[bookID]) AS [avgRating]
	, [dbo].[udf_get_author_list]([bk].[bookID]) AS [authorList]
FROM [dbo].[book] AS [bk]
INNER JOIN [dbo].[publisher] AS [pb] ON [bk].[publisherID] = [pb].[publisherID]
INNER JOIN [dbo].[genre] AS [gn] ON [bk].[genreID] = [gn].[genreID]
