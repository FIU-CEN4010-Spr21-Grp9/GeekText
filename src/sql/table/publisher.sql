/*
Title: publisher.sql
Desc: Create the publisher reference table
Author: Shawn Welsh
History:
	2021-02-06 - SJW - Created

-- DROP TABLE [dbo].[publisher];
*/
CREATE TABLE [dbo].[publisher]
(
	[publisherID] INT IDENTITY(1,1) CONSTRAINT [PK_publisher_publisherID] PRIMARY KEY NONCLUSTERED
	, [publisherName] VARCHAR(200) NOT NULL
	, [description] VARCHAR(2000) NULL
	, [streetAddress] VARCHAR(200) NULL
	, [city] VARCHAR(200) NULL
	, [state] VARCHAR(200) NULL
	, [zip] VARCHAR(200) NULL
	, [phone] CHAR(10) NULL
	, [email] VARCHAR(100) NULL
	, CONSTRAINT [UQ_publisher_publisherName] UNIQUE CLUSTERED ([publisherName])
);
GO
