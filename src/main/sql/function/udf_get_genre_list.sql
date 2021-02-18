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

*/
CREATE FUNCTION [dbo].[udf_get_genre_list](@bookID INT)
RETURNS VARCHAR(500)
AS
BEGIN
	DECLARE @return VARCHAR(1000)
		, @genreName VARCHAR(100)
		, @c INT
		, @m INT;

	SET @return = '';

	DECLARE @result TABLE
	(
		[ID] INT IDENTITY
		, [genreName] VARCHAR(100)
	);

	INSERT @result
	SELECT DISTINCT [gen].[genreName]
	FROM [dbo].[book_genre] AS [bg1]
	INNER JOIN [dbo].[genre] AS [gen] ON [bg1].[genreID] = [gen].[genreID]
	WHERE [bookID] = @bookID
	ORDER BY [genreName];

	SET @c = 1;
	SELECT @m = COUNT(*) FROM @result;

	IF(@m < 1)
	BEGIN
		SET @return = 'N/A';
	END
	IF(@m = 1)
	BEGIN
		SELECT @return = [genreName] FROM @result WHERE [ID] = 1;
	END
	ELSE
	BEGIN
		WHILE(@c <= @m)
		BEGIN
			SELECT @genreName = [genreName]
			FROM @result
			WHERE [ID] = @c;
			
			IF(@c = 1)
			BEGIN
				SET @return = @genreName
			END
			ELSE
			BEGIN
				SET @return = @return + '; ' + @genreName
			END

			SET @c = @c + 1;
		END
	END

	RETURN @return;
END
GO
