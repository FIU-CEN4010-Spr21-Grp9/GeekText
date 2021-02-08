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
);
GO
