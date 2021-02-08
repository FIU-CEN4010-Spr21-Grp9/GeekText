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
CREATE FUNCTION [dbo].[udf_get_author_list](@bookID INT)
RETURNS VARCHAR(500)
AS
BEGIN
	DECLARE @return VARCHAR(500);
	SET @return = 'Gemcity, Tom E.';


	RETURN @return;
END
GO
