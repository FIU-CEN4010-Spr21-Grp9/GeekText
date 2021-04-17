USE [GeekText]
GO

IF EXISTS(SELECT * FROM sys.objects WHERE name = 'usp_get_review_by_bookID')
BEGIN
	DROP PROCEDURE [dbo].[usp_get_review_by_bookID];
END
GO

SET ANSI_NULLS, QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_get_review_by_bookID]
(
	@bookID INT
)
AS
BEGIN
/*
Title: usp_get_review_by_bookID.sql
Desc: Get the author by the book ID
Author: Shawn Welsh
History:
	04/02/21

EXEC [dbo].[usp_get_review_by_bookID] @bookID = 774001;
*/

SET NOCOUNT ON;

DECLARE @authorIDs TABLE
(
	[authorID] INT PRIMARY KEY
);

SELECT [rev].[reviewID]
	, [rev].[bookID]
	, [rev].[userID]
	, [rev].[isAnonymous] AS [is_anonymous]
	, [rev].[rating]
	, [rev].[title]
	, [rev].[description]
FROM [dbo].[book_review] AS [rev]
WHERE [rev].[bookID] = @bookID
ORDER BY [rev].[reviewID];

SET NOCOUNT OFF;

END
GO


