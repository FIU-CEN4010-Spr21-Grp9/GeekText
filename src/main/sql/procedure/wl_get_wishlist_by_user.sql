USE [GeekText]
GO
/****** Object:  StoredProcedure [dbo].[wl_get_wishlist_by_user]    Script Date: 4/3/2021 4:42:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Beraja
-- Create date: March 5, 2021
-- Description:	gets wishlist for a given user
-- ============================================
ALTER PROCEDURE [dbo].[wl_get_wishlist_by_user] 
	-- Add the parameters for the stored procedure here
	@userID integer
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT WI.wishlist_itemID, WI.wishlistID, W.name, W.userID, B.title, B.bookID FROM wishlist AS W
	INNER JOIN wishlist_item AS WI ON WI.wishlistID = W.wishlistID
	INNER JOIN book AS B ON B.bookID = WI.bookID
	WHERE W.userID = @userID

END
