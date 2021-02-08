/*
Title: book.sql
Desc: Create the main books data table
Author: Shawn Welsh
History:
	2021-02-06 - SJW - Created

-- DROP TABLE [dbo].[book];
*/
CREATE TABLE [dbo].[book]
(
	[bookID] INT IDENTITY(1,1) CONSTRAINT [PK_book_bookID] PRIMARY KEY NONCLUSTERED
	, [title] VARCHAR(200) NOT NULL
	, [publishDate] DATETIME NOT NULL
	, [publisherID] INT CONSTRAINT [FK_book_publisherID_publisher_publisherID] FOREIGN KEY REFERENCES [dbo].[publisher] ([publisherID])
	, [genreID] INT NOT NULL CONSTRAINT [FK_book_genreID_genre_genreID] FOREIGN KEY REFERENCES [dbo].[genre] ([genreID])
	, [price] NUMERIC(8,2) NOT NULL
	, [description] VARCHAR(2000) NOT NULL
);
GO
