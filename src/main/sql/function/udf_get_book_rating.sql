IF EXISTS(SELECT * FROM sys.objects WHERE name = 'udf_get_book_rating')
BEGIN
	DROP FUNCTION [dbo].[udf_get_book_rating];
END
GO
/*
Title: udf_get_book_rating.sql
Desc: Create the udf_get_book_rating function to aggregate all book ratings into a score for the app
Author: Shawn Welsh
Params: INT bookID
Return: Numeric value for star rating out of 5
History:
	2021-02-08 - SJW - Created

-- SELECT * FROM [dbo].[udf_get_book_rating]()
*/
CREATE FUNCTION [dbo].[udf_get_book_rating]() --@bookID INT)
RETURNS TABLE
AS
RETURN
	SELECT [bk1].[bookID]
		, CAST(AVG([rev].[rating]) AS NUMERIC(2,1)) AS [rating]
	FROM [dbo].[book] AS [bk1]
	LEFT JOIN [dbo].[book_review] AS [rev] ON [bk1].[bookID] = [rev].[bookID]
	--WHERE [bk1].[bookID] = @bookID
	--	OR [bk1].[bookID] IS NULL
	GROUP BY [bk1].[bookID];
GO
