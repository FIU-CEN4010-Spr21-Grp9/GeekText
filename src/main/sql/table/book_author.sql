USE [GeekText];
GO
/*
Title: book_author.sql
Desc: Create the book_author child table of book
Author: Shawn Welsh
History:
	2021-02-08 - SJW - Created

-- DROP TABLE [dbo].[book_author];
*/
CREATE TABLE [dbo].[book_author]
(
	[bookID] INT CONSTRAINT [FK_book_author_bookID_book_bookID] FOREIGN KEY REFERENCES [dbo].[book] ([bookID])
	, [authorID] INT CONSTRAINT [FK_book_author_userID_user_authorID] FOREIGN KEY REFERENCES [dbo].[author] ([authorID])
	, [order] SMALLINT NULL
	, CONSTRAINT [UQ_book_author_bookID_authorID] UNIQUE CLUSTERED ([bookID], [authorID])
	, CONSTRAINT [UQ_book_author_bookID_order] UNIQUE NONCLUSTERED ([bookID], [order])
);
GO
