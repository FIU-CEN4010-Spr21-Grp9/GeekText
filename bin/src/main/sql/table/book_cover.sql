/*
Title: book_cover.sql
Desc: Create the book_cover child table of book
Author: Shawn Welsh
History:
	2021-02-06 - SJW - Created

-- DROP TABLE [dbo].[book_cover];
*/
CREATE TABLE [dbo].[book_cover]
(
	[coverID] INT IDENTITY CONSTRAINT [PK_book_cover_coverID] PRIMARY KEY NONCLUSTERED
	, [bookID] INT CONSTRAINT [FK_book_cover_bookID_book_bookID] FOREIGN KEY REFERENCES [dbo].[book] ([bookID])
	, [image_url] VARCHAR(500) NOT NULL
);
GO

CREATE CLUSTERED INDEX [ci_book_cover_bookID] ON [dbo].[book_cover] ([bookID]);
GO
