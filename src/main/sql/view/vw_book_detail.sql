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
	, [gnr].[genreList]
	, [bk].[price]
	, [bk].[description]
	, ISNULL([rat].[rating], 0) AS [rating]
	, [ath].[authorList]
	, [bk].[isbn]
	, [bk].[isbn13]
	, [cv].[image_url] AS [cover_url]
FROM [dbo].[book] AS [bk]
INNER JOIN [dbo].[publisher] AS [pb] ON [bk].[publisherID] = [pb].[publisherID]
LEFT JOIN [dbo].[book_cover] AS [cv] ON [bk].[bookID] = [cv].[bookID]
LEFT JOIN [dbo].[udf_get_book_rating]() AS [rat] ON [bk].[bookID] = [rat].[bookID]
LEFT JOIN [dbo].[udf_get_author_list]() AS [ath] ON [bk].[bookID] = [ath].[bookID]
LEFT JOIN [dbo].[udf_get_genre_list]() AS [gnr] ON [bk].[bookID] = [gnr].[bookID]

