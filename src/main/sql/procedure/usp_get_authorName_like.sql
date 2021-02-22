USE [GeekText];
GO

IF EXISTS(SELECT * FROM sys.objects WHERE name = 'usp_get_authorName_like')
BEGIN
	DROP PROCEDURE [dbo].[usp_get_authorName_like];
END
GO

CREATE PROCEDURE [dbo].[usp_get_authorName_like]
(
	@pattern VARCHAR(100)
)
AS
BEGIN
/*
Title: usp_get_authorName_like.sql
Desc: Create the get genreName list sp
Author: Shawn Welsh
History:
	2021-02-19 - SJW - Created

EXEC [dbo].[usp_get_authorName_like] 'king'
*/

SET NOCOUNT ON;

DECLARE @likePattern VARCHAR(200);

SET @likePattern = '%' + @pattern + '%';

SELECT [authorID]
	, [firstName] AS [first_name]
	, [middleInit] AS [middle]
	, [lastName] AS [last_name]
	, [authorName] AS [author_name]
	, [bio]
FROM [dbo].[author]
WHERE [authorName] LIKE @likePattern
ORDER BY [authorName];

END
GO