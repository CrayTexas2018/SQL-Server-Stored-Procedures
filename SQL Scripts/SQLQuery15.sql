USE [JBPhotography]
GO
/****** Object:  StoredProcedure [dbo].[GetListingFee]    Script Date: 2/11/2016 5:40:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[GetListingFee] @Price money
as
	if (@Price > 5000000)
	begin
		set @Price = 5000000
	end
	declare @returnPrice money = 0
	declare @i int 
	select @i = COUNT(*) from PropertyListingFee
	while @i > 0
	Begin
		if (select listingValue from propertyListingFee where ID = @i) < @Price 
		Begin
			select @returnPrice = price from propertyListingFee where ID = @i
			declare @multiple int
			set @multiple = (@Price/1000000)
			if @multiple > 2
			begin
				set @returnPrice = @returnPrice + (100 * (@multiple - 2))
			end
			break
		End
		else if (select listingValue from propertyListingFee where ID = @i) < @Price
		Begin
			select @returnPrice = price from propertyListingFee where ID = @i
		End
		set @i = @i - 1
	End

	select @returnPrice as 'Price'

