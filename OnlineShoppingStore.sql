USE [master]
GO
/****** Object:  Database [OnlineShoppingStore]    Script Date: 7/28/2016 10:38:14 AM ******/
CREATE DATABASE [OnlineShoppingStore]
 GO
ALTER DATABASE [OnlineShoppingStore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShoppingStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShoppingStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OnlineShoppingStore] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShoppingStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShoppingStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShoppingStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineShoppingStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShoppingStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineShoppingStore] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShoppingStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShoppingStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShoppingStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShoppingStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [OnlineShoppingStore]
GO
/****** Object:  Table [dbo].[BillingAddress]    Script Date: 7/28/2016 10:38:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillingAddress](
	[PKAddressId] [int] IDENTITY(1,1) NOT NULL,
	[FKUserId] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NULL,
	[AddressLine1] [varchar](max) NOT NULL,
	[AddressLine2] [varchar](max) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[ZipCode] [bigint] NOT NULL,
 CONSTRAINT [PK_UserShippingAddress] PRIMARY KEY CLUSTERED 
(
	[PKAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/28/2016 10:38:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[PKCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[FKCreatedByUserId] [int] NULL,
	[FKUpdatedByUserId] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[PKCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ErrorHistory]    Script Date: 7/28/2016 10:38:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ErrorHistory](
	[PKErrorId] [int] IDENTITY(1,1) NOT NULL,
	[FKUserId] [int] NULL,
	[ErrorMessage] [varchar](max) NOT NULL,
	[ControllerName] [varchar](50) NOT NULL,
	[ActionName] [varchar](50) NOT NULL,
	[ErrorLogTime] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ErrorHistory] PRIMARY KEY CLUSTERED 
(
	[PKErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/28/2016 10:38:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[PKOrderId] [int] IDENTITY(1,1) NOT NULL,
	[FKCustomerUserId] [int] NOT NULL,
	[FKBillingAddressId] [int] NOT NULL,
	[FKProcessByUserId] [int] NULL,
	[OrderDate] [datetime] NOT NULL,
	[DeliveredDate] [datetime] NULL,
	[CustomerComment] [varchar](max) NULL,
	[AdminComment] [varchar](max) NULL,
	[Status] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[PKOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/28/2016 10:38:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[PKOrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[FKProductId] [int] NOT NULL,
	[FKOrderId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[PKOrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderHistory]    Script Date: 7/28/2016 10:38:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderHistory](
	[PKOrderHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[FKOrderId] [int] NOT NULL,
	[Description] [varchar](max) NULL,
	[Status] [varchar](20) NOT NULL,
	[DateChanged] [datetime] NULL,
 CONSTRAINT [PK_OrderHistory] PRIMARY KEY CLUSTERED 
(
	[PKOrderHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/28/2016 10:38:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[PKProductId] [int] IDENTITY(1,1) NOT NULL,
	[FKCategoryId] [int] NOT NULL,
	[FKSubCategoryId] [int] NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[FKCreatedByUserId] [int] NULL,
	[FKUpdatedByUserId] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[PKProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 7/28/2016 10:38:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductImage](
	[PKImageId] [int] IDENTITY(1,1) NOT NULL,
	[FKProductId] [int] NOT NULL,
	[ImageName] [varchar](50) NOT NULL,
	[ImagePath] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[PKImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/28/2016 10:38:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[PKRoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[PKRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 7/28/2016 10:38:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCategory](
	[PKSubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[FKCategoryId] [int] NOT NULL,
	[SubCategoryName] [varchar](50) NOT NULL,
	[ImageName] [varchar](50) NOT NULL,
	[ImagePath] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[FKCreatedByUserId] [int] NOT NULL,
	[FKUpdatedByUserId] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[PKSubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserLoginHistory]    Script Date: 7/28/2016 10:38:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLoginHistory](
	[PKUserLoginHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[FKUserId] [int] NOT NULL,
	[LoginDateTime] [datetime] NOT NULL,
	[IPAddress] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_UserLoginHistory] PRIMARY KEY CLUSTERED 
(
	[PKUserLoginHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 7/28/2016 10:38:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserProfile](
	[PKUserId] [int] IDENTITY(1,1) NOT NULL,
	[FKRoleId] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NULL,
	[EmailId] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[MobileNo] [varchar](20) NOT NULL,
	[AddressLine1] [varchar](max) NOT NULL,
	[AddressLine2] [varchar](max) NULL,
	[City] [varchar](20) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[Country] [varchar](20) NOT NULL,
	[ZipCode] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedByUserId] [int] NULL,
	[UpdatedByUserId] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[PKUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BillingAddress] ON 

INSERT [dbo].[BillingAddress] ([PKAddressId], [FKUserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZipCode]) VALUES (2208, 8, N'sa', N'sa', N'roads', N'ss', N'Hyderabad', N'Tg', N'india', 78987)
INSERT [dbo].[BillingAddress] ([PKAddressId], [FKUserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZipCode]) VALUES (2209, 8, N'dd', N'dd', N'ee', N'ff', N'Hyderabad', N'ddd', N'india', 456654)
INSERT [dbo].[BillingAddress] ([PKAddressId], [FKUserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZipCode]) VALUES (2210, 8, N'sa', N's', N'sss', N'aa', N'Hyderabad', N'Tg', N'india', 123456)
INSERT [dbo].[BillingAddress] ([PKAddressId], [FKUserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZipCode]) VALUES (2211, 9, N'Vijay', N'D', N'Road No32,Baj.Hills', NULL, N'Hyderabad', N'Telangana', N'India', 500016)
SET IDENTITY_INSERT [dbo].[BillingAddress] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([PKCategoryId], [CategoryName], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (18, N'Mobiless', CAST(0x0000A6040121DB20 AS DateTime), CAST(0x0000A60B01022C0D AS DateTime), 1, 1, 1)
INSERT [dbo].[Category] ([PKCategoryId], [CategoryName], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (19, N'Laptops', CAST(0x0000A60A012E6CE5 AS DateTime), CAST(0x0000A60A012E6D65 AS DateTime), 1, 1, 1)
INSERT [dbo].[Category] ([PKCategoryId], [CategoryName], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (20, N'Tools', CAST(0x0000A60A012E3604 AS DateTime), CAST(0x0000A64A01240044 AS DateTime), 1, 1, 1)
INSERT [dbo].[Category] ([PKCategoryId], [CategoryName], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (21, N'Clothes', CAST(0x0000A605011F2730 AS DateTime), CAST(0x0000A60A010F9E9E AS DateTime), 1, 1, 1)
INSERT [dbo].[Category] ([PKCategoryId], [CategoryName], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (25, N'Watches', CAST(0x0000A60A013366AD AS DateTime), CAST(0x0000A60A0133673E AS DateTime), 1, 1, 1)
INSERT [dbo].[Category] ([PKCategoryId], [CategoryName], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (27, N'Books', CAST(0x0000A60A00F3DD4C AS DateTime), CAST(0x0000A60A00F4B03C AS DateTime), 1, 1, 1)
INSERT [dbo].[Category] ([PKCategoryId], [CategoryName], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (31, N'Machines', CAST(0x0000A60A0133A058 AS DateTime), CAST(0x0000A62D01166683 AS DateTime), 1, 1, 1)
INSERT [dbo].[Category] ([PKCategoryId], [CategoryName], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (32, N'TV', CAST(0x0000A60A013AF6DC AS DateTime), CAST(0x0000A62D01164B58 AS DateTime), 1, 1, 1)
INSERT [dbo].[Category] ([PKCategoryId], [CategoryName], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (34, N'Gifts', CAST(0x0000A60B01050651 AS DateTime), CAST(0x0000A60B010510DF AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[ErrorHistory] ON 

INSERT [dbo].[ErrorHistory] ([PKErrorId], [FKUserId], [ErrorMessage], [ControllerName], [ActionName], [ErrorLogTime], [IsActive]) VALUES (1010, NULL, N'The required anti-forgery form field "__RequestVerificationToken" is not present.', N'Category', N'Create', CAST(0x0000A637012E6973 AS DateTime), 1)
INSERT [dbo].[ErrorHistory] ([PKErrorId], [FKUserId], [ErrorMessage], [ControllerName], [ActionName], [ErrorLogTime], [IsActive]) VALUES (1025, 1, N'Encountered end tag "div" with no matching start tag.  Are your start/end tags properly balanced?
', N'UserProfile', N'Edit', CAST(0x0000A64B0110D3EC AS DateTime), 1)
INSERT [dbo].[ErrorHistory] ([PKErrorId], [FKUserId], [ErrorMessage], [ControllerName], [ActionName], [ErrorLogTime], [IsActive]) VALUES (1026, 9, N'The parameters dictionary contains a null entry for parameter ''total'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult GetShowCartDetails(Int32, Int32, Int32, System.String)'' in ''OnlineShoppingStoreMVCUsingLinq.Controllers.ShoppingCartController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'ShoppingCart', N'GetShowCartDetails', CAST(0x0000A64B01474A09 AS DateTime), 1)
INSERT [dbo].[ErrorHistory] ([PKErrorId], [FKUserId], [ErrorMessage], [ControllerName], [ActionName], [ErrorLogTime], [IsActive]) VALUES (1027, NULL, N'The view ''Index'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Account/Index.aspx
~/Views/Account/Index.ascx
~/Views/Shared/Index.aspx
~/Views/Shared/Index.ascx
~/Views/Account/Index.cshtml
~/Views/Account/Index.vbhtml
~/Views/Shared/Index.cshtml
~/Views/Shared/Index.vbhtml', N'Account', N'Index', CAST(0x0000A64C00C8B872 AS DateTime), 1)
INSERT [dbo].[ErrorHistory] ([PKErrorId], [FKUserId], [ErrorMessage], [ControllerName], [ActionName], [ErrorLogTime], [IsActive]) VALUES (1028, 8, N'The parameters dictionary contains a null entry for parameter ''total'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult GetShowCartDetails(Int32, Int32, Int32, System.String)'' in ''OnlineShoppingStoreMVCUsingLinq.Controllers.ShoppingCartController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'ShoppingCart', N'GetShowCartDetails', CAST(0x0000A64C00D6B186 AS DateTime), 1)
INSERT [dbo].[ErrorHistory] ([PKErrorId], [FKUserId], [ErrorMessage], [ControllerName], [ActionName], [ErrorLogTime], [IsActive]) VALUES (1029, 8, N'The parameters dictionary contains a null entry for parameter ''total'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult GetShowCartDetails(Int32, Int32, Int32, System.String)'' in ''OnlineShoppingStoreMVCUsingLinq.Controllers.ShoppingCartController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'ShoppingCart', N'GetShowCartDetails', CAST(0x0000A64C00DAB57A AS DateTime), 1)
INSERT [dbo].[ErrorHistory] ([PKErrorId], [FKUserId], [ErrorMessage], [ControllerName], [ActionName], [ErrorLogTime], [IsActive]) VALUES (1030, 8, N'The parameters dictionary contains a null entry for parameter ''total'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult GetShowCartDetails(Int32, Int32, Int32, System.String)'' in ''OnlineShoppingStoreMVCUsingLinq.Controllers.ShoppingCartController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'ShoppingCart', N'GetShowCartDetails', CAST(0x0000A64C00DB7974 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ErrorHistory] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([PKOrderId], [FKCustomerUserId], [FKBillingAddressId], [FKProcessByUserId], [OrderDate], [DeliveredDate], [CustomerComment], [AdminComment], [Status]) VALUES (1169, 8, 2208, 8, CAST(0x0000A62D01175178 AS DateTime), CAST(0x0000A64B00000000 AS DateTime), N'good', N'Thanking you', N'Delivered')
INSERT [dbo].[Order] ([PKOrderId], [FKCustomerUserId], [FKBillingAddressId], [FKProcessByUserId], [OrderDate], [DeliveredDate], [CustomerComment], [AdminComment], [Status]) VALUES (1170, 8, 2209, 8, CAST(0x0000A62E00CBC028 AS DateTime), CAST(0x0000A64B00000000 AS DateTime), N'good', N'Thanking you for placing', N'Processing')
INSERT [dbo].[Order] ([PKOrderId], [FKCustomerUserId], [FKBillingAddressId], [FKProcessByUserId], [OrderDate], [DeliveredDate], [CustomerComment], [AdminComment], [Status]) VALUES (1171, 8, 2210, 8, CAST(0x0000A62E0106DEEC AS DateTime), CAST(0x0000A64C00000000 AS DateTime), N'good', N'In correct Address ', N'Cancelled')
INSERT [dbo].[Order] ([PKOrderId], [FKCustomerUserId], [FKBillingAddressId], [FKProcessByUserId], [OrderDate], [DeliveredDate], [CustomerComment], [AdminComment], [Status]) VALUES (1172, 9, 2211, 9, CAST(0x0000A64A012643A4 AS DateTime), CAST(0x0000A64B00000000 AS DateTime), N'Good', N'Thanking you for placing', N'Processing')
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([PKOrderDetailId], [FKProductId], [FKOrderId], [Quantity], [Cost]) VALUES (1153, 1085, 1169, 2, 90000.0000)
INSERT [dbo].[OrderDetail] ([PKOrderDetailId], [FKProductId], [FKOrderId], [Quantity], [Cost]) VALUES (1154, 1085, 1170, 1, 180000000.0000)
INSERT [dbo].[OrderDetail] ([PKOrderDetailId], [FKProductId], [FKOrderId], [Quantity], [Cost]) VALUES (1155, 1089, 1171, 2, 998.0000)
INSERT [dbo].[OrderDetail] ([PKOrderDetailId], [FKProductId], [FKOrderId], [Quantity], [Cost]) VALUES (1156, 1090, 1172, 1, 899.0000)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[OrderHistory] ON 

INSERT [dbo].[OrderHistory] ([PKOrderHistoryId], [FKOrderId], [Description], [Status], [DateChanged]) VALUES (1133, 1171, N'In correct Address ', N'Cancelled', CAST(0x0000A62E0106E04E AS DateTime))
INSERT [dbo].[OrderHistory] ([PKOrderHistoryId], [FKOrderId], [Description], [Status], [DateChanged]) VALUES (1134, 1172, N'Thanking you for placing', N'Processing', CAST(0x0000A64A01264720 AS DateTime))
SET IDENTITY_INSERT [dbo].[OrderHistory] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([PKProductId], [FKCategoryId], [FKSubCategoryId], [ProductName], [Description], [Quantity], [Price], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1085, 18, 1019, N'Iphone', N'6s', 4, 45000.0000, CAST(0x0000A62D0113C9CF AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([PKProductId], [FKCategoryId], [FKSubCategoryId], [ProductName], [Description], [Quantity], [Price], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1086, 19, 1020, N'Dell mini', N'4 Gb Ram', 4, 35000.0000, CAST(0x0000A62D01140646 AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([PKProductId], [FKCategoryId], [FKSubCategoryId], [ProductName], [Description], [Quantity], [Price], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1087, 19, 1027, N'Sony Viavo', N'4 Gb Ram', 6, 38289.0000, CAST(0x0000A62D011453D7 AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([PKProductId], [FKCategoryId], [FKSubCategoryId], [ProductName], [Description], [Quantity], [Price], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1088, 20, 1021, N'Driller', N'0.3mm', 2, 4505.0000, CAST(0x0000A62D0114B219 AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([PKProductId], [FKCategoryId], [FKSubCategoryId], [ProductName], [Description], [Quantity], [Price], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1089, 21, 1025, N'PlayBoy', N' size:32 ', 3, 599.0000, CAST(0x0000A62D0115111A AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([PKProductId], [FKCategoryId], [FKSubCategoryId], [ProductName], [Description], [Quantity], [Price], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1090, 25, 1028, N'Fossil', N'Good', 3, 899.0000, CAST(0x0000A62D01153940 AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([PKProductId], [FKCategoryId], [FKSubCategoryId], [ProductName], [Description], [Quantity], [Price], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1091, 25, 1033, N'Fast Track', N'Good', 2, 459.0000, CAST(0x0000A62D01155C15 AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([PKProductId], [FKCategoryId], [FKSubCategoryId], [ProductName], [Description], [Quantity], [Price], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1092, 27, 2040, N'Animation', N'Good Techincial Book', 5, 893.0000, CAST(0x0000A62D01159A38 AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([PKProductId], [FKCategoryId], [FKSubCategoryId], [ProductName], [Description], [Quantity], [Price], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1093, 34, 1037, N'Flowers', N'ffffffsjdgvsk', 3, 897.0000, CAST(0x0000A62D0115D363 AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([PKProductId], [FKCategoryId], [FKSubCategoryId], [ProductName], [Description], [Quantity], [Price], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1094, 32, 1030, N'i Tv', N'28 inches', 1, 45624.0000, CAST(0x0000A62D011605DE AS DateTime), NULL, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([PKImageId], [FKProductId], [ImageName], [ImagePath]) VALUES (2080, 1085, N'iphone6.jpg', N'/Images/iphone6.jpg')
INSERT [dbo].[ProductImage] ([PKImageId], [FKProductId], [ImageName], [ImagePath]) VALUES (2081, 1086, N'DellMini.jpg', N'/Images/DellMini.jpg')
INSERT [dbo].[ProductImage] ([PKImageId], [FKProductId], [ImageName], [ImagePath]) VALUES (2082, 1087, N'SonyVio.jpg', N'/Images/SonyVio.jpg')
INSERT [dbo].[ProductImage] ([PKImageId], [FKProductId], [ImageName], [ImagePath]) VALUES (2083, 1088, N'driller.jpg', N'/Images/driller.jpg')
INSERT [dbo].[ProductImage] ([PKImageId], [FKProductId], [ImageName], [ImagePath]) VALUES (2084, 1089, N'PlayBoyShirt1.jpg', N'/Images/PlayBoyShirt1.jpg')
INSERT [dbo].[ProductImage] ([PKImageId], [FKProductId], [ImageName], [ImagePath]) VALUES (2085, 1090, N'Fossil.jpg', N'/Images/Fossil.jpg')
INSERT [dbo].[ProductImage] ([PKImageId], [FKProductId], [ImageName], [ImagePath]) VALUES (2086, 1091, N'fastrackLarge.jpeg', N'/Images/fastrackLarge.jpeg')
INSERT [dbo].[ProductImage] ([PKImageId], [FKProductId], [ImageName], [ImagePath]) VALUES (2087, 1092, N'best-animation-books-timing-for-animation.jpg', N'/Images/best-animation-books-timing-for-animation.jpg')
INSERT [dbo].[ProductImage] ([PKImageId], [FKProductId], [ImageName], [ImagePath]) VALUES (2088, 1093, N'flowers.jpg', N'/Images/flowers.jpg')
INSERT [dbo].[ProductImage] ([PKImageId], [FKProductId], [ImageName], [ImagePath]) VALUES (2089, 1094, N'iTv2.jpg', N'/Images/iTv2.jpg')
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([PKRoleId], [RoleName], [IsActive]) VALUES (1, N'Admin', 1)
INSERT [dbo].[Role] ([PKRoleId], [RoleName], [IsActive]) VALUES (2, N'User', 1)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([PKSubCategoryId], [FKCategoryId], [SubCategoryName], [ImageName], [ImagePath], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1019, 18, N'Apple', N'apple.png', N'/Images/apple.png', CAST(0x0000A60401223FE8 AS DateTime), CAST(0x0000A62D01254BC9 AS DateTime), 1, 1, 1)
INSERT [dbo].[SubCategory] ([PKSubCategoryId], [FKCategoryId], [SubCategoryName], [ImageName], [ImagePath], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1020, 19, N'Dell', N'Dell.ico', N'/Images/Dell.ico', CAST(0x0000A60401225D34 AS DateTime), CAST(0x0000A62D0125DF02 AS DateTime), 1, 1, 1)
INSERT [dbo].[SubCategory] ([PKSubCategoryId], [FKCategoryId], [SubCategoryName], [ImageName], [ImagePath], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1021, 20, N'Driller', N'driller.jpg', N'/Images/driller.jpg', CAST(0x0000A604012274A4 AS DateTime), CAST(0x0000A62B00F9F6E1 AS DateTime), 1, 1, 1)
INSERT [dbo].[SubCategory] ([PKSubCategoryId], [FKCategoryId], [SubCategoryName], [ImageName], [ImagePath], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1022, 21, N'Peaks', N'shirtS.png', N'/Images/shirtS.png', CAST(0x0000A605011F58F0 AS DateTime), CAST(0x0000A62B00FA0EEC AS DateTime), 1, 1, 1)
INSERT [dbo].[SubCategory] ([PKSubCategoryId], [FKCategoryId], [SubCategoryName], [ImageName], [ImagePath], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1023, 18, N'Nokia', N'Nokia.png', N'/Images/Nokia.png', CAST(0x0000A606009CFD74 AS DateTime), CAST(0x0000A62D01266AAB AS DateTime), 1, 1, 1)
INSERT [dbo].[SubCategory] ([PKSubCategoryId], [FKCategoryId], [SubCategoryName], [ImageName], [ImagePath], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1025, 21, N'PlayBoy', N'Playboy.png', N'/Images/Playboy.png', CAST(0x0000A60600D87C50 AS DateTime), CAST(0x0000A62D012F6245 AS DateTime), 1, 1, 1)
INSERT [dbo].[SubCategory] ([PKSubCategoryId], [FKCategoryId], [SubCategoryName], [ImageName], [ImagePath], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1026, 18, N'Acer', N'acer.jpg', N'/Images/acer.jpg', CAST(0x0000A606012DA70C AS DateTime), CAST(0x0000A62D012EA804 AS DateTime), 1, 1, 1)
INSERT [dbo].[SubCategory] ([PKSubCategoryId], [FKCategoryId], [SubCategoryName], [ImageName], [ImagePath], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1027, 19, N'Sony', N'sony.png', N'/Images/sony.png', CAST(0x0000A606012DD718 AS DateTime), CAST(0x0000A62D012BF4BF AS DateTime), 1, 1, 1)
INSERT [dbo].[SubCategory] ([PKSubCategoryId], [FKCategoryId], [SubCategoryName], [ImageName], [ImagePath], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1028, 25, N'Fossil', N'Fossil usa.jpg', N'/Images/Fossil usa.jpg', CAST(0x0000A60A0121464C AS DateTime), CAST(0x0000A62D01284677 AS DateTime), 1, 1, 1)
INSERT [dbo].[SubCategory] ([PKSubCategoryId], [FKCategoryId], [SubCategoryName], [ImageName], [ImagePath], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1029, 31, N'driller', N'Drill.jpg', N'/Images/Drill.jpg', CAST(0x0000A60A013210BC AS DateTime), CAST(0x0000A62B00FBE47C AS DateTime), 1, 1, 1)
INSERT [dbo].[SubCategory] ([PKSubCategoryId], [FKCategoryId], [SubCategoryName], [ImageName], [ImagePath], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1030, 32, N'LTV', N'ITV .png', N'/Images/ITV .png', CAST(0x0000A60A013B8CDC AS DateTime), CAST(0x0000A62D012FAB98 AS DateTime), 1, 1, 1)
INSERT [dbo].[SubCategory] ([PKSubCategoryId], [FKCategoryId], [SubCategoryName], [ImageName], [ImagePath], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1032, 27, N'Vijay', N'top-10-animation-books.jpg', N'/Images/top-10-animation-books.jpg', CAST(0x0000A60B00D0AAC0 AS DateTime), CAST(0x0000A62B00FABF1B AS DateTime), 1, 1, 1)
INSERT [dbo].[SubCategory] ([PKSubCategoryId], [FKCategoryId], [SubCategoryName], [ImageName], [ImagePath], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1033, 25, N'Fast', N'Fastrack.jpg', N'/Images/Fastrack.jpg', CAST(0x0000A60B00D10754 AS DateTime), CAST(0x0000A62D0127214F AS DateTime), 1, 1, 1)
INSERT [dbo].[SubCategory] ([PKSubCategoryId], [FKCategoryId], [SubCategoryName], [ImageName], [ImagePath], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (1037, 34, N'SSD', N'flowers.jpg', N'/Images/flowers.jpg', CAST(0x0000A60C010722E4 AS DateTime), CAST(0x0000A62B00FAD074 AS DateTime), 1, 1, 1)
INSERT [dbo].[SubCategory] ([PKSubCategoryId], [FKCategoryId], [SubCategoryName], [ImageName], [ImagePath], [CreatedDate], [UpdatedDate], [FKCreatedByUserId], [FKUpdatedByUserId], [IsActive]) VALUES (2040, 27, N'techonology', N'best-animation-books-timing-for-animation.jpg', N'/Images/best-animation-books-timing-for-animation.jpg', CAST(0x0000A62500DDE8FC AS DateTime), CAST(0x0000A62500F360D1 AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[UserLoginHistory] ON 

INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (9900, 1, CAST(0x0000A62D01138D63 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (9901, 8, CAST(0x0000A62D0116E5F3 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (9902, 1, CAST(0x0000A62D01251873 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (9903, 1, CAST(0x0000A62D012BAD34 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (9904, 1, CAST(0x0000A62D012E7C98 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (9905, 1, CAST(0x0000A62E00CAFBD8 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (9906, 8, CAST(0x0000A62E00CB597E AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (9907, 8, CAST(0x0000A62E0106523C AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (9908, 1, CAST(0x0000A62E01105551 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (9909, 9, CAST(0x0000A62E0113BCD2 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (9910, 9, CAST(0x0000A62E011CD431 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (9911, 8, CAST(0x0000A62F00A40AFF AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (9912, 8, CAST(0x0000A62F00A55426 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (9913, 8, CAST(0x0000A62F00B78603 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (9914, 1, CAST(0x0000A62F00DBBDE9 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10914, 1, CAST(0x0000A62F011D8D56 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10915, 1, CAST(0x0000A62F0124A9C1 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10916, 1, CAST(0x0000A62F01285F63 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10917, 1, CAST(0x0000A62F0134C802 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10918, 8, CAST(0x0000A62F0135F208 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10919, 8, CAST(0x0000A62F01373DCB AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10920, 1, CAST(0x0000A62F01374566 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10921, 8, CAST(0x0000A63000B244EA AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10922, 8, CAST(0x0000A63000BFA2FB AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10923, 8, CAST(0x0000A63000E9CF7B AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10924, 1, CAST(0x0000A63000EB53C9 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10925, 8, CAST(0x0000A63001248B48 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10926, 8, CAST(0x0000A6300124CA54 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10927, 1, CAST(0x0000A6320121CD9E AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10928, 1, CAST(0x0000A6320129F4C3 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10929, 1, CAST(0x0000A637012E43A0 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10930, 1, CAST(0x0000A64A00FC0238 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10931, 1, CAST(0x0000A64A010B6830 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10932, 1, CAST(0x0000A64A010DFBCA AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10933, 1, CAST(0x0000A64A011107CC AS DateTime), N'127.0.0.1')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10934, 1, CAST(0x0000A64A0112BCB3 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10935, 1, CAST(0x0000A64A0123AFED AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10936, 8, CAST(0x0000A64A0124C87D AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10937, 9, CAST(0x0000A64A0124E2FC AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10938, 8, CAST(0x0000A64A01270AC3 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10939, 1, CAST(0x0000A64A01279138 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10940, 1, CAST(0x0000A64A0129C9D8 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10941, 1, CAST(0x0000A64B0106AA71 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10942, 1, CAST(0x0000A64B010D0560 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10943, 1, CAST(0x0000A64B01115487 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10944, 1, CAST(0x0000A64B0119C412 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10945, 1, CAST(0x0000A64B011FCD83 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10946, 1, CAST(0x0000A64B01330E97 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10947, 9, CAST(0x0000A64B013858EA AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10948, 9, CAST(0x0000A64B013911AB AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10949, 1, CAST(0x0000A64C00CF5614 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10950, 8, CAST(0x0000A64C00D69739 AS DateTime), N'172.16.1.32')
INSERT [dbo].[UserLoginHistory] ([PKUserLoginHistoryId], [FKUserId], [LoginDateTime], [IPAddress]) VALUES (10951, 1, CAST(0x0000A64C01061508 AS DateTime), N'172.16.1.32')
SET IDENTITY_INSERT [dbo].[UserLoginHistory] OFF
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([PKUserId], [FKRoleId], [UserName], [FirstName], [LastName], [EmailId], [Password], [MobileNo], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZipCode], [CreatedDate], [UpdatedDate], [CreatedByUserId], [UpdatedByUserId], [IsActive]) VALUES (1, 1, N'Admin', N'Ad', N'min', N'Admin@Store.Com', N'Admin', N'8794652316', N'Roadno12', N'qwerty', N'Hyd', N'AP', N'India', 123456, CAST(0x0000A5FB00000000 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[UserProfile] ([PKUserId], [FKRoleId], [UserName], [FirstName], [LastName], [EmailId], [Password], [MobileNo], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZipCode], [CreatedDate], [UpdatedDate], [CreatedByUserId], [UpdatedByUserId], [IsActive]) VALUES (8, 2, N'sa', N's', N'a', N'san@gmail.com', N'123', N'8974563218', N'BanjaraHills', N'Road no:-32', N'Hyderabad', N'Telangana', N'India', 500016, CAST(0x0000A5FD0135BC94 AS DateTime), CAST(0x0000A64B0113DBCF AS DateTime), 1, 1, 1)
INSERT [dbo].[UserProfile] ([PKUserId], [FKRoleId], [UserName], [FirstName], [LastName], [EmailId], [Password], [MobileNo], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZipCode], [CreatedDate], [UpdatedDate], [CreatedByUserId], [UpdatedByUserId], [IsActive]) VALUES (9, 2, N'Anr', N'Alex', NULL, N'Anr@gmail.com', N'456', N'4789563214', N'D.No:324,DollyVarden st', N'Gambell', N'Adak', N'Sydney', N'Australia', 99546, CAST(0x0000A5FF00F77538 AS DateTime), CAST(0x0000A64B011A1969 AS DateTime), 1, 1, 1)
INSERT [dbo].[UserProfile] ([PKUserId], [FKRoleId], [UserName], [FirstName], [LastName], [EmailId], [Password], [MobileNo], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZipCode], [CreatedDate], [UpdatedDate], [CreatedByUserId], [UpdatedByUserId], [IsActive]) VALUES (10, 2, N'venkat', N'reddy', N'innnn', N'venkat@gmail.com', N'12345', N'8975625410', N'D.No:-1-2/5,Gandhinagar', NULL, N'Vijayawada', N'Andhra Pradesh', N'India', 520001, CAST(0x0000A602010A2AAC AS DateTime), CAST(0x0000A64B0113420B AS DateTime), NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Category__8517B2E0C89F843F]    Script Date: 7/28/2016 10:38:15 AM ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [UQ__Category__8517B2E0C89F843F] UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Product__DD5A978A234468D9]    Script Date: 7/28/2016 10:38:15 AM ******/
ALTER TABLE [dbo].[Product] ADD UNIQUE NONCLUSTERED 
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Product__DD5A978A2ACEC824]    Script Date: 7/28/2016 10:38:15 AM ******/
ALTER TABLE [dbo].[Product] ADD UNIQUE NONCLUSTERED 
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__UserProf__C9F28456A14ED13B]    Script Date: 7/28/2016 10:38:15 AM ******/
ALTER TABLE [dbo].[UserProfile] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__UserProf__C9F28456FB95BC05]    Script Date: 7/28/2016 10:38:15 AM ******/
ALTER TABLE [dbo].[UserProfile] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BillingAddress]  WITH CHECK ADD  CONSTRAINT [FK_BillingAddress_UserProfile] FOREIGN KEY([FKUserId])
REFERENCES [dbo].[UserProfile] ([PKUserId])
GO
ALTER TABLE [dbo].[BillingAddress] CHECK CONSTRAINT [FK_BillingAddress_UserProfile]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_UserProfile] FOREIGN KEY([FKCreatedByUserId])
REFERENCES [dbo].[UserProfile] ([PKUserId])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_UserProfile]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_UserProfile1] FOREIGN KEY([FKUpdatedByUserId])
REFERENCES [dbo].[UserProfile] ([PKUserId])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_UserProfile1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_BillingAddress] FOREIGN KEY([FKBillingAddressId])
REFERENCES [dbo].[BillingAddress] ([PKAddressId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_BillingAddress]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_UserProfile] FOREIGN KEY([FKProcessByUserId])
REFERENCES [dbo].[UserProfile] ([PKUserId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_UserProfile]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Orders_UserProfile1] FOREIGN KEY([FKCustomerUserId])
REFERENCES [dbo].[UserProfile] ([PKUserId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Orders_UserProfile1]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([FKOrderId])
REFERENCES [dbo].[Order] ([PKOrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product1] FOREIGN KEY([FKProductId])
REFERENCES [dbo].[Product] ([PKProductId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product1]
GO
ALTER TABLE [dbo].[OrderHistory]  WITH CHECK ADD  CONSTRAINT [FK_OrderHistory_Orders] FOREIGN KEY([FKOrderId])
REFERENCES [dbo].[Order] ([PKOrderId])
GO
ALTER TABLE [dbo].[OrderHistory] CHECK CONSTRAINT [FK_OrderHistory_Orders]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([FKCategoryId])
REFERENCES [dbo].[Category] ([PKCategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([FKSubCategoryId])
REFERENCES [dbo].[SubCategory] ([PKSubCategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_UserProfile] FOREIGN KEY([FKUpdatedByUserId])
REFERENCES [dbo].[UserProfile] ([PKUserId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_UserProfile]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_UserProfile1] FOREIGN KEY([FKCreatedByUserId])
REFERENCES [dbo].[UserProfile] ([PKUserId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_UserProfile1]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Product] FOREIGN KEY([FKProductId])
REFERENCES [dbo].[Product] ([PKProductId])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_Product]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([FKCategoryId])
REFERENCES [dbo].[Category] ([PKCategoryId])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_UserProfile] FOREIGN KEY([FKCreatedByUserId])
REFERENCES [dbo].[UserProfile] ([PKUserId])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_UserProfile]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_UserProfile1] FOREIGN KEY([FKUpdatedByUserId])
REFERENCES [dbo].[UserProfile] ([PKUserId])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_UserProfile1]
GO
ALTER TABLE [dbo].[UserLoginHistory]  WITH CHECK ADD  CONSTRAINT [FK_UserLoginHistory_UserProfile] FOREIGN KEY([FKUserId])
REFERENCES [dbo].[UserProfile] ([PKUserId])
GO
ALTER TABLE [dbo].[UserLoginHistory] CHECK CONSTRAINT [FK_UserLoginHistory_UserProfile]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK__UserProfi__FKRol__5FB337D6] FOREIGN KEY([FKRoleId])
REFERENCES [dbo].[Role] ([PKRoleId])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK__UserProfi__FKRol__5FB337D6]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_UserProfile] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[UserProfile] ([PKUserId])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_UserProfile]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_UserProfile1] FOREIGN KEY([UpdatedByUserId])
REFERENCES [dbo].[UserProfile] ([PKUserId])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_UserProfile1]
GO
USE [master]
GO
ALTER DATABASE [OnlineShoppingStore] SET  READ_WRITE 
GO
