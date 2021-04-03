USE [GeekText]
GO
/****** Object:  StoredProcedure [dbo].[wl_create_wishlist]    Script Date: 3/6/2021 10:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Beraja
-- Create date: March 5, 2021
-- Description:	Creates a new user wishlist
-- =============================================
CREATE PROCEDURE [dbo].[wl_create_wishlist] 
	-- Add the parameters for the stored procedure here
	@userID int = 0, 
	@wishlistName varchar(100) = "untitled wishlist"
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO wishlist
	VALUes (@userID, @wishlistName)


END
GO
