/*
Title: shopping_cart.sql
Desc: Create the shopping_cart table
Author: Shawn Welsh
History:
	2021-02-08 - SJW - Created

-- DROP TABLE [dbo].[shopping_cart]
*/
CREATE TABLE [dbo].[shopping_cart]
(
	[cartID] INT IDENTITY(1,1) CONSTRAINT [PK_shopping_cart_cartID] PRIMARY KEY NONCLUSTERED
	, [userID] INT CONSTRAINT [FK_shopping_cart_userID_user_userID] FOREIGN KEY REFERENCES [dbo].[user]([userID])
	, [bookID] INT CONSTRAINT [FK_shopping_cart_bookID_book_bookID] FOREIGN KEY REFERENCES [dbo].[book]([bookID])
	, [quantity] SMALLINT NOT NULL CONSTRAINT [CK_shopping_cart_quantity] CHECK ([quantity] > 0)
	, [isSaved] BIT NOT NULL CONSTRAINT [DF_shopping_cart_isSaved] DEFAULT (0)
);
GO
