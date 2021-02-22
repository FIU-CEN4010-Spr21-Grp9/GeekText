USE [GeekText];
GO
/*
Title: book_genre.sql
Desc: Create the book_genre child table of book
Author: Shawn Welsh
History:
	2021-02-06 - SJW - Created

-- DROP TABLE [dbo].[book_genre];
*/
CREATE TABLE [dbo].[book_genre]
(
	[genreID] INT CONSTRAINT [FK_book_genre_genreID_genre_genreID] FOREIGN KEY REFERENCES [dbo].[genre] ([genreID])
	, [bookID] INT CONSTRAINT [FK_book_genre_bookID_book_bookID] FOREIGN KEY REFERENCES [dbo].[book] ([bookID])
	, CONSTRAINT [PK_book_genre] PRIMARY KEY CLUSTERED ([genreID], [bookID])
);
GO

CREATE NONCLUSTERED INDEX [ix_book_genre_bookID_genreID] ON [dbo].[book_genre] ([bookID], [genreID]);
GO
