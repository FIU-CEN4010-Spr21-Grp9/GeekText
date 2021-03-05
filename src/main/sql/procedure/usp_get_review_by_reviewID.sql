USE [GeekText];
GO

IF EXISTS(SELECT * FROM sys.objects WHERE name = 'usp_get_review_by_bookID')
BEGIN
	DROP PROCEDURE [dbo].[usp_get_review_by_reviewID];
END
GO

CREATE PROCEDURE [dbo].[usp_get_review_by_reviewID]
(
	@reviewID INT = NULL
)
AS
BEGIN
/*
Title: usp_get_review_by_reviewID.sql
Desc: Create the get review by review ID sp
Author: Shawn Welsh
History:
	2021-03-04 - SJW - Created

EXEC [dbo].[usp_get_review_by_reviewID] @reviewID = 1;

*/

SET NOCOUNT ON;

DECLARE @reviewIDs TABLE
(
	[reviewID] INT PRIMARY KEY
);

SELECT [det].[reviewID]
	, [det].[bookID] AS [book_ID]
	, [det].[userID] AS [user_ID]
	, [det].[isAnonymous] AS [is_Anonymous]
	, [det].[rating]
	, [det].[title]
	, [det].[description]
FROM [dbo].[book_review] AS [det]
WHERE [reviewID] = @reviewID
ORDER BY [det].[reviewID];

SET NOCOUNT OFF;

END
GO