USE [GeekText]
GO
/****** Object:  StoredProcedure [dbo].[wl_insert_item_to_wishlist]    Script Date: 3/6/2021 10:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Beraja
-- Create date: March 5, 2021
-- Description:	Adds an Item to a wishlist
-- =============================================
CREATE PROCEDURE [dbo].[wl_insert_item_to_wishlist]
	-- Add the parameters for the stored procedure here
	@userID int = 0,
	@bookID int = 0,
	@wishlistID int = 0

AS
IF EXISTS (SELECT 1 FROM wishlist 
				WHERE wishlist.wishlistID = @wishlistID AND wishlist.userID = @userID)
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO wishlist_item
	VALUES (@wishlistID, @bookID)

END
GO
