USE [JBPhotography]
GO
/****** Object:  StoredProcedure [dbo].[CreateShoppingCart]    Script Date: 2/11/2016 5:39:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[CreateShoppingCart] @ID int, @Override int = null
as
	if not exists (select id from ShoppingCarts where UserID = @ID and Expires > GETDATE()) or @Override is not null
	begin
		update ShoppingCarts
		set IsActive = 0
		where UserID = @ID

		insert into shoppingcarts (UserID)
		values (@ID)
	end 

	select ID as 'Result' from shoppingcarts where userid = @ID and isactive = 1 and Expires > GETDATE()
	return (select ID as 'Result' from shoppingcarts where userid = @ID and isactive = 1 and Expires > GETDATE())

