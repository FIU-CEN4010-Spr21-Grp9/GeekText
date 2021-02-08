/*
Title: genre.sql
Desc: Create the genre reference table
Author: Shawn Welsh
History:
	2021-02-06 - SJW - Created

-- DROP TABLE [dbo].[genre];
*/
CREATE TABLE [dbo].[genre]
(
	[genreID] INT IDENTITY(1,1) CONSTRAINT [PK_genre_genreID] PRIMARY KEY NONCLUSTERED
	, [genreName] VARCHAR(100) NOT NULL
	, [description] VARCHAR(1000) NULL
	, CONSTRAINT [UQ_genre_genreName] UNIQUE CLUSTERED ([genreName])
);
GO
