/*
Title: user_address.sql
Desc: Create the user_address child table of user
Author: Shawn Welsh
History:
	2021-02-06 - SJW - Created

*/
CREATE TABLE [dbo].[user_address]
(
	[addressID] INT IDENTITY(1,1) CONSTRAINT [PK_user_address_addressID] PRIMARY KEY NONCLUSTERED
	, [userID] INT CONSTRAINT [FK_user_address_user_ID_user_userID] FOREIGN KEY REFERENCES [dbo].[user] ([userID])
	, [streetAddress] VARCHAR(100) NOT NULL
	, [city] VARCHAR(100) NOT NULL
	, [state] CHAR(2) NOT NULL
	, [zip] VARCHAR(10) NOT NULL
	, [isPrimary] BIT NOT NULL
);
GO
