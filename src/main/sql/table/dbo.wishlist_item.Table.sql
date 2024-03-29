USE [GeekText]
GO
/****** Object:  Table [dbo].[wishlist_item]    Script Date: 3/6/2021 10:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wishlist_item](
	[wishlist_itemID] [int] IDENTITY(1,1) NOT NULL,
	[wishlistID] [int] NOT NULL,
	[bookID] [int] NOT NULL,
 CONSTRAINT [PK_wishlist_item] PRIMARY KEY CLUSTERED 
(
	[wishlist_itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[wishlist_item]  WITH CHECK ADD  CONSTRAINT [FK_bookID] FOREIGN KEY([bookID])
REFERENCES [dbo].[book] ([bookID])
GO
ALTER TABLE [dbo].[wishlist_item] CHECK CONSTRAINT [FK_bookID]
GO
