/*
Title: user.sql
Desc: Create the user table
Author: Shawn Welsh
History:
	2021-02-06 - SJW - Created

-- DROP TABLE [dbo].[user]
*/
CREATE TABLE [dbo].[user]
(
	[userID] INT IDENTITY(1,1) CONSTRAINT [PK_user_userID] PRIMARY KEY NONCLUSTERED
	, [userName] VARCHAR(50) NOT NULL CONSTRAINT [UQ_user_userName] UNIQUE NONCLUSTERED
	, [password] VARCHAR(100) NOT NULL -- we have to store encrypted or hashed passwords
	, [nickname] VARCHAR(100) NULL
	, [firstName] VARCHAR(100) NOT NULL
	, [middleInit] CHAR(1) NULL
	, [lastName] VARCHAR(100) NOT NULL
	, [email] VARCHAR(100) NOT NULL
	, [phone] CHAR(10) NOT NULL
);
GO
