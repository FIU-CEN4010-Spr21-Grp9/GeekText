USE [GeekText]
GO
/****** Object:  StoredProcedure [dbo].[wl_move_item_to_new_wishlist]    Script Date: 3/6/2021 10:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Beraja
-- Create date: March 5, 2021
-- Description: Moves an item from one wishlist to another
-- =============================================
CREATE PROCEDURE [dbo].[wl_move_item_to_new_wishlist] 
	-- Add the parameters for the stored procedure here
	@userID int = 0,
	@wishlistItemID int = 0,
	@wishlistID int = 0
AS

IF EXISTS (SELECT 1 FROM wishlist 
				WHERE wishlist.wishlistID = @wishlistID AND wishlist.userID = @userID)
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	UPDATE WI
	SET wishlistID = @wishlistID
	FROM wishlist AS W 
	INNER JOIN wishlist_item AS WI ON W.wishlistID = WI.wishlistID
	WHERE wishlist_itemID = @wishlistItemID 
	AND userID = @userID
	
	

END
GO
