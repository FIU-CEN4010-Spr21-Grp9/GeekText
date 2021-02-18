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
	, [rating] NUMERIC(2,1) NOT NULL
	, [title] VARCHAR(100) NOT NULL
	, [description] VARCHAR(2000) NOT NULL
);
GO

ALTER TABLE [dbo].[book_review] ADD CONSTRAINT [UQ_book_review_bookID_userID] UNIQUE CLUSTERED ([bookID], [userID]);
GO

CREATE NONCLUSTERED INDEX [ix_book_review_bookID_rating] ON [dbo].[book_review] ([bookID]) INCLUDE ([rating]);
GO
