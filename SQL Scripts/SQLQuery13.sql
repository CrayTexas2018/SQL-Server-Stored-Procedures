USE [JBPhotography]
GO
/****** Object:  StoredProcedure [dbo].[SendCustomerPurchaseEmail]    Script Date: 2/11/2016 5:40:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[SendCustomerPurchaseEmail] @Subject varchar(MAX) ,@HTMLbody varchar(MAX)
as
	EXEC msdb.dbo.sp_send_dbmail
	 @profile_name = 'JB Photography Mail',
	 @recipients = 'Cray.Jaeger1@gmail.com',
	 @body = @HTMLbody,
	 @body_format = 'HTML',
	 @subject = @Subject;
