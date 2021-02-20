IF EXISTS(SELECT * FROM sys.objects WHERE name = 'udf_get_author_list')
BEGIN
	DROP FUNCTION [dbo].[udf_get_author_list];
END
GO
/*
Title: udf_get_author_list.sql
Desc: Create the udf_get_author_list function to put all the author names into one string
Author: Shawn Welsh
Params: INT bookID
Return: String VARCHAR value of author names
History:
	2021-02-08 - SJW - Created

*/
/*

SELECT * FROM [dbo].[udf_get_author_list]()

*/
CREATE FUNCTION [dbo].[udf_get_author_list]() --@bookID INT)
RETURNS TABLE
AS
RETURN
	SELECT [bk].[bookID]
		, STUFF(( SELECT '/' + [at].[authorName] AS [text()]
					FROM [dbo].[book_author] AS [ba]
					LEFT JOIN [dbo].[author] AS [at] ON [ba].[authorID] = [at].[authorID]
					WHERE [ba].[bookID] = [bk].[bookID]
					ORDER BY [ba].[order]
					FOR XML PATH('') -- Select it as XML
					), 1, 1, '' )
		AS [authorList]
	FROM [dbo].[book] AS [bk];
GO
