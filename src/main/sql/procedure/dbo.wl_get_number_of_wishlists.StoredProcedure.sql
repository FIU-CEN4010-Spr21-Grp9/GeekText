USE [GeekText]
GO
/****** Object:  StoredProcedure [dbo].[wl_get_number_of_wishlists]    Script Date: 3/6/2021 10:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Beraja
-- Create date: March 5, 2021
-- Description:	returns the current number of wishlists a user has
-- =============================================
CREATE PROCEDURE [dbo].[wl_get_number_of_wishlists] 
	-- Add the parameters for the stored procedure here
	@userID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	RETURN SELECT COUNT(*) AS Lists FROM wishlist
	INNER JOIN [user] AS U ON U.userID = wishlist.userID
	where U.userID = @userID

END
GO
