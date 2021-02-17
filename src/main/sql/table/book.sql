USE [GeekText];
GO
/*
Title: book.sql
Desc: Create the main books data table
Author: Shawn Welsh
History:
	2021-02-06 - SJW - Created

-- DROP TABLE [dbo].[book];
*/
IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = 'book')
BEGIN
	CREATE TABLE [dbo].[book]
	(
		[bookID] INT IDENTITY(1,1) CONSTRAINT [PK_book_bookID] PRIMARY KEY NONCLUSTERED
		, [title] VARCHAR(200) NOT NULL
		, [publishDate] DATETIME NOT NULL
		, [publisherID] INT CONSTRAINT [FK_book_publisherID_publisher_publisherID] FOREIGN KEY REFERENCES [dbo].[publisher] ([publisherID])
		--, [genreID] INT NOT NULL CONSTRAINT [FK_book_genreID_genre_genreID] FOREIGN KEY REFERENCES [dbo].[genre] ([genreID])
		, [price] NUMERIC(8,2) NOT NULL
		, [description] VARCHAR(2000) NOT NULL
	);
END
GO

IF NOT EXISTS(SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('book') AND name = 'isbn')
BEGIN
	ALTER TABLE [dbo].[book] ADD [isbn] INT NULL;
END
GO

IF NOT EXISTS(SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('book') AND name = 'isbn13')
BEGIN
	ALTER TABLE [dbo].[book] ADD [isbn13] INT NULL;
END
GO

IF EXISTS(SELECT * FROM sys.objects WHERE name = 'FK_book_genreID_genre_genreID')
BEGIN
	ALTER TABLE [dbo].[book] DROP CONSTRAINT [FK_book_genreID_genre_genreID];
END
GO

IF EXISTS(SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('book') AND name = 'genreID')
BEGIN
	ALTER TABLE [dbo].[book] DROP COLUMN [genreID];
END
GO
