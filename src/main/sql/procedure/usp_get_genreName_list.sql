USE [GeekText];
GO

IF EXISTS(SELECT * FROM sys.objects WHERE name = 'usp_get_genreName_list')
BEGIN
	DROP PROCEDURE [dbo].[usp_get_genreName_list];
END
GO

CREATE PROCEDURE [dbo].[usp_get_genreName_list]
AS
BEGIN
/*
Title: usp_get_genreName_list.sql
Desc: Create the get genreName list sp
Author: Shawn Welsh
History:
	2021-02-19 - SJW - Created


*/

SET NOCOUNT ON;

SELECT 0 AS [genreID], 'Any' AS [genre_name] -- This is for the combo box "default" no genre
UNION
SELECT [genreID]
	, [genreName] AS [genre_name]
FROM [dbo].[genre]
ORDER BY [genreID];

SET NOCOUNT OFF;

END
GO
