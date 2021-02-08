/*
Title: user_payment.sql
Desc: Create the user_payment child table of user
Author: Shawn Welsh
History:
	2021-02-08 - SJW - Created

*/
CREATE TABLE [dbo].[user_payment]
(
	[paymentID] INT IDENTITY(1,1) CONSTRAINT [PK_user_payment_paymentID] PRIMARY KEY NONCLUSTERED
	, [userID] INT CONSTRAINT [FK_user_payment_userID_user_userID] FOREIGN KEY REFERENCES [dbo].[user] ([userID])
	, [isPrimary] BIT NOT NULL
	, [paymentName] VARCHAR(50) NOT NULL
	, [creditNumber] INT NOT NULL CONSTRAINT [UQ_user_payment_creditNumber] UNIQUE CLUSTERED
	, [expireDate] INT NOT NULL
	, CONSTRAINT [UQ_user_payment_userID_paymentName] UNIQUE ([userID], [paymentName])
);
GO
