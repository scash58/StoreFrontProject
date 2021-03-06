/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5103)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK__Products__Manufa__44FF419A]
GO
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK__Products__Catego__45F365D3]
GO
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK__Orders__Customer__5070F446]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK__OrderDeta__Produ__534D60F1]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK__OrderDeta__Order__52593CB8]
GO
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK__Employees__Repor__4AB81AF0]
GO
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK__Employees__Depar__4BAC3F29]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 2/8/2022 4:30:47 PM ******/
DROP TABLE [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/8/2022 4:30:47 PM ******/
DROP TABLE [dbo].[Products]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/8/2022 4:30:47 PM ******/
DROP TABLE [dbo].[Orders]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2/8/2022 4:30:47 PM ******/
DROP TABLE [dbo].[OrderDetail]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 2/8/2022 4:30:47 PM ******/
DROP TABLE [dbo].[Manufacturer]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2/8/2022 4:30:47 PM ******/
DROP TABLE [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2/8/2022 4:30:47 PM ******/
DROP TABLE [dbo].[Department]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2/8/2022 4:30:47 PM ******/
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/8/2022 4:30:47 PM ******/
DROP TABLE [dbo].[Categories]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/8/2022 4:30:47 PM ******/
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/8/2022 4:30:47 PM ******/
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/8/2022 4:30:47 PM ******/
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/8/2022 4:30:47 PM ******/
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/8/2022 4:30:47 PM ******/
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/8/2022 4:30:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/8/2022 4:30:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/8/2022 4:30:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/8/2022 4:30:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/8/2022 4:30:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/8/2022 4:30:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](30) NOT NULL,
	[CategoryDesc] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2/8/2022 4:30:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[ZipCode] [varchar](9) NOT NULL,
	[Phone] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2/8/2022 4:30:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2/8/2022 4:30:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[Title] [nvarchar](20) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[ZipCode] [varchar](9) NULL,
	[ReportsToID] [int] NULL,
	[DepartmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 2/8/2022 4:30:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerID] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](30) NOT NULL,
	[ManufacturerDesc] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2/8/2022 4:30:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/8/2022 4:30:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [datetime] NOT NULL,
	[ShippedDate] [datetime] NULL,
	[Freight] [money] NULL,
	[ShipAddress] [varchar](50) NULL,
	[ShipCity] [varchar](50) NULL,
	[ShipState] [varchar](2) NULL,
	[ShipCountry] [varchar](30) NULL,
	[ShipZip] [varchar](9) NULL,
 CONSTRAINT [PK__Orders__C3905BAFF181C87D] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/8/2022 4:30:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](30) NULL,
	[ManufacturerID] [int] NULL,
	[CategoryID] [int] NULL,
	[UnitPrice] [money] NULL,
	[ProductDesc] [nvarchar](50) NULL,
	[ProductImage] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 2/8/2022 4:30:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](75) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'd5fd71be-48e8-4aee-b1d0-472367fffaaa', N'Admin')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bc2a77c6-eae9-4437-80bf-3782b69061ba', N'd5fd71be-48e8-4aee-b1d0-472367fffaaa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd39b9815-e374-4d2c-93df-40e68046c94f', N'd5fd71be-48e8-4aee-b1d0-472367fffaaa')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bc2a77c6-eae9-4437-80bf-3782b69061ba', N'admin@paintballstore.com', 0, N'ANm521d8y1RXEb00VUQsKf27BkFcPcrowH2K9UYKWjFsyOs8dq/hJ5zktg+o+FLvgA==', N'df9b8b6e-0a9c-4425-8c21-c72943b322ac', NULL, 0, 0, NULL, 1, 0, N'admin@paintballstore.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd39b9815-e374-4d2c-93df-40e68046c94f', N'email@test.com', 0, N'ABNr6DOoLpuhO+Qk6QxkNa/9/00PoW++iJj1IJfHaJqGh80Xu8wU0HHtAxN3SUqLyQ==', N'67fa6b7f-55ad-42d3-8673-07a3b98a7bec', NULL, 0, 0, NULL, 1, 0, N'email@test.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e6962903-3cde-462d-9a0d-4136e667ffa4', N'test@example.com', 0, N'AEoEWUqxJ7+Xks19RRVFRBvgQgOHqLhH436ZSpVucYSgLMsvXJtoSTXYpw2rTFmhlA==', N'dbf18059-c13d-4bba-a208-76583bb3e0bf', NULL, 0, 0, NULL, 1, 0, N'test@example.com')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDesc]) VALUES (1, N'Paintball Guns', N'null')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDesc]) VALUES (2, N'Paintball Clothing/Mask', N'null')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDesc]) VALUES (3, N'Paintball Accessories', N'null')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDesc]) VALUES (4, N'Paintballs', N'null')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1, N'Bob', N'McBobface', N'1234 Place Pl.', N'North City', N'MO', N'63124', NULL, NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [City], [State], [ZipCode], [Phone], [Email]) VALUES (2, N'Shelly', N'Stien', N'345 Court Ct.', N'East City', N'IL', N'64489', NULL, NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [City], [State], [ZipCode], [Phone], [Email]) VALUES (3, N'Robert', N'Robinson', N'987 N. Blah St', N'Springfield', N'CA', N'78234', NULL, NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [City], [State], [ZipCode], [Phone], [Email]) VALUES (4, N'Bobert', N'Bobertson', N'7654 Some St.', N'Memphis', N'TX', N'84321', NULL, NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [City], [State], [ZipCode], [Phone], [Email]) VALUES (5, N'Clair', N'Hall', N'2345 Zebra', N'Dee', N'UT', N'34628', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (1, N'Management')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (2, N'Warehouse')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (3, N'Shipping')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Title], [Address], [City], [State], [ZipCode], [ReportsToID], [DepartmentID]) VALUES (1, N'Scott', N'Cashion', N'Owner', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Title], [Address], [City], [State], [ZipCode], [ReportsToID], [DepartmentID]) VALUES (2, N'Josh', N'Berg', N'Warehouse Manager', NULL, NULL, NULL, NULL, 1, 2)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Title], [Address], [City], [State], [ZipCode], [ReportsToID], [DepartmentID]) VALUES (3, N'Mike', N'Daffron', N'Shipping Manager', NULL, NULL, NULL, NULL, 1, 3)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Title], [Address], [City], [State], [ZipCode], [ReportsToID], [DepartmentID]) VALUES (4, N'Jimmy', N'Lopez', NULL, NULL, NULL, NULL, NULL, 2, 2)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Title], [Address], [City], [State], [ZipCode], [ReportsToID], [DepartmentID]) VALUES (5, N'Denise', N'Lynn', NULL, NULL, NULL, NULL, NULL, 3, 3)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName], [ManufacturerDesc]) VALUES (1, N'Tippmann', N'null')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName], [ManufacturerDesc]) VALUES (2, N'Empire', N'null')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName], [ManufacturerDesc]) VALUES (3, N'Kingman', N'null')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName], [ManufacturerDesc]) VALUES (4, N'Valken', N'null')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName], [ManufacturerDesc]) VALUES (5, N'HK Army', N'null')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName], [ManufacturerDesc]) VALUES (6, N'JT', N'null')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName], [ManufacturerDesc]) VALUES (7, N'Sly', N'null')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName], [ManufacturerDesc]) VALUES (8, N'V-Force', N'null')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName], [ManufacturerDesc]) VALUES (9, N'CMI', N'null')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName], [ManufacturerDesc]) VALUES (10, N'Core', N'null')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName], [ManufacturerDesc]) VALUES (11, N'First Strike', N'null')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName], [ManufacturerDesc]) VALUES (12, N'GI Sportz', N'null')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName], [ManufacturerDesc]) VALUES (13, N'Ninja', N'null')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName], [ManufacturerDesc]) VALUES (14, N'BT', N'null')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName], [ManufacturerDesc]) VALUES (15, N'D3FY', N'null')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (1, 16, 1, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (1, 36, 1, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (2, 7, 1, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (2, 20, 1, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (2, 38, 1, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (3, 2, 1, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (3, 16, 1, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (3, 33, 1, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (4, 10, 1, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (4, 14, 1, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (4, 39, 1, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (5, 6, 1, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (5, 12, 1, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (5, 20, 1, NULL)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Discount]) VALUES (5, 36, 1, NULL)
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [ShipState], [ShipCountry], [ShipZip]) VALUES (1, 1, CAST(N'2022-12-15T00:00:00.000' AS DateTime), CAST(N'2022-12-16T00:00:00.000' AS DateTime), 25.0000, N'1234 Place Pl.', N'North City', N'MO', N'United Stats', N'63124')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [ShipState], [ShipCountry], [ShipZip]) VALUES (2, 2, CAST(N'2022-12-16T00:00:00.000' AS DateTime), CAST(N'2022-12-17T00:00:00.000' AS DateTime), 20.0000, N'345 Court Ct.', N'East City', N'IL', N'United States', N'64489')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [ShipState], [ShipCountry], [ShipZip]) VALUES (3, 3, CAST(N'2022-12-16T00:00:00.000' AS DateTime), CAST(N'2022-12-17T00:00:00.000' AS DateTime), 25.0000, N'987 N. Blah St', N'Springfield', N'CA', N'United States', N'78234')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [ShipState], [ShipCountry], [ShipZip]) VALUES (4, 4, CAST(N'2022-12-17T00:00:00.000' AS DateTime), CAST(N'2022-12-17T00:00:00.000' AS DateTime), 15.0000, N'7654 Some St.', N'Memphis', N'TX', N'United States', N'84321')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShippedDate], [Freight], [ShipAddress], [ShipCity], [ShipState], [ShipCountry], [ShipZip]) VALUES (5, 5, CAST(N'2022-12-18T00:00:00.000' AS DateTime), CAST(N'2022-12-20T00:00:00.000' AS DateTime), 45.0000, N'2345 Zebra', N'Dee', N'UT', N'United States', N'34628')
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (1, N'98 Custom', 1, 1, 189.9900, NULL, N'Tippman-98Custom.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (2, N'A5', 1, 1, 279.9500, NULL, N'Tippman-A5.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (3, N'FT-12', 1, 1, 119.0000, NULL, N'Tippman-FT-12.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (4, N'Stormer Tatical', 1, 1, 169.9500, NULL, N'Tippman-Stormer_Tactical.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (5, N'SW-1 Blackhawk Whiskey', 4, 1, 189.9500, NULL, N'Valken_Gun-SW-1Blackhawk-Whiskey.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (6, N'Axe SYX 1.5', 2, 1, 699.9500, NULL, N'Empire_Gun-Axe_SYX_1.5.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (7, N'Spyder Fenix Diamond Black', 3, 1, 89.9500, NULL, N'Kingman_Gun-Spyder_Fenix-DiamondBlack.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (8, N'Spyder Fenix Gloss Blue', 3, 1, 154.9500, NULL, N'Kingman_Gun-Spyder_Fenix-GlossBlue.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (9, N'Spyder Fenix Gloss Red', 3, 1, 154.9500, NULL, N'Kingman_Gun-Spyder_Fenix-GlossRed.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (10, N'Spyder Fenix Olive Green', 3, 1, 89.9500, NULL, N'Kingman_Gun-Spyder_Fenix-OliveGreen.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (11, N'Slide Shorts Neo Skin', 2, 2, 35.9500, NULL, N'Empire_Slide-Shorts-NeoSkin.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (12, N'Chest Protector Black Green', 2, 2, 44.9500, NULL, N'Empire-Chest_Protector-Black-Grey.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (13, N'Knee Pads HSTL Camo', 5, 2, 25.9500, NULL, N'HK-Knee_Pads-HSTL_Camo.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (14, N'Chest Protector Black', 6, 2, 44.9500, NULL, N'JT-Chest_Protector-Black.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (15, N'Mask Annex MI7 Black', 7, 2, 99.9500, NULL, N'Sly_Mask-Annex_MI7-Black.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (16, N'Mask Annex MI7 Tan', 7, 2, 99.9500, NULL, N'Sly_Mask-Annex_MI7-Tan.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (17, N'Chest Protector Black', 4, 2, 47.9500, NULL, N'Valken_Chest-Protector_Black.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (18, N'Mask Grill SE Spekta', 8, 2, 149.9500, NULL, N'V-Force_Mask-Grill-SE_Spekta.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (19, N'Mask Grill SE White/Black', 8, 2, 149.9500, NULL, N'V-Force_Mask-Grill-SE_White-Black.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (20, N'Mask Grill SE Zebra', 8, 2, 149.9500, NULL, N'V-Force_Mask-Grill-SE_Zebra.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (21, N'Remote Line', 9, 3, 20.9500, NULL, N'CMI_RemoteLine.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (22, N'CO2 O-Ring 100 pack', 10, 3, 4.9900, NULL, N'Core_O-Ring_100Pack_CO2.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (23, N'Remote Line', 10, 3, 25.9500, NULL, N'Core_RemoteLine.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (24, N'Compressed Air Tank Half Pint', 11, 3, 45.9500, NULL, N'First_Strick-CompressedAir-HalfPint.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (25, N'CO2 Tank 24 oz.', 12, 3, 29.9500, NULL, N'GI_Sportz-CO2Tank-24oz.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (26, N'Compressed Air Tank', 5, 3, 149.9500, NULL, N'HK-Army-CompressedAirTank.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (27, N'CO2 Cartridge 90 Gram', 6, 3, 12.9500, NULL, N'JT_CO2-Cartridge_90Gram.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (28, N'Compressed Air Tank', 13, 3, 149.9500, NULL, N'Ninja_CompressedAir.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (29, N'CO2 Tank 24 oz.', 1, 3, 25.9500, NULL, N'Tippmann_CO2-Tank-24OZ.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (30, N'Remote Line', 1, 3, 15.9500, NULL, N'Tippmann_RemoteLine.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (31, N'Paint Grenade Yellow Fill', 14, 4, 9.9500, NULL, N'BT_Paint-Grenade_Yellowfill.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (32, N'Paintballs 1000 count', 15, 4, 25.9500, NULL, N'D3FY_Sports-Paintballs-1000Rounds.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (33, N'Paintballs Heat 2000 count', 2, 4, 45.9500, NULL, N'Empire_Paintballs_Heat_2000Rounds.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (36, N'Paintballs Marbal 2000 count', 2, 4, 45.9500, NULL, N'Empire_Paintballs_Marballizer_2000Rounds.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (38, N'Paintballs Smoke 600 count', 11, 4, 20.9500, NULL, N'First_Strike-600Rounds-Smoke_Green_Fill.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (39, N'Paintball Orange 600 count', 11, 4, 20.9500, NULL, N'First_Strike-600Rounds-Smoke_Orange_Fill.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (40, N'Paintball 2000 Count', 12, 4, 45.9500, NULL, N'GI-Sportz_Paintballs_2000Rounds.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (41, N'Paintball 2000 Count', 5, 4, 45.9500, NULL, N'HK-Army_Paintballs_2000Rounds.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (42, N'Paint Grenade Yellow Fill', 6, 4, 9.9500, NULL, N'JT_Paint-Grenade_Yellow-Fill.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ManufacturerID], [CategoryID], [UnitPrice], [ProductDesc], [ProductImage]) VALUES (43, N'Paint Grenade Pink Fill', 1, 4, 9.9500, NULL, N'Tippmann_Paint-Gernade_Pink-Fill.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'e6962903-3cde-462d-9a0d-4136e667ffa4', N'Bob', N'Allen')
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([ReportsToID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Order__52593CB8] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__Order__52593CB8]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Produ__534D60F1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__Produ__534D60F1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__Customer__5070F446] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__Customer__5070F446]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ManufacturerID])
GO
