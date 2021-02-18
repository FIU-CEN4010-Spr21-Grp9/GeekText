IF EXISTS(SELECT * FROM sys.objects WHERE name = 'udf_get_genre_list')
BEGIN
	DROP FUNCTION [dbo].[udf_get_genre_list];
END
GO
/*
Title: udf_get_genre_list.sql
Desc: Create the udf_get_genre_list function to put all the genre names into one string
genre: Shawn Welsh
Params: INT bookID
Return: String VARCHAR value of genre names
History:
	2021-02-18 - SJW - Created

SELECT * FROM [dbo].[udf_get_genre_list]()
*/
CREATE FUNCTION [dbo].[udf_get_genre_list]() --@bookID INT)
RETURNS TABLE
AS
RETURN
	SELECT [bk].[bookID]
		, STUFF(( SELECT '/' + [gr].[genreName] AS [text()]
					FROM [dbo].[book_genre] AS [bg]
					LEFT JOIN [dbo].[genre] AS [gr] ON [bg].[genreID] = [gr].[genreID]
					WHERE [bg].[bookID] = [bk].[bookID]
					ORDER BY [gr].[genreName]
					FOR XML PATH('') -- Select it as XML
					), 1, 1, '' )
		AS [genreList]
	FROM [dbo].[book] AS [bk];
GO
