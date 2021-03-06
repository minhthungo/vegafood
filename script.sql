USE [master]
GO
/****** Object:  Database [Vegafood]    Script Date: 1/15/2021 11:51:22 PM ******/
CREATE DATABASE [Vegafood]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vegafood', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.HOFASERVER\MSSQL\DATA\Vegafood.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Vegafood_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.HOFASERVER\MSSQL\DATA\Vegafood_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Vegafood] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vegafood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vegafood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vegafood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vegafood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vegafood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vegafood] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vegafood] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Vegafood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vegafood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vegafood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vegafood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vegafood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vegafood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vegafood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vegafood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vegafood] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Vegafood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vegafood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vegafood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vegafood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vegafood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vegafood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vegafood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vegafood] SET RECOVERY FULL 
GO
ALTER DATABASE [Vegafood] SET  MULTI_USER 
GO
ALTER DATABASE [Vegafood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vegafood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vegafood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vegafood] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Vegafood] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Vegafood', N'ON'
GO
ALTER DATABASE [Vegafood] SET QUERY_STORE = OFF
GO
USE [Vegafood]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/15/2021 11:51:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](15) NULL,
	[Description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 1/15/2021 11:51:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Phone] [nvarchar](10) NULL,
	[District] [nvarchar](15) NULL,
	[Password] [nvarchar](15) NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 1/15/2021 11:51:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](20) NULL,
	[FirstName] [nvarchar](10) NULL,
	[Gender] [bit] NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[District] [nvarchar](15) NULL,
	[Phone] [nvarchar](10) NULL,
	[Notes] [ntext] NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [varchar](15) NULL,
	[Photo] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu Details]    Script Date: 1/15/2021 11:51:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu Details](
	[ProductID] [int] NOT NULL,
	[MenuID] [int] NOT NULL,
	[Quantity] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 1/15/2021 11:51:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](40) NULL,
	[UnitPrice] [money] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[Discontinued] [bit] NULL,
	[MenuDescription] [ntext] NULL,
	[Images] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order Details]    Script Date: 1/15/2021 11:51:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Details](
	[OrderID] [int] NOT NULL,
	[MenuID] [int] NOT NULL,
	[Quantity] [smallint] NULL,
	[Discount] [real] NULL,
	[UnitPrice] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/15/2021 11:51:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[EmployeeID] [int] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[ShipVia] [int] NULL,
	[ShipAddress] [nvarchar](60) NULL,
	[ShipCity] [nvarchar](15) NULL,
	[ShipDistrict] [nvarchar](15) NULL,
	[Description] [ntext] NULL,
	[PaymentVia] [int] NULL,
	[OrderStatus] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 1/15/2021 11:51:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentSolution] [nvarchar](50) NULL,
	[PayCompany] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/15/2021 11:51:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NULL,
	[CategoryID] [int] NULL,
	[UnitPrice] [money] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[Discontinued] [bit] NULL,
	[Calories] [int] NULL,
	[Protein] [real] NULL,
	[Carb] [real] NULL,
	[Fat] [real] NULL,
	[ProductDescription] [ntext] NULL,
	[Images] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 1/15/2021 11:51:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](40) NULL,
	[Phone] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'Đồ ăn mặn', N'Bao gồm thịt, cá, trứng,... ')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'Đồ ăn chay', N'Đồ ăn dành cho người ăn chay')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'Đồ ăn giảm cân', N'Đồ ăn dành cho người đang có nhu cầu giảm cân')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'Đồ ăn tăng cân', N'Đồ ăn cho người tăng cân')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [Address], [City], [Phone], [District], [Password], [Email]) VALUES (5, N'Minh Thu Ngô', N'484 Lê Văn Việt', N'Hồ Chí Minh', N'0386557581', N'Thủ Đức', N'1', N'minhthungo@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [Address], [City], [Phone], [District], [Password], [Email]) VALUES (6, N'Lê Hồng Thái', N'141 Đỗ Xuân Hợp', N'Hồ Chí Minh ', N'0123456789', N'Quận 9', N'2', N'hongthaile@gmail.com')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [Gender], [BirthDate], [HireDate], [Address], [City], [District], [Phone], [Notes], [Email], [Password], [Photo]) VALUES (1, N'Thanh Thúy', N'Vũ Thị', 0, CAST(N'2000-12-10T08:18:26.000' AS DateTime), CAST(N'2020-12-10T08:18:26.000' AS DateTime), N'484 Lê Văn Việt', N'Hồ Chí Minh', N'9', N'0386557581', N'Đã từng làm việc tại Coffee House một năm', N'thanhthuy2000@gmail.com', N'123456', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/employees1.jpg')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (1, 1, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (1, 2, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (1, 3, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (2, 1, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (2, 2, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (2, 3, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (3, 1, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (3, 2, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (3, 3, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (4, 1, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (4, 2, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (4, 3, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (5, 1, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (5, 2, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (5, 3, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (6, 1, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (6, 3, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (7, 1, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (7, 3, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (8, 1, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (8, 3, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (9, 1, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (9, 3, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (10, 1, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (10, 3, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (11, 2, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (12, 2, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (13, 2, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (14, 2, 1)
INSERT [dbo].[Menu Details] ([ProductID], [MenuID], [Quantity]) VALUES (15, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([MenuID], [MenuName], [UnitPrice], [UnitsOnOrder], [Discontinued], [MenuDescription], [Images]) VALUES (1, N'Gói văn phòng', 600000.0000, 1, 1, N'Gói 2 bữa TRƯA - TỐI (Best Seller)

- Sử dụng thực đơn 2 bữa TRƯA -TỐI tại trang fitfood.vn/menu.

- Giao 02 phần ăn tận nơi mỗi ngày, từ thứ 2 đến thứ 6.

- Calories dao động từ 1100 - 1200 Kcal mỗi ngày

- Kèm tinh bột phức, ít đường, đảm bảo ko bột ngọt, nhiều rau củ và chất đạm

* Thích hợp cho dân văn phòng bận rộn, vừa giảm cân, vừa tiết kiệm thời gian

', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/menu1.jpg')
INSERT [dbo].[Menus] ([MenuID], [MenuName], [UnitPrice], [UnitsOnOrder], [Discontinued], [MenuDescription], [Images]) VALUES (2, N'Gói gia đình', 600000.0000, 1, 1, N'Gói 2 bữa SÁNG - TRƯA

- Sử dụng thực đơn 2 bữa SÁNG -TRƯA tại trang fitfood.vn/menu.

- Giao 02 phần ăn tận nơi mỗi ngày, từ thứ 2 đến thứ 6.

- Calories dao động từ 1000 - 1100 Kcal mỗi ngày

- Kèm tinh bột phức, ít đường, đảm bảo ko bột ngọt, nhiều rau củ và chất đạm

* Thích hợp cho dân văn phòng cần ít năng lượng, dành thời gian dùng bữa tối cùng gia đình', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/menu2.jpg')
INSERT [dbo].[Menus] ([MenuID], [MenuName], [UnitPrice], [UnitsOnOrder], [Discontinued], [MenuDescription], [Images]) VALUES (3, N'Gói gymer', 950000.0000, 1, 1, N'Gói 2 bữa TRƯA - TỐI (gấp đôi thịt)

- Sử dụng thực đơn 2 bữa TRƯA -TỐI tại trang fitfood.vn/menu.

- Các món đều được nhân đôi định lượng thịt và rau củ

- Giao 02 phần ăn tận nơi mỗi ngày, từ thứ 2 đến thứ 6.

- Calories dao động từ 2000 - 2100 Kcal mỗi ngày

- Kèm tinh bột phức, ít đường, đảm bảo ko bột ngọt, nhiều rau củ và chất đạm

* Thích hợp cho các bạn đang tập Gym, Fitness cường độ cao hoặc cần Bulking', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/menu3.jpg')
SET IDENTITY_INSERT [dbo].[Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([PaymentID], [PaymentSolution], [PayCompany]) VALUES (1, N'Ví điện tử', N'MOMO')
INSERT [dbo].[Payments] ([PaymentID], [PaymentSolution], [PayCompany]) VALUES (2, N'Thẻ tín dụng', N'VISA')
INSERT [dbo].[Payments] ([PaymentID], [PaymentSolution], [PayCompany]) VALUES (3, N'Thanh toán tiền mặt', N'Ship COD')
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder], [Discontinued], [Calories], [Protein], [Carb], [Fat], [ProductDescription], [Images]) VALUES (1, N'Cá chiên giòn', 1, 10000.0000, 1, 1, 108, 0.2, 0.4, 0.4, N'Món cá chiên giòn được chế biến từ chép, hương vị rất ngon và đậm đà, phù hợp cho mọi người', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/cachiengion1.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder], [Discontinued], [Calories], [Protein], [Carb], [Fat], [ProductDescription], [Images]) VALUES (2, N'Canh cải ngọt', 2, 5000.0000, 1, 1, 30, 0.05, 0.7, 0.25, N'Cảnh cải ngọt là món được nhiều người vô cùng yêu thích vì vị ngọt đạm chất miền nam', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/canhcaingot2.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder], [Discontinued], [Calories], [Protein], [Carb], [Fat], [ProductDescription], [Images]) VALUES (3, N'Chả giò chiên', 1, 100000.0000, 1, 1, 41, 0.5, 0.1, 0.4, N'Chả giò chiên là món truyền thống của người Việt', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/chagiochien3.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder], [Discontinued], [Calories], [Protein], [Carb], [Fat], [ProductDescription], [Images]) VALUES (4, N'Chả lụa kho', 1, 100000.0000, 1, 1, 102, 0.6, 0.1, 0.3, N'Chả lụa kho được bày bán và là sự lựa chọn yêu thích của nhiều người', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/chaluakho4.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder], [Discontinued], [Calories], [Protein], [Carb], [Fat], [ProductDescription], [Images]) VALUES (5, N'Canh khoai mỡ', 1, 10000.0000, 1, 1, 51, 0.3, 0.4, 0.3, N'Những củ khoai mỡ giòn tan trong miệng', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/canhkhoaimo5.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder], [Discontinued], [Calories], [Protein], [Carb], [Fat], [ProductDescription], [Images]) VALUES (6, N'Đậu hũ dồn thịt', 1, 15000.0000, 1, 1, 328, 0.7, 0.2, 0.1, N'Đậu hũ và thịt hòa trộn thành món ăn, khiến bạn không thể ngán nổi', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/dauhudonthit6.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder], [Discontinued], [Calories], [Protein], [Carb], [Fat], [ProductDescription], [Images]) VALUES (7, N'Gà kho gừng', 1, 40000.0000, 1, 1, 301, 0.65, 0.25, 0.1, N'Gừng thì thơm, gà thì ngon, mlem mlem', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/gakhogung7.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder], [Discontinued], [Calories], [Protein], [Carb], [Fat], [ProductDescription], [Images]) VALUES (8, N'Chả cá thác lác chiên', 1, 70000.0000, 1, 1, 133, 0.5, 0.2, 0.3, N'Chả cá thác lác ăn một miếng nhớ cả đời', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/chacathaclacchien8.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder], [Discontinued], [Calories], [Protein], [Carb], [Fat], [ProductDescription], [Images]) VALUES (9, N'Thịt bò xào hành tây', 1, 70000.0000, 1, 1, 132, 0.8, 0.1, 0.1, N'Thịt bò dai ngon', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/thitboxaohanhtay9.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder], [Discontinued], [Calories], [Protein], [Carb], [Fat], [ProductDescription], [Images]) VALUES (10, N'Bánh bao chay', 1, 20000.0000, 1, 1, 220, 0.1, 0.8, 0.1, N'Bánh báo ngon như trong phim', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/banhbaochay10.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder], [Discontinued], [Calories], [Protein], [Carb], [Fat], [ProductDescription], [Images]) VALUES (11, N'Nấm rơm kho', 2, 30000.0000, 1, 1, 154, 0.2, 0.6, 0.2, N'Nấm rơm lấy từ vườn, được kho với công thức đặc biệt', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/namromkho11.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder], [Discontinued], [Calories], [Protein], [Carb], [Fat], [ProductDescription], [Images]) VALUES (12, N'Hủ tiếu bò kho', 1, 25000.0000, 1, 1, 410, 0.75, 0.15, 0.1, N'Hương vị đậm đà', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/hutieubokho12.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder], [Discontinued], [Calories], [Protein], [Carb], [Fat], [ProductDescription], [Images]) VALUES (13, N'Măng kho thập cẩm', 2, 30000.0000, 1, 1, 141, 0.4, 0.2, 0.4, N'Những miếng măng được sơ chế kĩ càng, kết hợp cùng nhiểu nguyên liệu tạo một món hấp dẫn', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/mangkhothapcam13.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder], [Discontinued], [Calories], [Protein], [Carb], [Fat], [ProductDescription], [Images]) VALUES (14, N'Tôm sốt cà', 1, 40000.0000, 1, 1, 248, 0.8, 0.1, 0.1, N'Tôm tươi được nấu cùng với cà chua', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/tomsotca14.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder], [Discontinued], [Calories], [Protein], [Carb], [Fat], [ProductDescription], [Images]) VALUES (15, N'Sườn nướng', 1, 25000.0000, 1, 1, 123, 0.6, 0.2, 0.2, N'Những miếng sường được ước gia vị,nước với nhiệt độ vừa phải, khiến cho màu đẹp', N'https://vegafoodawsbucket.s3-ap-southeast-1.amazonaws.com/suonnuong15.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Shippers] ON 

INSERT [dbo].[Shippers] ([ShipperID], [CompanyName], [Phone]) VALUES (1, N'Grab', N'0989557581')
INSERT [dbo].[Shippers] ([ShipperID], [CompanyName], [Phone]) VALUES (2, N'Beamin', N'032562901')
SET IDENTITY_INSERT [dbo].[Shippers] OFF
GO
ALTER TABLE [dbo].[Menu Details]  WITH CHECK ADD  CONSTRAINT [FK_Menu Details_Menus] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menus] ([MenuID])
GO
ALTER TABLE [dbo].[Menu Details] CHECK CONSTRAINT [FK_Menu Details_Menus]
GO
ALTER TABLE [dbo].[Menu Details]  WITH CHECK ADD  CONSTRAINT [FK_Menu Details_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Menu Details] CHECK CONSTRAINT [FK_Menu Details_Products]
GO
ALTER TABLE [dbo].[Order Details]  WITH CHECK ADD  CONSTRAINT [FK_Order Details_Menus] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menus] ([MenuID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order Details_Menus]
GO
ALTER TABLE [dbo].[Order Details]  WITH CHECK ADD  CONSTRAINT [FK_Order Details_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order Details_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Payments] FOREIGN KEY([PaymentVia])
REFERENCES [dbo].[Payments] ([PaymentID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Payments]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([ShipVia])
REFERENCES [dbo].[Shippers] ([ShipperID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shippers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [Vegafood] SET  READ_WRITE 
GO
