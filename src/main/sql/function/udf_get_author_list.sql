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

SELECT [dbo].[udf_get_author_list](1)

*/
CREATE FUNCTION [dbo].[udf_get_author_list](@bookID INT)
RETURNS VARCHAR(500)
AS
BEGIN
	DECLARE @return VARCHAR(1000)
		, @authorName VARCHAR(200)
		, @c INT
		, @m INT;

	SET @return = '';

	DECLARE @result TABLE
	(
		[ID] INT IDENTITY
		, [authorName] VARCHAR(200)
	);

	INSERT @result
	SELECT DISTINCT [ath].[authorName]
	FROM [dbo].[book_author] AS [ba1]
	INNER JOIN [dbo].[author] AS [ath] ON [ba1].[authorID] = [ath].[authorID]
	WHERE [bookID] = @bookID
	ORDER BY [authorName];

	SET @c = 1;
	SELECT @m = COUNT(*) FROM @result;

	IF(@m < 1)
	BEGIN
		SET @return = 'N/A';
	END
	IF(@m = 1)
	BEGIN
		SELECT @return = [authorName] FROM @result WHERE [ID] = 1;
	END
	ELSE
	BEGIN
		WHILE(@c <= @m)
		BEGIN
			SELECT @authorName = [authorName]
			FROM @result
			WHERE [ID] = @c;
			
			IF(@c = 1)
			BEGIN
				SET @return = @authorName
			END
			ELSE
			BEGIN
				SET @return = @return + '; ' + @authorName
			END

			SET @c = @c + 1;
		END
	END

	RETURN @return;
END
GO
