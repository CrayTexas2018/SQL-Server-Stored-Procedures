USE [JBPhotography]
GO
/****** Object:  StoredProcedure [dbo].[GetOrderDetails]    Script Date: 2/11/2016 5:41:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[GetOrderDetails] @InvoiceNumber varchar(50)
as
	select * from InvoiceLog
	inner join ShoppingCarts on ShoppingCarts.ID = InvoiceLog.CartID
	inner join Users on Users.ID = ShoppingCarts.UserID
	inner join Schedule on Schedule.CustomerID = Users.ID
	inner join PropertyInfo on PropertyInfo.CartID = ShoppingCarts.ID
	where InvoiceNumber = @InvoiceNumber
