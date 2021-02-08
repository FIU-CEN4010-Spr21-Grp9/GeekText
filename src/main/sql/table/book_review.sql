/*
Title: book_review.sql
Desc: Create the book_review child table of book
Author: Shawn Welsh
History:
	2021-02-06 - SJW - Created

-- DROP TABLE [dbo].[book_review];
*/
CREATE TABLE [dbo].[book_review]
(
	[reviewID] INT IDENTITY(1,1) CONSTRAINT [PK_book_review_reviewID] PRIMARY KEY NONCLUSTERED
	, [bookID] INT CONSTRAINT [FK_book_review_bookID_book_bookID] FOREIGN KEY REFERENCES [dbo].[book] ([bookID])
	, [userID] INT CONSTRAINT [FK_book_review_userID_user_userID] FOREIGN KEY REFERENCES [dbo].[user] ([userID])
	, [isAnonymous] BIT NOT NULL
	, [rating] TINYINT NOT NULL
	, [title] VARCHAR(100) NOT NULL
	, [description] VARCHAR(2000) NOT NULL
);
GO
