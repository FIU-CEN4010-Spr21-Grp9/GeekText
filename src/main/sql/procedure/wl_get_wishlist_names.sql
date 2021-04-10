USE [GeekText]
GO
/****** Object:  StoredProcedure [dbo].[wl_get_wishlist_names]    Script Date: 4/10/2021 5:10:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Beraja
-- Create date: 05/04/2021
-- Description:	Gets the names of each wishlist a user has
-- =============================================
ALTER PROCEDURE [dbo].[wl_get_wishlist_names] 
	-- Add the parameters for the stored procedure here
	@userID integer

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select wishlist.name, wishlist.wishlistID from wishlist where wishlist.userID = @userID
END
