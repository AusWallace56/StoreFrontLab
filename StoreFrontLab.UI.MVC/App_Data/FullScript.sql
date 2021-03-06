/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_StockStatuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Categories]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Employees]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Departments]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 4/8/2022 1:52:22 PM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[StockStatuses]    Script Date: 4/8/2022 1:52:22 PM ******/
DROP TABLE IF EXISTS [dbo].[StockStatuses]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/8/2022 1:52:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Products]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/8/2022 1:52:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 4/8/2022 1:52:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Departments]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/8/2022 1:52:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Categories]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/8/2022 1:52:22 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/8/2022 1:52:22 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/8/2022 1:52:22 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/8/2022 1:52:22 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/8/2022 1:52:22 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/8/2022 1:52:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/8/2022 1:52:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/8/2022 1:52:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/8/2022 1:52:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/8/2022 1:52:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/8/2022 1:52:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 4/8/2022 1:52:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/8/2022 1:52:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](100) NOT NULL,
	[DirectReportID] [int] NULL,
	[DepartmentID] [int] NOT NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/8/2022 1:52:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Price] [money] NULL,
	[StockStatusID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StockStatuses]    Script Date: 4/8/2022 1:52:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockStatuses](
	[StockStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StockStatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StockStatuses] PRIMARY KEY CLUSTERED 
(
	[StockStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 4/8/2022 1:52:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](75) NOT NULL,
	[FavoriteColor] [varchar](7) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'8106ab3b-be04-4596-acfe-2d44d2609493', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'dd41a786-c9d6-4c94-bde7-21b37e8d9267', N'Customer')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9e1d3df1-03fb-4f11-9e30-1dfd8e2d5ceb', N'8106ab3b-be04-4596-acfe-2d44d2609493')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3459f024-0aca-4bed-b533-ebf979112f3e', N'dd41a786-c9d6-4c94-bde7-21b37e8d9267')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'da1a0b67-ad10-469a-abff-162e01770c29', N'dd41a786-c9d6-4c94-bde7-21b37e8d9267')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3459f024-0aca-4bed-b533-ebf979112f3e', N'test@example.com', 0, N'AKTHQOUKmYXRGMH2fzbLbuL6pl7UzUUfovVdX3BPcAYy4i27/dg8wZU6Tx8aAL/E9A==', N'2b0ea7fd-6266-4944-b734-ecf16370a5d4', NULL, 0, 0, NULL, 1, 0, N'test@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9e1d3df1-03fb-4f11-9e30-1dfd8e2d5ceb', N'admin@mvc2.com', 0, N'AJpWIY6jCbPl/0fuCtR4MOJ3Agdv0HlEKVWhgLVtLA3XXNZVEiEYv80nEQ9aEHsolQ==', N'70687a0d-706b-4a4d-b4a2-2e48bdf09af4', NULL, 0, 0, NULL, 1, 0, N'admin@mvc2.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'da1a0b67-ad10-469a-abff-162e01770c29', N'customer@mvc2.com', 0, N'ABYsnaqZb2hTvOpMjTAvMFVjCoPUWA0OI4Etk1KP6g/oaIRLr3i9BJqKcajkUiaVow==', N'42516ec1-d0de-4cdb-bece-cdb876c54071', NULL, 0, 0, NULL, 1, 0, N'customer@mvc2.com')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'Mini Figure', N'LEGO Mini Figures')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'Full Set', N'Completed LEGO sets')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'Accessory', N'LEGO themed merchandise')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'Loose Bricks', N'An assortment of LEGO bricks')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (5, N'Storage', N'Storage options to keep LEGO bricks/sets organized')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (6, N'Display', N'Items to display completed builds')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (1, N'Executive')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (2, N'HR')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (3, N'Marketing')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (4, N'Customer Service')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (5, N'Accounting')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DirectReportID], [DepartmentID], [Title]) VALUES (1, N'Myra Kane', NULL, 1, N'President')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DirectReportID], [DepartmentID], [Title]) VALUES (2, N'Ashley Burnett', 1, 1, N'Vice President')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DirectReportID], [DepartmentID], [Title]) VALUES (3, N'Marvin Bell', 2, 1, N'Executive Assistant')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DirectReportID], [DepartmentID], [Title]) VALUES (4, N'Riley Odonnell', 2, 1, N'Executive Assistant')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DirectReportID], [DepartmentID], [Title]) VALUES (5, N'Irving Stout', 3, 2, N'HR Manager')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DirectReportID], [DepartmentID], [Title]) VALUES (6, N'Lena Gibson', 5, 2, N'HR Rep')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DirectReportID], [DepartmentID], [Title]) VALUES (7, N'Eva Burton', 4, 3, N'Marketing Manager')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DirectReportID], [DepartmentID], [Title]) VALUES (8, N'Jennie Becker', 7, 3, N'Sales')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DirectReportID], [DepartmentID], [Title]) VALUES (9, N'Troy Kelly', 7, 3, N'Research')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DirectReportID], [DepartmentID], [Title]) VALUES (10, N'Gregg Whitney', 3, 4, N'Customer Service Manager')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DirectReportID], [DepartmentID], [Title]) VALUES (11, N'Melvin Stark', 10, 4, N'Customer Service Rep')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DirectReportID], [DepartmentID], [Title]) VALUES (12, N'Page Nash', 10, 4, N'Customer Service Rep')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DirectReportID], [DepartmentID], [Title]) VALUES (13, N'Carol Vaughn', 10, 4, N'Customer Service Rep')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DirectReportID], [DepartmentID], [Title]) VALUES (14, N'Chris Kirk', 4, 5, N'Accounting Manager')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DirectReportID], [DepartmentID], [Title]) VALUES (15, N'Ashton Kelly', 14, 5, N'Accountant')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DirectReportID], [DepartmentID], [Title]) VALUES (16, N'Elle Fanton', 14, 5, N'Accountant')
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1, N'Dubai', 2, 59.9900, 2, 0, N'
Enjoy an advanced building experience and relive classic Jurassic World moments with LEGO Jurassic Park: T. rex Rampage. This collectible construction toy includes 3120 building bricks and features the original Jurassic Park’s iconic gate and a large, fully posable, brick-built T. rex dinosaur toy that is ideal for display. ', N'6891e71a-6017-45e0-89dd-e621bd984c28.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (2, N'Bookshop', 2, 179.9900, 1, 13, N'This big 3-story LEGO set features so many details, including a display window, bookshelves, reading nook and living spaces in the town house, and 5 minifigures to really bring this collectors'' toy to life', N'0ddec7fa-2e2f-47bd-9e12-6dd28e26abf0.jpeg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (3, N'Miles Morales Key Chain', 3, 5.9900, 1, 85, N'Kids can join forces with the young web-slinger when they connect this Miles Morales Key Chain (854153) to their possessions. It features a Miles Morales minifigure, wearing his familiar black mask and hoody, attached to a durable metal chain and ring. This cool gift idea for any Marvel movie fan aged 6 and up connects easily to keys, bags, backpacks and more.', N'7a881a45-1c4a-4a3a-8006-487b43d19b3a.png')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (4, N'3 Drawer Bin', 5, 39.9900, 1, 7, N'Textured drawer fronts to help organize countertop, office, and other areas of the home. Keep letter-size paper, pencils, paperclips and other office supplies put away on your desk. Use it in the bathroom for makeup and hair accessory storage. It can keep craft supplies together and out of the way. Use it in children''s rooms for small toys and art supplies.', N'3aa32872-66e6-416a-bd14-29fb064874da.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (5, N'Blue Baseplate', 4, 7.9900, 1, 25, N'Whether you are creating a seaside town, sunny swimming pool, ship at sea or something else from your imagination, this LEGO® Classic 10714 blue 32x32-stud baseplate is the perfect base for building, displaying and playing with your LEGO creations.', N'e1be9a14-7382-4ddb-a7ad-2b2521be44ec.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (6, N'Roller Coaster', 2, 525.0000, 4, 1, N'Capture the speed, thrills and excitement of the ultimate fairground attraction with this incredible LEGO® Creator Expert 10261 Roller Coaster. This fully functional chain-lift model comes with 2 trains and an array of authentic features and functions, including a ticket booth, cotton candy cart, concession stand, height marker, and a covered boarding station complete with opening barriers and a control panel. Lower the lap bars to secure the riders into the cars and release the brake to send the train to the foot of the first climb. ', N'0b313143-978c-49c2-af6c-0b905a91cd2c.jpeg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (7, N'Groundskeeper Willie', 1, 12.0000, 4, 1, N'Lego Brand Groundskeeper Willie Minifigure from The Simpsons Series 2', N'ec4ea3fe-7d4c-4302-be39-f6474e81376f.jpeg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (8, N'Mountain Windmill', 2, 359.0000, 1, 2, N'
High in the Boratis Mountains, built between the two tallest peaks, stands the windmill. How the windmill came to be there, its purpose, and who inhabited it (if anyone) were all unknown - or long forgotten. One day, far below in the Valley of Gales, a young villager happens upon a lost map which reveals a hidden path up the mountain.', N'3e5df9b4-b264-43a5-9a85-caec06b206ff.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (9, N'Venetian Houses', 2, 600.0000, 2, 0, N'910023 Venetian Houses was a 3,470 piece BrickLink exclusive set with 6 minifigs released in 2021. It was released as part of Round 2.', N'2a9841b0-213e-40e5-8ca5-17f057daa2a0.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (10, N'Modular LEGO Store', 2, 360.0000, 1, 6, N'The main concept is a stand-alone LEGO® Store that is about to open after a long period of renovations in an old building in New York. A two-story-high beautiful Pick-A-Brick wall is the main feature of the store.

The storefront has a few notable features such as big show windows, doors, huge red and yellow bricks, and the rooftop with technic gears which epitomize how the old building was upcycled here. It shows that the building used to be a small toy factory.', N'9584dbc5-bf0d-4478-83ba-e964f5d2aa2b.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (11, N'The Great Fishing Boat', 2, 417.8800, 1, 2, N'An initially announced limited edition production run of 5,000 unnumbered sets sold out upon its initial offering on July 1, 2021. Orders for this first allotment were limited to 5 per customer. Shipment of this allotment occurred to European customers in December 2021 / January 2022. Due to supply chain disruptions, shipment to customers in North America and Oceania was delayed until March 2022.', N'f57b204e-dbd5-4bb3-8717-e8fdbe3da5b0.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (12, N'Harley-Davidson Fat Boy', 2, 107.0000, 3, 0, N'Explore the finer details of iconic engineering with the LEGO Creator Expert Harley-Davidson Fat Boy motorcycle. Developed in partnership with Harley-Davidson, this highly detailed LEGO motorcycle captures the magic of the real-life machine, from its solid-disc Lakester wheels with beefy tires to its teardrop fuel tank with printed logos and inbuilt speedometer.', N'168c12b4-ca1a-4174-83a6-10c1ec7127c3.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1005, N'Hogwarts Great Hall', 2, 112.0000, 1, 12, N'
Build and recreate a magical fantasy realm from the Harry Potter movies with this detailed 4-level LEGO 75954 Hogwarts Great Hall Harry Potter castle building kit, featuring a fireplace, benches, tables and reversible house banners, plus the Grand Staircase tower with a spiral staircase, potions room, treasure room, sorting hat, Mirror of Erised and lots of magical artifact accessory elements.', N'8091eb40-85c7-42f0-bbf3-f4f3e5aaa7e4.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1006, N'Pirates of Barracuda Bay', 2, 300.0000, 1, 1, N'Rekindle nostalgic memories of childhood LEGO® construction projects with this LEGO Ideas Pirates of Barracuda Bay (21322) shipwreck island model for display and play. Enjoy some calm, quality time alone building – or share the fun with others.', N'0464f788-3bf1-4543-8b70-625e6e6044da.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1007, N'Jurassic Park t. Rex Rampage', 2, 321.6500, 1, 2, N'
Enjoy an advanced building experience and relive classic Jurassic World moments with LEGO Jurassic Park: T. rex Rampage. This collectible construction toy includes 3120 building bricks and features the original Jurassic Park’s iconic gate and a large, fully posable, brick-built T. rex dinosaur toy that is ideal for display. ', N'e851b962-712d-4506-bbff-be575768bc9a.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1008, N'Marvel 6 Pack Box', 1, 54.7500, 1, 4, N'
Exciting action and endless adventure await super-hero fans and lovers of mischief in every bag! With 6 packs in this set, each LEGO Minifigures Marvel Studios (71031) collectible ‘mystery’ bag contains 1 of 12 cool, limited-edition character building toys. Action lovers young and old can collect, display or add cool character minifigures into their current playsets from Marvel Studios Original series WandaVision, The Falcon and the Winter Soldier, Loki and What If…?, featuring The Scarlet Witch, The Vision, Monica Rambeau, Winter Soldier, Captain America, Loki, Sylvie, T’Challa Star-Lord, Captain Carter, Gamora with the Blade of Thanos, Zombie Hunter Spidey and Zombie Captain America. Each of the finely crafted, highly detailed LEGO minifigures comes in a sealed ‘mystery’ bag with 1 or more accessory elements to add to the action and fun, plus a collector’s overview leaflet. Makes a great little gift that will put a smile on anyone’s face.
', N'f2645ae0-7d48-4c40-a954-097dc544d804.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1009, N'The Upside Down', 2, 242.8500, 2, 0, N'Fans of the global hit Netflix original series will appreciate the authentic details of this highly collectible LEGO Stranger Things toy – 75810 The Upside Down. This sturdy, brick-built model can flip between the real world and The Upside Down.', N'45ed67e3-17cc-4af2-9e49-e1c2e3a97859.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1010, N'Remote Controlled Stunt Racer', 2, 129.0000, 3, 0, N'This 2-in-1 motorized toy rebuilds into a Remote-Controlled Racer. Remote-Controlled Stunt Racer measures over 6” (17cm) high, 8” (22cm) long and 5” (15cm) wide. Remote-Controlled Racer measures over 4” (12cm) high, 7” (20cm) long and 7” (19cm) wide.', N'47124b2d-7b97-4f83-b8f7-579d6bc73d44.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1011, N'Iconic Yellow Hands', 3, 9.9900, 1, 75, N'Transform your human hands into LEGO® minifigure hands! An awesome accessory for cosplay and costume parties, this adult-sized pair of yellow polyester fabric and foam hands provides the perfect finishing touch to any LEGO character costume. The hands slip easily on and off and feature palm openings, so you can reach your actual hands through to hold things like food and drinks.', N'f935719a-e4ea-41b9-9d6d-68744e7f3861.jpeg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1012, N'Grogu Bag Tag', 3, 6.9900, 1, 66, N'This Star Wars: The Mandalorian bag tag has a power the world can’t ignore! Made from durable, flexible silicone, it features an illustration of the Grogu LEGO® figure, and there is space on the back to write contact details. It’s simple to attach to a bag or backpack, so kids can take Grogu – also known as ‘the Child’, or affectionately by fans as ‘Baby Yoda’ – with them wherever they go.', N'b25f3919-c6cc-40d7-bb25-f8345ae428a3.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1013, N'Darth Maul Key Chain', 3, 5.9900, 1, 86, N'Take a terror of the dark side everywhere you go with this authentic LEGO® Star Wars™ Darth Maul™ minifigure, attached to a sturdy metal ring and chain. A great gift for any LEGO Star Wars fan.', N'de321c3e-6b94-4dc8-9c29-5e1c13570427.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1014, N'Demogorgon Key Chain', 3, 5.9900, 1, 45, N'Kids and fans of the Netflix Stranger ThingsTM TV series will love this LEGO® Demogorgon Key Chain (854197), featuring a Demogorgon, one of the series’ most iconic characters, attached to a sturdy metal ring and chain. Easily attachable to keys and bags, it makes a cool little gift for any occasion.', N'976587d4-0c94-4e9d-bcdc-09e822898477.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1015, N'Batman Key Chain', 3, 5.9900, 1, 75, N'Keep the Caped Crusader with you wherever you go when you attach the LEGO® DC 853951 Batman™ Key Chain to your keys or backpack. With an updated design for January 2019, this Batman minifigure linked to a sturdy metal ring, chain and LEGO tag makes a cool gift for all fans of the Dark Knight.', N'4eeac241-27d7-4520-90f1-1f4bc7162fff.jpeg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1016, N'Lego City Town Map Throw', 3, 19.9900, 2, 0, N'Little fans of LEGO® City will love this LEGO City Town Map 46 in. x 60 in. Throw. Manufactured from easy-care 100% polyester micro raschel fabric, it’s supersoft, warm and machine washable. Perfect for cozy evenings on the sofa and fun car journeys on cold days.', N'73704bc3-fa3f-4d83-90bc-684d576ca300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1017, N'Wooden Desk Drawer 8 Dark Oak', 5, 219.9900, 1, 12, N'LEGO® fans will love this fun, practical and attractive Wooden Desk Drawer. It is shaped as an oversized building brick with 8 studs and features a removable drawer, ideal for storing smaller LEGO bricks, toys, stationery or even toiletries. It is made from FSC-certified oak in a dark-stained oak finish and can be stacked together with other drawers to make a stylish and playful feature in any room of the house.', N'23d975fd-e3bb-41a5-af29-d0d9ae790982.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1018, N'Wooden Book Rack Dark Oak', 6, 139.9900, 1, 12, N'This versatile rack provides the perfect place for kids to keep their books, toys and knickknacks. Made from FSC-certified oak and designed to look like an oversized version of a 1x6-stud LEGO® brick, this sturdy storage solution is available in a dark oak finish (also available in a soap-treated, light oak finish). Mount it on a wall or sit it on a tabletop. Wherever you put it, the LEGO Wooden Book Rack is a great way to make staying organized fun.', N'4d6b3295-c55a-41fa-8fc9-ba6f54c5611c.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1019, N'Wooden Desk Drawer 4 Dark Oak', 5, 129.9900, 1, 12, N'LEGO® fans will love this fun, practical and attractive Wooden Desk Drawer. It’s shaped as an oversized building brick with 4 studs and features a removable drawer, ideal for storing smaller LEGO bricks, toys, stationery or even toiletries. It is made from FSC-certified oak in a dark-stained oak finish and can be stacked together with other drawers to make a stylish and playful feature in any room of the house.', N'fc51d8e2-c4bc-46f1-be2a-acb3cae28b61.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1020, N'Wooden Wall Hanger Set Dark Oak', 6, 99.9900, 1, 12, N'Playful LEGO® fans can keep their rooms tidy with this stylish and practical Wooden Wall Hanger Set. It features 3 wall hooks in the shape of LEGO 1x1 round plate studs, each made from FSC-certified oak in a dark-stained oak finish. The wooden studs are different sizes and ideal for hanging coats, bags, scarves or anything else that’s cluttering up the place. This wall hanger set is suitable for ages 3 and up, and it is also available in a soap-treated light oak finish.', N'34f5b14e-0c39-4504-b7e8-b91f81ee273d.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1021, N'8-Stud Brick Drawer - Green', 5, 39.9900, 1, 6, N'Keep rooms tidy in style with the LEGO® 8-Stud Brick Drawer. Made from durable plastic, it has two drawers and is ideal for storing toys, LEGO bricks (not included), toiletries, office supplies and other small items. These units are stackable and available in multiple colors (sold separately) for home decor that is both practical and delightful. (Please note: Always open the drawers on a level surface to avoid the risk of the box tipping over. Drawers may tilt when open freestanding.)', N'9e46e4e9-9d34-4ef6-8ab9-edb2f8956606.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1022, N'8-Stud Brick Drawer - Black', 5, 39.9900, 1, 8, N'Stow toys, LEGO® bricks, office supplies and household items in this stackable LEGO Iconic 5005718 8-Stud Black Storage Brick Drawer. This stylish storage solution has 2 compartments and removable drawers so your things are easily accessible whenever you need them. LEGO storage brick drawers are available in various colors so you can mix and match, stack them up and brighten up any room or office.', N'4d0586d1-45f0-44ce-85ac-0f3cf9983647.jpeg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1023, N'8-Stud Brick Drawer - Red', 5, 34.9900, 1, 12, N'Any LEGO® fan aged 5 and over will love this LEGO Iconic 8-Stud Red Desk Drawer (5005871). The big red LEGO style brick makes a colorful room decoration and provides portable storage. And, if a single drawer isn’t enough, simply attach other similar drawers using the oversized LEGO studs. Great for storing stationery, small toys and, of course, LEGO bricks!', N'9fc184d8-c466-48a1-9520-0f8e9b3a5623.jpeg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1025, N'Creative Animals', 4, 59.9900, 1, 32, N'
Introduce your child to a whole animal-themed world of creativity and building fun with this fun Creative Animals set! Use the inspiration cards to help your young creator assemble the easy-to-build giraffe, bunny, dog and worm, each with its own distinctive, bright color theme. Then get ready to embark with them on a world of unending play possibilities.', N'8102d13e-8ec6-4b10-ae8c-7b627d132d8e.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1026, N'Grey Baseplate', 4, 14.9900, 1, 22, N'Whether you''re creating a street scene, castle, or something of your own imagination, this gray-colored 48x48-stud baseplate is the perfect starting point for building, displaying, and playing with your LEGO creations. Measures about 15-inches wide x 15-inches long. Includes 1 Gray Baseplate, Ages 4-99.', N'3ad773cb-feb5-4180-9d58-ed2a577df3f0.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1027, N'Green Baseplate', 4, 7.9900, 1, 29, N'Whether you''re creating a garden, forest, or something of your own imagination, this 10x10 green-colored square 32x32-stud baseplate is the perfect starting point for building, displaying, and playing with your LEGO creations. This building accessory is a great addition for any classic LEGO collection for both kids and adults. Easily place the plastic stud mat on a table as the foundation for your building toys and use to display your LEGO creations', N'9b4fdb0a-09c9-40c5-aa41-718d52bbd8a0.jpeg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1028, N'Connections Kit', 4, 754.9900, 1, 1, N'The LEGO® SERIOUS PLAY® program is a radical and innovative process designed to enhance business performance through building with LEGO bricks. Build team skills for better communication, imagination, confidence, commitment and insight.The LEGO SERIOUS PLAY Connections Kit is designed to focus 10-12 workshop participants on the relations and connections structure of the business landscape with its network of interdependent agents.', N'b33e763e-d2d0-4a1d-b3de-1709143f3c40.png')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1029, N'Floating Shelf', 6, 55.7500, 3, 0, N'Embrace the open-shelving trend with the Brighton Wood Floating Shelves. Stack ceramics, dinnerware and more in the kitchen or use to display frames photographs in a home office or stairway. Short on floor space? The smallest one can be used as a nightstand, too.', N'019bd64c-3b43-4b71-8987-60eab6686ce2.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1030, N'Plastic Parts Cabinet', 5, 43.0000, 1, 4, N'Black color with clear polypropylene drawers.
Durable plastic cabinets with clear drawers.
Includes 8 small and 4 large drawer dividers.
Stack on workbench or mount to wall.', N'5597567f-6f90-4ce9-87b7-b0b06149c929.png')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1031, N'Geometric Bookcase', 6, 189.9900, 1, 2, N'Add visual interest to your living room or office with the Dora bookshelf. This wooden bookshelf showcases a sleek dark brown finish that is easy to coordinate with any color palette. Five staggered tiers create a visually striking display for all your favorite books and knick-knacks. Its narrow profile makes it well suited for smaller spaces. The Dora bookshelf is made in Malaysia and requires assembly.', N'2cd93b64-a641-442b-8ebe-0e3ca92b6cac.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1032, N'Corner Bookcase', 6, 202.9900, 1, 3, N'Beautiful furniture never fails to make an impact. Furniture is a big part of interior decoration. Be it for a spacious home or for a cosy apartment, a house or an office, furnish every conceivable space with our products. We provide high-quality modern furniture to be enjoyed for many years with a focus on dependability, user satisfaction, and great quality.', N'2657a70d-1f4d-4ae0-81c6-ba03c952eb93.jpeg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockStatusID], [Quantity], [Description], [Image]) VALUES (1033, N'Wall Mount Adjustable Shelves', 6, 69.9900, 1, 4, N'This adjustable shelving makes adjusting your shelves quick and easy. Shelves can be set to any height allowing you to store items of various sizes, and changed to a new height whenever you need. With a steel construction and high load capacity these shelves are extremely hard-wearing and long-lasting. Ideal for home use in the living room, office or bedroom.', N'551dc32c-21a3-42d5-93e9-895c87871ef3.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[StockStatuses] ON 

INSERT [dbo].[StockStatuses] ([StockStatusID], [StockStatusName]) VALUES (1, N'In Stock')
INSERT [dbo].[StockStatuses] ([StockStatusID], [StockStatusName]) VALUES (2, N'Out of Stock')
INSERT [dbo].[StockStatuses] ([StockStatusID], [StockStatusName]) VALUES (3, N'Back Ordered')
INSERT [dbo].[StockStatuses] ([StockStatusID], [StockStatusName]) VALUES (4, N'Discontinued')
SET IDENTITY_INSERT [dbo].[StockStatuses] OFF
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoriteColor]) VALUES (N'3459f024-0aca-4bed-b533-ebf979112f3e', N'Test', N'User', N'#000000')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoriteColor]) VALUES (N'9e1d3df1-03fb-4f11-9e30-1dfd8e2d5ceb', N'Admin', N'User', N'#9C95C7')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoriteColor]) VALUES (N'da1a0b67-ad10-469a-abff-162e01770c29', N'Default', N'User', N'#FF0000')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([DirectReportID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_StockStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_StockStatuses] FOREIGN KEY([StockStatusID])
REFERENCES [dbo].[StockStatuses] ([StockStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_StockStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_StockStatuses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
