/*
Title: wish_list.sql
Desc: Create the wish_list table
Author: Shawn Welsh
History:
	2021-02-08 - SJW - Created

-- DROP TABLE [dbo].[wish_list];
*/
CREATE TABLE [dbo].[wish_list]
(
	[listID] INT IDENTITY(1,1) CONSTRAINT [PK_wish_list_listID] PRIMARY KEY NONCLUSTERED
	, [userID] INT CONSTRAINT [FK_wish_list_userID_user_userID] FOREIGN KEY REFERENCES [dbo].[user]([userID])
	, [listNumber] TINYINT NOT NULL CONSTRAINT [CK_wish_list_listNumber] CHECK(([listNumber] > 0) AND ([listNumber] < 4))
	, [listName] VARCHAR(100) NULL
	, CONSTRAINT [UQ_wish_list_userID_listNumber] UNIQUE CLUSTERED ([listNumber], [userID]) 
	, CONSTRAINT [UQ_wish_list_userID_listName] UNIQUE NONCLUSTERED ([userID], [listName])
);
GO
