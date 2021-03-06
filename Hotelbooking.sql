USE [master]
GO
/****** Object:  Database [HotelBooking]    Script Date: 2/28/2020 10:44:05 AM ******/
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
/****** Object:  StoredProcedure [dbo].[login]    Script Date: 2/28/2020 10:44:06 AM ******/
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
/****** Object:  StoredProcedure [dbo].[signup1]    Script Date: 2/28/2020 10:44:06 AM ******/
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
/****** Object:  StoredProcedure [dbo].[signup2]    Script Date: 2/28/2020 10:44:06 AM ******/
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
/****** Object:  Table [dbo].[addcat]    Script Date: 2/28/2020 10:44:06 AM ******/
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
/****** Object:  Table [dbo].[addcoupon]    Script Date: 2/28/2020 10:44:06 AM ******/
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
/****** Object:  Table [dbo].[addproduct]    Script Date: 2/28/2020 10:44:06 AM ******/
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
/****** Object:  Table [dbo].[addproductpic]    Script Date: 2/28/2020 10:44:06 AM ******/
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
/****** Object:  Table [dbo].[addsubcat]    Script Date: 2/28/2020 10:44:06 AM ******/
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
/****** Object:  Table [dbo].[BookedDetail]    Script Date: 2/28/2020 10:44:06 AM ******/
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
/****** Object:  Table [dbo].[brand]    Script Date: 2/28/2020 10:44:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[brand](
	[BID] [numeric](18, 0) IDENTITY(2000,1) NOT NULL,
	[BName] [varchar](500) NULL,
	[BLogo] [varchar](500) NULL,
 CONSTRAINT [PK_brand] PRIMARY KEY CLUSTERED 
(
	[BID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ordertable]    Script Date: 2/28/2020 10:44:06 AM ******/
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
/****** Object:  Table [dbo].[RoomBooking]    Script Date: 2/28/2020 10:44:06 AM ******/
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
 CONSTRAINT [PK_RoomBooking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[signup]    Script Date: 2/28/2020 10:44:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[signup](
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
/****** Object:  Table [dbo].[TblReservation]    Script Date: 2/28/2020 10:44:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblReservation](
	[reservation_id] [int] NULL,
	[hotel_id] [int] NULL,
	[room_id] [int] NULL,
	[check_in] [date] NULL,
	[check_out] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblRoom]    Script Date: 2/28/2020 10:44:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblRoom](
	[room_id] [int] NULL,
	[hotel_id] [int] NULL,
	[room_num] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tst_room_avl_chk]    Script Date: 2/28/2020 10:44:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tst_room_avl_chk](
	[booking_id] [int] NOT NULL,
	[room_id] [int] NOT NULL,
	[start_datetime] [datetime] NULL,
	[end_datetime] [datetime] NULL,
	[customer_id] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[addcat] ON 

GO
INSERT [dbo].[addcat] ([CatID], [CatName], [CatPic]) VALUES (CAST(100 AS Numeric(18, 0)), N'Rooms', N'single-room-cat.jpg')
GO
SET IDENTITY_INSERT [dbo].[addcat] OFF
GO
SET IDENTITY_INSERT [dbo].[addproduct] ON 

GO
INSERT [dbo].[addproduct] ([productid], [productname], [catid], [subcatid], [rate], [description], [productimage], [discount], [maxperson], [minperson]) VALUES (CAST(1112 AS Numeric(18, 0)), N'Room 1010', CAST(100 AS Numeric(18, 0)), CAST(1001 AS Numeric(18, 0)), CAST(1500 AS Numeric(18, 0)), N'Single Non AC Room', N'Room 1.jpg', CAST(0 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[addproduct] ([productid], [productname], [catid], [subcatid], [rate], [description], [productimage], [discount], [maxperson], [minperson]) VALUES (CAST(1114 AS Numeric(18, 0)), N'test123', CAST(100 AS Numeric(18, 0)), CAST(1001 AS Numeric(18, 0)), CAST(25000 AS Numeric(18, 0)), N'classic rooms', N'single-room-ac-cat.jpg', CAST(0 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[addproduct] OFF
GO
SET IDENTITY_INSERT [dbo].[addproductpic] ON 

GO
INSERT [dbo].[addproductpic] ([picid], [PID], [pic], [CatID], [SubCatID]) VALUES (CAST(772 AS Numeric(18, 0)), CAST(1112 AS Numeric(18, 0)), N'Room 1.jpg', CAST(100 AS Numeric(18, 0)), CAST(1001 AS Numeric(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[addproductpic] OFF
GO
SET IDENTITY_INSERT [dbo].[addsubcat] ON 

GO
INSERT [dbo].[addsubcat] ([SubCatID], [SubCatName], [CatID], [SubCatPic]) VALUES (CAST(1001 AS Numeric(18, 0)), N'Single Room (Non AC)', CAST(100 AS Numeric(18, 0)), N'single-room-cat.jpg')
GO
INSERT [dbo].[addsubcat] ([SubCatID], [SubCatName], [CatID], [SubCatPic]) VALUES (CAST(1009 AS Numeric(18, 0)), N'Single Room (AC)', CAST(100 AS Numeric(18, 0)), N'single-room-ac-cat.jpg')
GO
INSERT [dbo].[addsubcat] ([SubCatID], [SubCatName], [CatID], [SubCatPic]) VALUES (CAST(1010 AS Numeric(18, 0)), N'Deluxe Room ', CAST(100 AS Numeric(18, 0)), N'deluxe-room.jpeg')
GO
SET IDENTITY_INSERT [dbo].[addsubcat] OFF
GO
SET IDENTITY_INSERT [dbo].[brand] ON 

GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2000 AS Numeric(18, 0)), N'Levis', N'levis.png')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2001 AS Numeric(18, 0)), N'Arrow', N'logo-Arrow.gif')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2002 AS Numeric(18, 0)), N'NA', N'na.jpg')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2003 AS Numeric(18, 0)), N'Dress Berry', N'dressberry.jpg')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2004 AS Numeric(18, 0)), N'Imara', N'imara.jpg')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2005 AS Numeric(18, 0)), N'People', N'people.jpg')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2006 AS Numeric(18, 0)), N'Puma', N'Puma-Logo.jpg')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2007 AS Numeric(18, 0)), N'FabAlley', N'faballey.jpg')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2008 AS Numeric(18, 0)), N'Paprika', N'paprika.jpg')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2009 AS Numeric(18, 0)), N'Oasis', N'oasis.jpg')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2010 AS Numeric(18, 0)), N'Mango', N'mango.jpg')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2011 AS Numeric(18, 0)), N'Roadster', N'roadster.jpg')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2012 AS Numeric(18, 0)), N'Wills Lifestyle', N'wills lifestyle.jpg')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2013 AS Numeric(18, 0)), N'Adidas', N'adidas.png')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2014 AS Numeric(18, 0)), N'Calvin Klein Jeans', N'calvin klein jeans.jpg')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2015 AS Numeric(18, 0)), N'Pepe Jeans', N'6403e32a70d5a23a73a61502b32c7549.jpg')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2016 AS Numeric(18, 0)), N'HRX', N'4XxxRM2Z_400x400.jpeg')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2017 AS Numeric(18, 0)), N'GAS', N'GAS_Jeans_logo.jpg')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2018 AS Numeric(18, 0)), N'Park Avenue', N'seasonsway-park-avenue.jpg')
GO
INSERT [dbo].[brand] ([BID], [BName], [BLogo]) VALUES (CAST(2019 AS Numeric(18, 0)), N'Gini & Jony', N'Ginijony-220x120.jpg')
GO
SET IDENTITY_INSERT [dbo].[brand] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomBooking] ON 

GO
INSERT [dbo].[RoomBooking] ([BookingID], [TransNo], [RoomNo], [RoomPrice], [CustomerName], [CustAddress], [CustIdProof], [TotalPerson], [dtStart], [dtEnd], [RoomStatus], [PayMode], [PayStatus], [BankName], [PayDetails], [CheckIn], [CheckOut]) VALUES (60017, N'1', N'1112', N'1500', N'admin@gmail.com', N'kolhapur', N'1233      ', 2, CAST(0xCA400B00 AS Date), CAST(0xCB400B00 AS Date), N'Book', N'Cash', N'Pay', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[RoomBooking] ([BookingID], [TransNo], [RoomNo], [RoomPrice], [CustomerName], [CustAddress], [CustIdProof], [TotalPerson], [dtStart], [dtEnd], [RoomStatus], [PayMode], [PayStatus], [BankName], [PayDetails], [CheckIn], [CheckOut]) VALUES (60020, N'2', N'1112', N'1500', N'dheeraj', N'kolhapur', N'123456    ', 2, CAST(0xD0400B00 AS Date), CAST(0xD1400B00 AS Date), N'Hold', N'', N'', N'', N'          ', NULL, NULL)
GO
INSERT [dbo].[RoomBooking] ([BookingID], [TransNo], [RoomNo], [RoomPrice], [CustomerName], [CustAddress], [CustIdProof], [TotalPerson], [dtStart], [dtEnd], [RoomStatus], [PayMode], [PayStatus], [BankName], [PayDetails], [CheckIn], [CheckOut]) VALUES (60021, N'3', N'1114', N'25000', N'kalyan', N'kagal', N'6162      ', 1, CAST(0xCF400B00 AS Date), CAST(0xD0400B00 AS Date), N'Hold', N'', N'', N'', N'          ', CAST(0x0780969800000000 AS Time), CAST(0x0780969800000000 AS Time))
GO
INSERT [dbo].[RoomBooking] ([BookingID], [TransNo], [RoomNo], [RoomPrice], [CustomerName], [CustAddress], [CustIdProof], [TotalPerson], [dtStart], [dtEnd], [RoomStatus], [PayMode], [PayStatus], [BankName], [PayDetails], [CheckIn], [CheckOut]) VALUES (60022, N'4', N'1112', N'1500', N'kalyan', N'kolhapur', N'123456    ', 2, CAST(0xB9400B00 AS Date), CAST(0xBA400B00 AS Date), N'Hold', N'', N'', N'', N'          ', CAST(0x0780969800000000 AS Time), CAST(0x0780969800000000 AS Time))
GO
INSERT [dbo].[RoomBooking] ([BookingID], [TransNo], [RoomNo], [RoomPrice], [CustomerName], [CustAddress], [CustIdProof], [TotalPerson], [dtStart], [dtEnd], [RoomStatus], [PayMode], [PayStatus], [BankName], [PayDetails], [CheckIn], [CheckOut]) VALUES (60023, N'4', N'1114', N'25000', N'kalyan', N'kagal', N'6162      ', 2, CAST(0xB9400B00 AS Date), CAST(0xBA400B00 AS Date), N'Hold', N'', N'', N'', N'          ', CAST(0x0780969800000000 AS Time), CAST(0x0780969800000000 AS Time))
GO
SET IDENTITY_INSERT [dbo].[RoomBooking] OFF
GO
INSERT [dbo].[signup] ([Name], [Address], [City], [State], [Phone], [Username], [Password], [Image], [gender], [country], [sq], [sa], [UserType]) VALUES (N'Admin', N'jalandhar', N'Jalandhar', N'Punjab', N'7894561230', N'admin@gmail.com', N'123', N'jago.jpg', N'Female', N'India', N'Who is favourite actor?', N'shahrukh', N'admin')
GO
INSERT [dbo].[signup] ([Name], [Address], [City], [State], [Phone], [Username], [Password], [Image], [gender], [country], [sq], [sa], [UserType]) VALUES (N'dj', N'kop', N'kop', N'mah', N'9657155155', N'dj@gmail.com', N'123', N'default.png', N'Male', N'India', N'What is your pet name?', N'd', N'normal')
GO
INSERT [dbo].[TblReservation] ([reservation_id], [hotel_id], [room_id], [check_in], [check_out]) VALUES (1, 1, 1, CAST(0xA33C0B00 AS Date), CAST(0xA43C0B00 AS Date))
GO
INSERT [dbo].[TblReservation] ([reservation_id], [hotel_id], [room_id], [check_in], [check_out]) VALUES (2, 1, 1, CAST(0xA83C0B00 AS Date), CAST(0xAC3C0B00 AS Date))
GO
INSERT [dbo].[TblReservation] ([reservation_id], [hotel_id], [room_id], [check_in], [check_out]) VALUES (3, 1, 2, CAST(0xA33C0B00 AS Date), CAST(0xA53C0B00 AS Date))
GO
INSERT [dbo].[TblReservation] ([reservation_id], [hotel_id], [room_id], [check_in], [check_out]) VALUES (4, 1, 4, CAST(0xA33C0B00 AS Date), CAST(0xAC3C0B00 AS Date))
GO
INSERT [dbo].[TblReservation] ([reservation_id], [hotel_id], [room_id], [check_in], [check_out]) VALUES (5, 2, 5, CAST(0xA33C0B00 AS Date), CAST(0xAC3C0B00 AS Date))
GO
INSERT [dbo].[TblRoom] ([room_id], [hotel_id], [room_num]) VALUES (1, 1, 1100)
GO
INSERT [dbo].[TblRoom] ([room_id], [hotel_id], [room_num]) VALUES (2, 1, 1200)
GO
INSERT [dbo].[TblRoom] ([room_id], [hotel_id], [room_num]) VALUES (3, 1, 1300)
GO
INSERT [dbo].[TblRoom] ([room_id], [hotel_id], [room_num]) VALUES (4, 1, 1400)
GO
INSERT [dbo].[TblRoom] ([room_id], [hotel_id], [room_num]) VALUES (5, 2, 2500)
GO
INSERT [dbo].[tst_room_avl_chk] ([booking_id], [room_id], [start_datetime], [end_datetime], [customer_id]) VALUES (1, 1, NULL, NULL, NULL)
GO
USE [master]
GO
ALTER DATABASE [HotelBooking] SET  READ_WRITE 
GO
