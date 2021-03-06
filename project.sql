USE [s16guest18]
GO
/****** Object:  User [s16guest18]    Script Date: 2016/5/12 0:49:13 ******/
CREATE USER [s16guest18] FOR LOGIN [s16guest18] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [s16guest18]
GO
/****** Object:  StoredProcedure [dbo].[addProduct]    Script Date: 2016/5/12 0:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE procedure [dbo].[addProduct]
	-- Parameters for the stored procedure
	@ProductName varchar(50),
	@ProductDescription varchar(50),
	@version int
as
begin
	
	declare @errorMessage varchar(50)

	set nocount on;

	if exists (Select ProductName from Product where ProductName=@ProductName)
		begin
		set @errorMessage = 'Error: Product name already exists in table product!'
		raiserror(@errorMessage,11,1)
		end
	else
		begin
		insert into Product
		values (@ProductName, @ProductDescription,@version);
		end
end

GO
/****** Object:  Table [dbo].[Address]    Script Date: 2016/5/12 0:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[Street] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Zipcode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 2016/5/12 0:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Branch](
	[BranchID] [int] IDENTITY(1,1) NOT NULL,
	[BranchName] [varchar](50) NOT NULL,
	[Location] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 2016/5/12 0:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2016/5/12 0:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PhoneId] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerRelease]    Script Date: 2016/5/12 0:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerRelease](
	[CustomerReleaseId] [int] IDENTITY(1,1) NOT NULL,
	[FeatureId] [int] NOT NULL,
	[Date] [varchar](10) NOT NULL,
 CONSTRAINT [PK_CustomerRelease] PRIMARY KEY CLUSTERED 
(
	[CustomerReleaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DownLoad]    Script Date: 2016/5/12 0:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DownLoad](
	[DownLoadId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CustomerReleaseId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Date] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DownLoad] PRIMARY KEY CLUSTERED 
(
	[DownLoadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 2016/5/12 0:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feature](
	[FeatureId] [int] IDENTITY(1,1) NOT NULL,
	[FeatureDescrition] [varchar](50) NOT NULL,
	[IterationId] [int] NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[FeatureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Iteration]    Script Date: 2016/5/12 0:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Iteration](
	[IterationID] [int] NOT NULL,
	[StartDate] [varchar](50) NOT NULL,
	[EndDate] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Iteration] PRIMARY KEY CLUSTERED 
(
	[IterationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 2016/5/12 0:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Phone](
	[PhoneId] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[Number] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[PhoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhoneTypes]    Script Date: 2016/5/12 0:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhoneTypes](
	[PhoneTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PhoneType] [varchar](50) NOT NULL,
	[PhoneName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PhoneTypes] PRIMARY KEY CLUSTERED 
(
	[PhoneTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2016/5/12 0:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductDescription] [varchar](50) NOT NULL,
	[VersionId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Release]    Script Date: 2016/5/12 0:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Release](
	[ReleaseId] [int] IDENTITY(1,1) NOT NULL,
	[BranchId] [int] NOT NULL,
 CONSTRAINT [PK_Release] PRIMARY KEY CLUSTERED 
(
	[ReleaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Version]    Script Date: 2016/5/12 0:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Version](
	[VersionID] [int] IDENTITY(1,1) NOT NULL,
	[VersionNumber] [varchar](10) NOT NULL,
	[platform] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Version] PRIMARY KEY CLUSTERED 
(
	[VersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AddressId], [Street], [State], [Zipcode]) VALUES (7, N'123Privet', N'CA', N'91601')
INSERT [dbo].[Address] ([AddressId], [Street], [State], [Zipcode]) VALUES (9, N'348 Jinx Road', N'CA', N'91601')
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyId], [Name], [AddressId]) VALUES (6, N'ABCrecords', 7)
INSERT [dbo].[Company] ([CompanyId], [Name], [AddressId]) VALUES (8, N'ZYX Corp
', 9)
INSERT [dbo].[Company] ([CompanyId], [Name], [AddressId]) VALUES (12, N'99 Store
', 7)
INSERT [dbo].[Company] ([CompanyId], [Name], [AddressId]) VALUES (15, N'99 Store', 9)
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [CompanyId], [Email], [PhoneId]) VALUES (51, N'Peter', N'Smith', 6, N'p.smith@abc.com', 7)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [CompanyId], [Email], [PhoneId]) VALUES (53, N'Maria
', N'Bounte
', 8, N'maria@zyx.com
', 22)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [CompanyId], [Email], [PhoneId]) VALUES (56, N'David
', N'Sommerset
', 12, N'david.sommerset@99cents.store
', 23)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [CompanyId], [Email], [PhoneId]) VALUES (57, N'Maria
', N'Bounte
', 15, N'maria.bounte@99cents.store
', 24)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[CustomerRelease] ON 

INSERT [dbo].[CustomerRelease] ([CustomerReleaseId], [FeatureId], [Date]) VALUES (7, 4, N'2010/3/1')
INSERT [dbo].[CustomerRelease] ([CustomerReleaseId], [FeatureId], [Date]) VALUES (11, 11, N'2003/5/1')
SET IDENTITY_INSERT [dbo].[CustomerRelease] OFF
SET IDENTITY_INSERT [dbo].[Feature] ON 

INSERT [dbo].[Feature] ([FeatureId], [FeatureDescrition], [IterationId]) VALUES (4, N'login module
', 3)
INSERT [dbo].[Feature] ([FeatureId], [FeatureDescrition], [IterationId]) VALUES (11, N'patient registration
', 1)
INSERT [dbo].[Feature] ([FeatureId], [FeatureDescrition], [IterationId]) VALUES (14, N'patient profile
', 1)
INSERT [dbo].[Feature] ([FeatureId], [FeatureDescrition], [IterationId]) VALUES (15, N'patient release form
', 3)
INSERT [dbo].[Feature] ([FeatureId], [FeatureDescrition], [IterationId]) VALUES (17, N'physician profile
', 1)
INSERT [dbo].[Feature] ([FeatureId], [FeatureDescrition], [IterationId]) VALUES (19, N'address verification
', 1)
INSERT [dbo].[Feature] ([FeatureId], [FeatureDescrition], [IterationId]) VALUES (23, N'login module
', 1)
INSERT [dbo].[Feature] ([FeatureId], [FeatureDescrition], [IterationId]) VALUES (25, N'patient authentication
', 3)
INSERT [dbo].[Feature] ([FeatureId], [FeatureDescrition], [IterationId]) VALUES (26, N'patient medication form
', 2)
INSERT [dbo].[Feature] ([FeatureId], [FeatureDescrition], [IterationId]) VALUES (28, N'patient e-bill
', 1)
INSERT [dbo].[Feature] ([FeatureId], [FeatureDescrition], [IterationId]) VALUES (31, N'patient reporting
', 2)
SET IDENTITY_INSERT [dbo].[Feature] OFF
INSERT [dbo].[Iteration] ([IterationID], [StartDate], [EndDate]) VALUES (1, N'2010/6/1', N'2012/7/1')
INSERT [dbo].[Iteration] ([IterationID], [StartDate], [EndDate]) VALUES (2, N'2000/3/1', N'2001/7/1')
INSERT [dbo].[Iteration] ([IterationID], [StartDate], [EndDate]) VALUES (3, N'2003/4/1', N'2004/8/1')
SET IDENTITY_INSERT [dbo].[Phone] ON 

INSERT [dbo].[Phone] ([PhoneId], [TypeId], [Number]) VALUES (5, 1, N'8188022202')
INSERT [dbo].[Phone] ([PhoneId], [TypeId], [Number]) VALUES (7, 3, N'8188022201')
INSERT [dbo].[Phone] ([PhoneId], [TypeId], [Number]) VALUES (22, 3, N'178-763-98764
')
INSERT [dbo].[Phone] ([PhoneId], [TypeId], [Number]) VALUES (23, 3, N'179-397-87968
')
INSERT [dbo].[Phone] ([PhoneId], [TypeId], [Number]) VALUES (24, 1, N'1-28-397863896

')
INSERT [dbo].[Phone] ([PhoneId], [TypeId], [Number]) VALUES (25, 1, N'123-485-8973
')
SET IDENTITY_INSERT [dbo].[Phone] OFF
SET IDENTITY_INSERT [dbo].[PhoneTypes] ON 

INSERT [dbo].[PhoneTypes] ([PhoneTypeId], [PhoneType], [PhoneName]) VALUES (1, N'work', N'iphone4')
INSERT [dbo].[PhoneTypes] ([PhoneTypeId], [PhoneType], [PhoneName]) VALUES (3, N'mobile', N'galax5x')
INSERT [dbo].[PhoneTypes] ([PhoneTypeId], [PhoneType], [PhoneName]) VALUES (9, N'', N'')
SET IDENTITY_INSERT [dbo].[PhoneTypes] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductDescription], [VersionId]) VALUES (1, N'EHR System', N'health records system for the patients', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Version] ON 

INSERT [dbo].[Version] ([VersionID], [VersionNumber], [platform]) VALUES (1, N'1.1', N'Windows')
INSERT [dbo].[Version] ([VersionID], [VersionNumber], [platform]) VALUES (2, N'1.1', N'Windows')
INSERT [dbo].[Version] ([VersionID], [VersionNumber], [platform]) VALUES (3, N'1.2', N'Linux')
INSERT [dbo].[Version] ([VersionID], [VersionNumber], [platform]) VALUES (4, N'2.1', N'Windows')
INSERT [dbo].[Version] ([VersionID], [VersionNumber], [platform]) VALUES (5, N'2.2', N'Linux')
SET IDENTITY_INSERT [dbo].[Version] OFF
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Address1] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Address1]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Company]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Phone] FOREIGN KEY([PhoneId])
REFERENCES [dbo].[Phone] ([PhoneId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Phone]
GO
ALTER TABLE [dbo].[CustomerRelease]  WITH CHECK ADD  CONSTRAINT [FK_CustomerRelease_Feature] FOREIGN KEY([FeatureId])
REFERENCES [dbo].[Feature] ([FeatureId])
GO
ALTER TABLE [dbo].[CustomerRelease] CHECK CONSTRAINT [FK_CustomerRelease_Feature]
GO
ALTER TABLE [dbo].[DownLoad]  WITH CHECK ADD  CONSTRAINT [FK_DownLoad_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[DownLoad] CHECK CONSTRAINT [FK_DownLoad_Customer]
GO
ALTER TABLE [dbo].[DownLoad]  WITH CHECK ADD  CONSTRAINT [FK_DownLoad_CustomerRelease] FOREIGN KEY([CustomerReleaseId])
REFERENCES [dbo].[CustomerRelease] ([CustomerReleaseId])
GO
ALTER TABLE [dbo].[DownLoad] CHECK CONSTRAINT [FK_DownLoad_CustomerRelease]
GO
ALTER TABLE [dbo].[DownLoad]  WITH CHECK ADD  CONSTRAINT [FK_DownLoad_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[DownLoad] CHECK CONSTRAINT [FK_DownLoad_Product]
GO
ALTER TABLE [dbo].[Feature]  WITH CHECK ADD  CONSTRAINT [FK_Feature_Iteration] FOREIGN KEY([IterationId])
REFERENCES [dbo].[Iteration] ([IterationID])
GO
ALTER TABLE [dbo].[Feature] CHECK CONSTRAINT [FK_Feature_Iteration]
GO
ALTER TABLE [dbo].[Phone]  WITH CHECK ADD  CONSTRAINT [FK_Phone_PhoneTypes] FOREIGN KEY([TypeId])
REFERENCES [dbo].[PhoneTypes] ([PhoneTypeId])
GO
ALTER TABLE [dbo].[Phone] CHECK CONSTRAINT [FK_Phone_PhoneTypes]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Version] FOREIGN KEY([VersionId])
REFERENCES [dbo].[Version] ([VersionID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Version]
GO
ALTER TABLE [dbo].[Release]  WITH CHECK ADD  CONSTRAINT [FK_Release_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchID])
GO
ALTER TABLE [dbo].[Release] CHECK CONSTRAINT [FK_Release_Branch]
GO
