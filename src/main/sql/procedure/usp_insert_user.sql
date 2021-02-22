IF EXISTS(SELECT * FROM sys.objects WHERE name = 'usp_insert_user')
BEGIN
	DROP PROCEDURE [dbo].[usp_insert_user];
END
GO

CREATE PROCEDURE [dbo].[usp_insert_user]
(
	@userName VARCHAR(50)
	, @password VARCHAR(100)
	, @nickname VARCHAR(100)
	, @firstName VARCHAR(100)
	, @middleInit CHAR(1)
	, @lastName VARCHAR(100)
	, @email VARCHAR(100)
	, @phone CHAR(10)
)
AS
BEGIN

	INSERT INTO [dbo].[user]
	(
		[userName]
		, [password]
		, [nickname]
		, [firstName]
		, [middleInit]
		, [lastName]
		, [email]
		, [phone]
	)
	VALUES
	(
		@userName
		, @password
		, @nickname
		, @firstName
		, @middleInit
		, @lastName
		, @email
		, @phone
	);

END
GO

/*

EXEC [dbo].[usp_insert_user]
	@userName = 'blue1'
	, @password = 'helloWorld'
	, @nickname = 'blue'
	, @firstName = 'Azul'
	, @middleInit = NULL
	, @lastName = 'Barros'
	, @email = 'abarr123@fiu.edu'
	, @phone = '1235551234'

SELECT * FROM dbo.[user]

*/
