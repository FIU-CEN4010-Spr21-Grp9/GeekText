USE [GeekText];
GO

IF EXISTS(SELECT * FROM sys.objects WHERE name = 'usp_get_user_by_username')
BEGIN
	DROP PROCEDURE [dbo].[usp_get_user_by_username];
END
GO

CREATE PROCEDURE [dbo].[usp_get_user_by_username]
(
	@userName VARCHAR(50)
)
AS
BEGIN
/*
Title: usp_get_user_by_username.sql
Desc: Create the get user by username sp
Author: Shawn Welsh
History:
	2021-03-01 - SJW - Created

-- SELECT * FROM [dbo].[user] WHERE userName = 'blue1'

EXEC [dbo].[usp_get_user_by_username] 'blue1'

*/

SET NOCOUNT ON;

SELECT [userID]
	, [userName]
	, [password]
	, [nickname]
	, [firstName]
	, [middleInit]
	, [lastName]
	, [email]
	, [phone]
FROM [dbo].[user]
WHERE [userName] = @userName;


SET NOCOUNT OFF;

END
GO
