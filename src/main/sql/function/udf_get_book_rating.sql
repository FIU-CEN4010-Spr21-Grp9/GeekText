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

*/
CREATE FUNCTION [dbo].[udf_get_book_rating](@bookID INT)
RETURNS NUMERIC(2,1)
AS
BEGIN
	DECLARE @return NUMERIC(2,1) = 5.0;
	
	RETURN @return;
END
GO
