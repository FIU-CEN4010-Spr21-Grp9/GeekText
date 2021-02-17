USE [ETL];
GO
/*
Title: author.sql
Desc: Create the ETL author reference table
Author: Shawn Welsh
History:
	2021-02-17 - SJW - Created

-- DROP TABLE [dbo].[author]
*/
CREATE TABLE [dbo].[author]
(
	[authorID] INT IDENTITY(1,1) CONSTRAINT [PK_author_authorID] PRIMARY KEY NONCLUSTERED
	, [firstName] VARCHAR(100) NULL
	, [middleInit] CHAR(1) NULL
	, [lastName] VARCHAR(100) NULL
	, [authorName] VARCHAR(200) NOT NULL
	, [bio] VARCHAR(2000) NULL
);
GO
