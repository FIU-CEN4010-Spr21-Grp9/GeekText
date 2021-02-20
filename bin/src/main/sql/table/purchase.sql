/*
Title: purchase.sql
Desc: Create the purchase table
Author: Shawn Welsh
History:
	2021-02-08 - SJW - Created

-- DROP TABLE [dbo].[purchase]
*/
CREATE TABLE [dbo].[purchase]
(
	[purchaseID] INT IDENTITY(1,1) CONSTRAINT [PK_purchase_purchaseID] PRIMARY KEY NONCLUSTERED
	, [userID] INT CONSTRAINT [FK_purchase_userID_user_userID] FOREIGN KEY REFERENCES [dbo].[user]([userID])
	, [bookID] INT CONSTRAINT [FK_purchase_bookID_book_bookID] FOREIGN KEY REFERENCES [dbo].[book]([bookID])
	, [price] NUMERIC(8,2) NOT NULL
	, [quantity] INT NOT NULL
	, [purchaseDate] DATETIME NOT NULL CONSTRAINT [DF_purchase_purchaseDate] DEFAULT (GETDATE())
);
GO
