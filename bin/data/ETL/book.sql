USE [ETL];
GO
/*
Title: book.sql
Desc: Create the ETL books data table
Author: Shawn Welsh
History:
	2021-02-17 - SJW - Created

-- DROP TABLE [dbo].[book];
*/
IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = 'book')
BEGIN
	CREATE TABLE [dbo].[book]
	(
		[bookID] INT IDENTITY(1,1) CONSTRAINT [PK_book_bookID] PRIMARY KEY NONCLUSTERED
		, [title] VARCHAR(500) NOT NULL
		, [publishDate] DATETIME NULL
		, [publisherID] INT CONSTRAINT [FK_book_publisherID_publisher_publisherID] FOREIGN KEY REFERENCES [dbo].[publisher] ([publisherID])
		, [price] NUMERIC(8,2) NOT NULL
		, [description] VARCHAR(2000) NULL
		, [isbn] CHAR(10) NULL
		, [isbn13] BIGINT NULL
	);
END
GO

ALTER TABLE [dbo].[book] ALTER COLUMN [publishDate] DATETIME NULL;
GO

ALTER TABLE [dbo].[book] ALTER COLUMN [title] VARCHAR(500) NOT NULL;
GO
