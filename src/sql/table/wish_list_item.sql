/*
Title: wish_list_item.sql
Desc: Create the wish_list table
Author: Shawn Welsh
History:
	2021-02-08 - SJW - Created

-- DROP TABLE [dbo].[wish_list_item];
*/
CREATE TABLE [dbo].[wish_list_item]
(
	[itemID] INT IDENTITY CONSTRAINT [PK_wish_list_item_itemID] PRIMARY KEY NONCLUSTERED
	, [listID] INT CONSTRAINT [FK_wish_list_item_listID_wish_list_listID] FOREIGN KEY REFERENCES [dbo].[wish_list]([listID])
	, [bookID] INT CONSTRAINT [FK_wish_list_item_bookID_book_bookID] FOREIGN KEY REFERENCES [dbo].[book]([bookID])
	, CONSTRAINT [UQ_wish_list_item_listID_bookID] UNIQUE CLUSTERED ([listID], [bookID])
);
GO
