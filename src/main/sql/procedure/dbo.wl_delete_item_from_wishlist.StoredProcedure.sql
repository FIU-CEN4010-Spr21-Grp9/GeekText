USE [GeekText]
GO
/****** Object:  StoredProcedure [dbo].[wl_delete_item_from_wishlist]    Script Date: 3/6/2021 10:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Beraja
-- Create date: March 5, 2021
-- Description:	Deletes an item from a wishlist
-- =============================================
CREATE PROCEDURE [dbo].[wl_delete_item_from_wishlist] 
	-- Add the parameters for the stored procedure here
	@userID int = 0,
	@wishlistItemID int = 0

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM wishlist_item
	WHERE wishlist_itemID IN (SELECT wishlist_itemID FROM wishlist AS W
					  INNER JOIN wishlist_item AS WI ON WI.wishlistID = W.wishlistID
					  WHERE W.userID = @userID
					  AND WI.wishlist_itemID = @wishlistItemID)

END
GO
