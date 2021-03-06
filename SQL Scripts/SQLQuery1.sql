USE [JBPhotography]
GO
/****** Object:  StoredProcedure [dbo].[AddPropertyInfo]    Script Date: 2/11/2016 5:34:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[AddPropertyInfo] @CID int, @HouseSize int, @LotSize int, @ListingPrice int, @HouseAddress varchar(MAX), @HowTo varchar(MAX), @RealtorName varchar(50),
@RealtorPhone varchar(50), @RealtorCompany varchar(50), @OwnerName varchar(50), @OwnerPhone varchar(50), @Notes varchar(MAX), @Email varchar(100) = null
as
	if NOT EXISTS (select ID from PropertyInfo where CartID = @CID)
	begin
		insert into PropertyInfo
		(CartID, HouseSize, LotSize, ListingPrice, HouseAddress, HowTo, RealtorName, RealtorPhone, RealtorCompany, OwnerName,OwnerPhone,Notes, RealtorEmail)
		Values (@CID, @HouseSize, @LotSize, @ListingPrice, @HouseAddress, @HowTo, @RealtorName, @RealtorPhone, @RealtorCompany, @OwnerName, @OwnerPhone, @Notes, @Email)
	end
	else
	begin
		update PropertyInfo
		set HouseSize = @HouseSize, LotSize = @LotSize, ListingPrice = @ListingPrice, HouseAddress = @HouseAddress, HowTo = @HowTo, RealtorName = @RealtorName, RealtorPhone = @RealtorPhone, RealtorCompany = @RealtorCompany, OwnerName = @OwnerName, OwnerPhone = @OwnerPhone, Notes = @Notes, RealtorEmail = @Email
		where cartID = @CID
	end
