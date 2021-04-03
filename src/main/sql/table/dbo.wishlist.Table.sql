USE [GeekText]
GO
/****** Object:  Table [dbo].[wishlist]    Script Date: 3/6/2021 10:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wishlist](
	[wishlistID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_wishlist] PRIMARY KEY CLUSTERED 
(
	[wishlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[wishlist]  WITH CHECK ADD  CONSTRAINT [FK_wishlist_user] FOREIGN KEY([userID])
REFERENCES [dbo].[user] ([userID])
GO
ALTER TABLE [dbo].[wishlist] CHECK CONSTRAINT [FK_wishlist_user]
GO
