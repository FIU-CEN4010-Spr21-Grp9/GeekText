USE [ETL];
GO
/*
Title: genre.sql
Desc: Create the ETL genre reference table
Author: Shawn Welsh
History:
	2021-02-17 - SJW - Created

-- DROP TABLE [dbo].[genre];
*/
CREATE TABLE [dbo].[genre]
(
	[genreID] INT IDENTITY(1,1) CONSTRAINT [PK_genre_genreID] PRIMARY KEY NONCLUSTERED
	, [genreName] VARCHAR(100) NOT NULL
	, [genreDescription] VARCHAR(1000) NULL
	, CONSTRAINT [UQ_genre_genreName] UNIQUE CLUSTERED ([genreName])
);
GO
