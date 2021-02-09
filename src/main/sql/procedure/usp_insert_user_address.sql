IF EXISTS(SELECT * FROM sys.objects WHERE name = 'usp_insert_user_address')
BEGIN
	DROP PROCEDURE [dbo].[usp_insert_user_address];
END
GO

CREATE PROCEDURE [dbo].[usp_insert_user_address]
(
	@userID INT
	, @streetAddres VARCHAR(100)
	, @city VARCHAR(100)
	, @state CHAR(2)
	, @zip CHAR(10)
)
AS
BEGIN

	INSERT INTO dbo.user_address (userID, streetAddress, city, [state], zip, isPrimary)
	VALUES (@userID, @streetAddres, @city, @state, @zip, 0);

END
GO

/*

DECLARE @return INT;

EXEC @return = dbo.usp_insert_user_address 1, '456 christmas dr', 'boca raton', 'fl', '34567';

SELECT @return

SELECT * FROM user_address

*/
