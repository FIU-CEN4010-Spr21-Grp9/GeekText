USE [GeekText]GO/****** Object:  StoredProcedure [dbo].[wl_delete_wishlist]    Script Date: 4/16/2021 4:01:39 PM ******/SET ANSI_NULLS ONGOSET QUOTED_IDENTIFIER ONGO-- =============================================-- Author:		Joshua Beraja-- Create date: March 5, 2021-- Description:	Deletes a wishlist given a user and wishlistID-- =============================================ALTER PROCEDURE [dbo].[wl_delete_wishlist] 	-- Add the parameters for the stored procedure here	@userID int = 0,	@wishlistID int = 0ASBEGIN	-- SET NOCOUNT ON added to prevent extra result sets from	-- interfering with SELECT statements.	SET NOCOUNT ON;    DELETE FROM wishlist_item	WHERE wishlist_itemID IN (SELECT wishlist_itemID FROM wishlist AS W					  INNER JOIN wishlist_item AS WI ON WI.wishlistID = W.wishlistID					  WHERE W.userID = @userID					  AND WI.wishlistID = @wishlistID)	DELETE FROM wishlist	WHERE wishlist.userID = @userID	AND wishlistID = @wishlistIDEND