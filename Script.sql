USE [master]
GO
/****** Object:  Database [HotelBooking]    Script Date: 3/4/2020 11:26:45 PM ******/
CREATE DATABASE [HotelBooking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelBooking', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\HotelBooking.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HotelBooking_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\HotelBooking_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HotelBooking] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelBooking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelBooking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelBooking] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelBooking] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HotelBooking] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HotelBooking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelBooking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelBooking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelBooking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelBooking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelBooking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelBooking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelBooking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelBooking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HotelBooking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelBooking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelBooking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelBooking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelBooking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelBooking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelBooking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelBooking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HotelBooking] SET  MULTI_USER 
GO
ALTER DATABASE [HotelBooking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelBooking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelBooking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelBooking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [HotelBooking]
GO
/****** Object:  StoredProcedure [dbo].[login]    Script Date: 3/4/2020 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[login]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@un varchar(50),
	@p varchar(50)
AS
	/* SET NOCOUNT ON */
	select * from signup  where username=@un and password=@p;
	RETURN

GO
/****** Object:  StoredProcedure [dbo].[signup1]    Script Date: 3/4/2020 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[signup1]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@un varchar(50)
AS   select * from signup where username=@un
	/* SET NOCOUNT ON */
	RETURN

GO
/****** Object:  StoredProcedure [dbo].[signup2]    Script Date: 3/4/2020 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[signup2]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@n varchar(50),
	@add varchar(50),
	@ct varchar(50),
	@st varchar(50),
	@ph varchar(50),
	@un varchar(50),
	@p varchar(50),
	@img varchar(50),
	@gender varchar(50),
	@country varchar(50),
	@sq varchar(500),
	@sa varchar(50),
	@ut varchar(50)

AS   insert into signup values(@n,@add,@ct,@st,@ph,@un,@p,@img,@gender,@country,@sq,@sa,@ut)
	/* SET NOCOUNT ON */
	RETURN

GO
/****** Object:  Table [dbo].[addcat]    Script Date: 3/4/2020 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[addcat](
	[CatID] [numeric](18, 0) IDENTITY(100,1) NOT NULL,
	[CatName] [varchar](100) NULL,
	[CatPic] [varchar](500) NULL,
 CONSTRAINT [PK_addcat] PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[addcoupon]    Script Date: 3/4/2020 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[addcoupon](
	[CouponID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CouponName] [varchar](50) NULL,
	[MinCartValue] [numeric](18, 0) NULL,
	[CouponPercent] [numeric](18, 0) NULL,
 CONSTRAINT [PK_addcoupon] PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[addproduct]    Script Date: 3/4/2020 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[addproduct](
	[productid] [numeric](18, 0) IDENTITY(1000,1) NOT NULL,
	[productname] [varchar](50) NULL,
	[catid] [numeric](18, 0) NULL,
	[subcatid] [numeric](18, 0) NULL,
	[rate] [numeric](18, 0) NULL,
	[description] [varchar](max) NULL,
	[productimage] [varchar](max) NULL,
	[discount] [numeric](18, 0) NULL,
	[maxperson] [numeric](18, 0) NULL,
	[minperson] [numeric](18, 0) NULL,
 CONSTRAINT [PK_addproduct] PRIMARY KEY CLUSTERED 
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[addproductpic]    Script Date: 3/4/2020 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[addproductpic](
	[picid] [numeric](18, 0) IDENTITY(500,1) NOT NULL,
	[PID] [numeric](18, 0) NULL,
	[pic] [varchar](500) NULL,
	[CatID] [numeric](18, 0) NULL,
	[SubCatID] [numeric](18, 0) NULL,
 CONSTRAINT [PK_addproductpic] PRIMARY KEY CLUSTERED 
(
	[picid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[addsubcat]    Script Date: 3/4/2020 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[addsubcat](
	[SubCatID] [numeric](18, 0) IDENTITY(1000,1) NOT NULL,
	[SubCatName] [varchar](100) NULL,
	[CatID] [numeric](18, 0) NULL,
	[SubCatPic] [varchar](500) NULL,
 CONSTRAINT [PK_addsubcat] PRIMARY KEY CLUSTERED 
(
	[SubCatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookedDetail]    Script Date: 3/4/2020 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookedDetail](
	[BookingID] [bigint] NOT NULL,
	[RoomNo] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](100) NULL,
	[TotalPerson] [int] NULL,
	[dtStart] [datetime] NULL,
	[dtEnd] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 3/4/2020 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Subject] [nvarchar](100) NULL,
	[Message] [nvarchar](max) NULL,
	[TranDate] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ordertable]    Script Date: 3/4/2020 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ordertable](
	[OrderNo] [numeric](18, 0) IDENTITY(10000,1) NOT NULL,
	[TotalCost] [numeric](18, 0) NULL,
	[Username] [varchar](50) NULL,
	[ShippingAddress] [varchar](50) NULL,
	[PaymentMode] [varchar](50) NULL,
	[HolderName] [varchar](50) NULL,
	[CardNumber] [varchar](50) NULL,
	[Company] [varchar](50) NULL,
	[Expiry] [varchar](50) NULL,
	[OrderDate] [date] NULL,
	[Status] [varchar](50) NULL,
	[OrderTime] [datetime] NULL,
 CONSTRAINT [PK_ordertable] PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomBooking]    Script Date: 3/4/2020 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomBooking](
	[BookingID] [bigint] IDENTITY(1,1) NOT NULL,
	[TransNo] [nvarchar](50) NULL,
	[RoomNo] [nvarchar](50) NULL,
	[RoomPrice] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](100) NULL,
	[CustAddress] [nvarchar](500) NULL,
	[CustIdProof] [nchar](10) NULL,
	[TotalPerson] [int] NULL,
	[dtStart] [date] NULL,
	[dtEnd] [date] NULL,
	[RoomStatus] [nvarchar](50) NULL,
	[PayMode] [nvarchar](50) NULL,
	[PayStatus] [nvarchar](50) NULL,
	[BankName] [nvarchar](100) NULL,
	[PayDetails] [nchar](10) NULL,
	[CheckIn] [time](7) NULL,
	[CheckOut] [time](7) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[EmailId] [nvarchar](50) NULL,
	[TranDate] [date] NULL,
 CONSTRAINT [PK_RoomBooking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[signup]    Script Date: 3/4/2020 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[signup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[Image] [varchar](50) NULL,
	[gender] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[sq] [varchar](500) NULL,
	[sa] [varchar](50) NULL,
	[UserType] [varchar](50) NULL,
 CONSTRAINT [PK_signup] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[addcat] ON 

GO
INSERT [dbo].[addcat] ([CatID], [CatName], [CatPic]) VALUES (CAST(105 AS Numeric(18, 0)), N'Room', N'room-1.jpg')
GO
SET IDENTITY_INSERT [dbo].[addcat] OFF
GO
SET IDENTITY_INSERT [dbo].[addproduct] ON 

GO
INSERT [dbo].[addproduct] ([productid], [productname], [catid], [subcatid], [rate], [description], [productimage], [discount], [maxperson], [minperson]) VALUES (CAST(1118 AS Numeric(18, 0)), N'SR AC 1001', CAST(105 AS Numeric(18, 0)), CAST(1016 AS Numeric(18, 0)), CAST(1700 AS Numeric(18, 0)), N'lorem ipsum&nbsp;', N'room-2.jpg', CAST(0 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[addproduct] ([productid], [productname], [catid], [subcatid], [rate], [description], [productimage], [discount], [maxperson], [minperson]) VALUES (CAST(1119 AS Numeric(18, 0)), N'SR AC 1002', CAST(105 AS Numeric(18, 0)), CAST(1016 AS Numeric(18, 0)), CAST(1700 AS Numeric(18, 0)), N'LOrem Ipsum', N'room-2.jpg', CAST(0 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[addproduct] ([productid], [productname], [catid], [subcatid], [rate], [description], [productimage], [discount], [maxperson], [minperson]) VALUES (CAST(1120 AS Numeric(18, 0)), N'SR AC 1003', CAST(105 AS Numeric(18, 0)), CAST(1016 AS Numeric(18, 0)), CAST(1700 AS Numeric(18, 0)), N'LOrem Ipsum', N'room-2.jpg', CAST(0 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[addproduct] ([productid], [productname], [catid], [subcatid], [rate], [description], [productimage], [discount], [maxperson], [minperson]) VALUES (CAST(1121 AS Numeric(18, 0)), N'DR 2001', CAST(105 AS Numeric(18, 0)), CAST(1017 AS Numeric(18, 0)), CAST(2500 AS Numeric(18, 0)), N'LOrem Ipsum', N'room-3.jpg', CAST(0 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[addproduct] ([productid], [productname], [catid], [subcatid], [rate], [description], [productimage], [discount], [maxperson], [minperson]) VALUES (CAST(1122 AS Numeric(18, 0)), N'DR 2002', CAST(105 AS Numeric(18, 0)), CAST(1017 AS Numeric(18, 0)), CAST(2500 AS Numeric(18, 0)), N'LOrem Ipsum', N'room-3.jpg', CAST(0 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[addproduct] ([productid], [productname], [catid], [subcatid], [rate], [description], [productimage], [discount], [maxperson], [minperson]) VALUES (CAST(1123 AS Numeric(18, 0)), N'DR 2003', CAST(105 AS Numeric(18, 0)), CAST(1017 AS Numeric(18, 0)), CAST(2500 AS Numeric(18, 0)), N'LOrem Ipsum', N'room-3.jpg', CAST(0 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[addproduct] OFF
GO
SET IDENTITY_INSERT [dbo].[addsubcat] ON 

GO
INSERT [dbo].[addsubcat] ([SubCatID], [SubCatName], [CatID], [SubCatPic]) VALUES (CAST(1016 AS Numeric(18, 0)), N'Single Room (AC)', CAST(105 AS Numeric(18, 0)), N'room-2.jpg')
GO
INSERT [dbo].[addsubcat] ([SubCatID], [SubCatName], [CatID], [SubCatPic]) VALUES (CAST(1017 AS Numeric(18, 0)), N'Deluxe Room', CAST(105 AS Numeric(18, 0)), N'room-3.jpg')
GO
INSERT [dbo].[addsubcat] ([SubCatID], [SubCatName], [CatID], [SubCatPic]) VALUES (CAST(1018 AS Numeric(18, 0)), N'Suite', CAST(105 AS Numeric(18, 0)), N'room-5.jpg')
GO
SET IDENTITY_INSERT [dbo].[addsubcat] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomBooking] ON 

GO
INSERT [dbo].[RoomBooking] ([BookingID], [TransNo], [RoomNo], [RoomPrice], [CustomerName], [CustAddress], [CustIdProof], [TotalPerson], [dtStart], [dtEnd], [RoomStatus], [PayMode], [PayStatus], [BankName], [PayDetails], [CheckIn], [CheckOut], [PhoneNo], [EmailId], [TranDate]) VALUES (70038, N'1', N'1118', N'1700', N'dheeraj', N'kop', N'1212      ', 2, CAST(0xCF400B00 AS Date), CAST(0xD0400B00 AS Date), N'Hold', NULL, NULL, NULL, NULL, CAST(0x0780969800000000 AS Time), CAST(0x0780969800000000 AS Time), N'9657145515', N'd@test.com', CAST(0xCF400B00 AS Date))
GO
SET IDENTITY_INSERT [dbo].[RoomBooking] OFF
GO
SET IDENTITY_INSERT [dbo].[signup] ON 

GO
INSERT [dbo].[signup] ([id], [Name], [Address], [City], [State], [Phone], [Username], [Password], [Image], [gender], [country], [sq], [sa], [UserType]) VALUES (1, N'Admin', N'Kolhapur', N'Kolhapur', N'Maharshtra', N'9822379113', N'admin@gmail.com', N'123', NULL, N'Male', N'India', N'Who is favourite actor?', N'shahrukh', N'admin')
GO
INSERT [dbo].[signup] ([id], [Name], [Address], [City], [State], [Phone], [Username], [Password], [Image], [gender], [country], [sq], [sa], [UserType]) VALUES (2, N'dj', N'kop', N'kop', N'mah', N'9657155155', N'dj@gmail.com', N'123', NULL, N'Male', N'India', N'What is your pet name?', N'd', N'normal')
GO
INSERT [dbo].[signup] ([id], [Name], [Address], [City], [State], [Phone], [Username], [Password], [Image], [gender], [country], [sq], [sa], [UserType]) VALUES (3, N'saa', N'asd', N'ads', N'asds', N'262665565656', N'duj@gmail.com', N'1234', NULL, N'Male', N'India', NULL, NULL, N'normal')
GO
SET IDENTITY_INSERT [dbo].[signup] OFF
GO
USE [master]
GO
ALTER DATABASE [HotelBooking] SET  READ_WRITE 
GO
