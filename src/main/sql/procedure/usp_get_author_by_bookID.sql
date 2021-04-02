USE [GeekText]
GO

IF EXISTS(SELECT * FROM sys.objects WHERE name = 'usp_get_author_by_bookID')
BEGIN
	DROP PROCEDURE [dbo].[usp_get_author_by_bookID];
END
GO

SET ANSI_NULLS, QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_get_author_by_bookID]
(
	@bookID INT
)
AS
BEGIN
/*
Title: usp_get_author_by_bookID.sql
Desc: Get the author by the book ID
Author: Shawn Welsh
History:
	04/02/21

EXEC [dbo].[usp_get_author_by_bookID] @bookID = 598898;
*/

SET NOCOUNT ON;

DECLARE @authorIDs TABLE
(
	[authorID] INT PRIMARY KEY
);

SELECT [det].[authorID]
	, [det].[authorName]  AS [author_name]
	, [det].[firstName] AS [first_name]
	, [det].[lastName] AS [last_name]
	, [det].[middleInit] AS [middle]
	, [det].[bio] 
FROM [dbo].[author] AS [det]
INNER JOIN [dbo].[book_author] AS [bat] ON [det].[authorID] = [bat].[authorID]
WHERE [bat].[bookID] = @bookID
ORDER BY [bat].[order];

SET NOCOUNT OFF;

END
GO


