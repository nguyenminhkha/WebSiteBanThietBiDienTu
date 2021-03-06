
CREATE DATABASE [banhang2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'banhang2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\banhang2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'banhang2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\banhang2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [banhang2] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [banhang2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [banhang2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [banhang2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [banhang2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [banhang2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [banhang2] SET ARITHABORT OFF 
GO
ALTER DATABASE [banhang2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [banhang2] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [banhang2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [banhang2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [banhang2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [banhang2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [banhang2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [banhang2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [banhang2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [banhang2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [banhang2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [banhang2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [banhang2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [banhang2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [banhang2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [banhang2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [banhang2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [banhang2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [banhang2] SET  MULTI_USER 
GO
ALTER DATABASE [banhang2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [banhang2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [banhang2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [banhang2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [banhang2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [banhang2] SET QUERY_STORE = OFF
GO
USE [banhang2]
GO
/****** Object:  Table [dbo].[donhang]    Script Date: 12/20/2019 08:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[donhang](
	[tendangnhap] [nvarchar](50) NOT NULL,
	[mahang] [nvarchar](50) NOT NULL,
	[soluong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[tendangnhap] ASC,
	[mahang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khachhang]    Script Date: 12/20/2019 08:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachhang](
	[tendangnhap] [nvarchar](50) NOT NULL,
	[matkhau] [nvarchar](200) NULL,
	[email] [nvarchar](50) NULL,
	[sodienthoai] [char](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[tendangnhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loaihang]    Script Date: 12/20/2019 08:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loaihang](
	[maloai] [nvarchar](50) NOT NULL,
	[tenloai] [nvarchar](100) NULL,
	[hinh] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mathang]    Script Date: 12/20/2019 08:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mathang](
	[mahang] [nvarchar](50) NOT NULL,
	[tenhang] [nvarchar](100) NULL,
	[mota] [nvarchar](1000) NULL,
	[dongia] [float] NULL,
	[maloai] [nvarchar](50) NULL,
	[hinh] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[mahang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table]    Script Date: 12/20/2019 08:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[tendangnhap] [nvarchar](50) NOT NULL,
	[matkhau] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[tendangnhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[donhang] ([tendangnhap], [mahang], [soluong]) VALUES (N'admin', N'mh01', 3)
INSERT [dbo].[khachhang] ([tendangnhap], [matkhau], [email], [sodienthoai]) VALUES (N'admin', N'21232f297a57a5a743894a0e4a801fc3', N'admin@gmail.com', N'01653853174         ')
INSERT [dbo].[loaihang] ([maloai], [tenloai], [hinh]) VALUES (N'camera', N'MÁY ẢNH', N'may-quay-phim-sony-hdr-cx240e.jpg')
INSERT [dbo].[loaihang] ([maloai], [tenloai], [hinh]) VALUES (N'laptop', N'LAPTOP', N'acer-aspire-es1-432-c3c9-n3350-nxgfssv005-ava-200x200.jpg')
INSERT [dbo].[loaihang] ([maloai], [tenloai], [hinh]) VALUES (N'phone', N'ĐIỆN THOẠI', N'iphone-x-256gb-a1-600x600-600x600-200x200.jpg')
INSERT [dbo].[loaihang] ([maloai], [tenloai], [hinh]) VALUES (N'tablet', N'MÁY TÍNH BẢNG', N'ipad-pro-105-inch-wifi-cellular-64gb-2017-thumb-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh01', N'MÁY QUAY PHIM SONY HDR-CX240E', N'Camera chất lượng cao', 4690000, N'camera', N'canon-2050-309213-1-zoom.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh02', N'MÁY QUAY PHIM JVC GZ-E10BAG', N'Camera chất lượng cao', 5790000, N'camera', N'canon-8929-931402-1-zoom.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh03', N'MÁY QUAY PHIM JVC GZ-E205RAG', N'Camera chất lượng cao', 6660000, N'camera', N'MAY-ANH-PANASONIC-DMC-SZ3GA-K-DEN.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh04', N'MÁY QUAY PHIM JVC GZ-E205BAG', N'Camera chất lượng cao', 15200000, N'camera', N'MAY-QUAY-PHIM-GZ-E205-4.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh05', N'
MÁY QUAY PHIM JVC GZ-MS150HAG', N'Camera chất lượng cao', 7450000, N'camera', N'may-quay-phim-sony-hdr-cx240e.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh06', N'MÁY ẢNH PANASONIC DMC-SZ3GA-K', N'Camera chất lượng cao', 8960000, N'camera', N'may-quay-phim-sony-hdr-PJ240E-1(1).jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh07', N'CANON VIXIA HF M40', N'Camera chất lượng cao', 7410000, N'camera', N'máy-quayphim-JVC-GZ-MS150-anh4.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh08', N'
SONY HANDYCAM DCR-SR47', N'Camera chất lượng cao', 8990000, N'camera', N'may-quayphim-samsung-HMX-Q130BP-anh113212544574ec0be39ba90c(1)(1).jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh09', N'SONY HDR-CX240E – MÁY QUAY THẺ NHỚ', N'Camera chất lượng cao', 7690000, N'camera', N'sony-7155-751762-1-product.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh10', N'SONY HDR-PJ340E - 30X - MÁY QUAY PHIM', N'Camera chất lượng cao', 5360000, N'camera', N'sony-7211-061762-1-product.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh11', N'Lenovo Ideapad 120S 11IAP N3350/2GB/32GB', N'Laptop chất lượng', 14890000, N'laptop', N'acer-aspire-a314-31-c2ux-nxgnssv008-ava-1-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh12', N'Acer Aspire ES1 432 N3350/2GB/500GB/Win10', N'Laptop chất lượng', 16980000, N'laptop', N'acer-aspire-a315-31-p2lj-nxgntsv010-ava-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh13', N'Acer Aspire A314 31 C2UX N3350/Win10', N'Laptop chất lượng', 15890000, N'laptop', N'acer-aspire-e5-475-33wt-i3-6006u-1-450x300-450x300-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh14', N'Asus X441NA N4200/4GB/500GB/Win10', N'Laptop chất lượng', 14880000, N'laptop', N'acer-aspire-es1-432-c3c9-n3350-nxgfssv005-ava-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh15', N'Acer Aspire A315 31 P2LJ N4200/4GB/500GB', N'Laptop chất lượng', 36980000, N'laptop', N'asus-x441ma-n5000-ga004t-450-230x153.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh16', N'Asus X441MA N5000/4GB/500GB/Win10', N'Laptop chất lượng', 25860000, N'laptop', N'asus-x441na-n4200-ava-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh17', N'HP 15 da0048TU N5000/4GB/500GB/Win10', N'Laptop chất lượng', 12350000, N'laptop', N'asus-x541ua-i3-6100u-xx272t-dai-dien-10-450x300-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh18', N'Acer Aspire E5 475 33WT i3 6006U/4GB/500GB/', N'Laptop chất lượng', 12350000, N'laptop', N'hp-15-da0048tu-4me63pa-450-300-230x153.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh19', N'Lenovo Ideapad 320 14ISK i3 6006U/4GB/1TB/', N'Laptop chất lượng', 12470000, N'laptop', N'lenovo-ideapad-120s-11iap-n3350-81a400dyvn-450-300-450x300-230x153.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh20', N'Asus X541UA i3 6100U/4GB/1TB/15.6"/Win10', N'Laptop chất lượng', 11990000, N'laptop', N'lenovo-ideapad-320-14isk-i3-6006u-80xg007svn-ava-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh21', N'Điện thoại iPhone 8 256GB', N'Điện thoại chất lượng', 11250000, N'phone', N'iphone-8-256gb-hh-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh22', N'Điện thoại iPhone 8 Plus Red 256GB', N'Điện thoại chất lượng', 11230000, N'phone', N'iphone-8-plus-do-256gb-600x600-190x190.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh23', N'Điện thoại iPhone 8 Plus 64GB', N'Điện thoại chất lượng', 14890000, N'phone', N'iphone-8-plus-hh-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh24', N'Điện thoại iPhone 8 Plus Red 64GB', N'Điện thoại chất lượng', 16990000, N'phone', N'iphone-8-plus-red-600x600-600x600-190x190.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh25', N'Điện thoại iPhone X 256GB Gray', N'Điện thoại chất lượng', 25880000, N'phone', N'iphone-x-256gb-a1-600x600-600x600-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh26', N'Điện thoại iPhone X 256GB Silver', N'Điện thoại chất lượng', 13990000, N'phone', N'iphone-x-256gb-silver-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh27', N'Điện thoại iPhone X 64GB Gray', N'Điện thoại chất lượng', 25780000, N'phone', N'iphone-x-64gb-21-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh28', N'Điện thoại iPhone X 64GB Silver', N'Điện thoại chất lượng', 11980000, N'phone', N'iphone-x-64gb-silver-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh29', N'Điện thoại Samsung Galaxy Note 9', N'Điện thoại chất lượng', 23990000, N'phone', N'samsung-galaxy-note-9-512gb-blue-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh30', N'Điện thoại Samsung Galaxy S9+', N'Điện thoại chất lượng', 14990000, N'phone', N'samsung-galaxy-s9-plus-128gb-600x600-600x600-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh31', N'Máy tính bảng iPad Wifi Cellular  32GB (2018) ', N'Máy tính bảng chất lượng', 21990000, N'tablet', N'ipad-mini-4-wifi-128gb-thumb-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh32', N'Máy tính bảng iPad Mini 4 Wifi 128GB (2017)', N'Máy tính bảng chất lượng', 12590000, N'tablet', N'ipad-pro-105-inch-wifi-64gb-2017-thumb-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh33', N'Máy tính bảng iPad Pro 10.5 inch Wifi 64GB (2017)', N'Máy tính bảng chất lượng', 23990000, N'tablet', N'ipad-pro-105-inch-wifi-cellular-64gb-2017-thumb-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh34', N'Máy tính bảng iPad Wifi 128 GB (2018) (2017)', N'Máy tính bảng chất lượng', 56990000, N'tablet', N'ipad-wifi-128-gb-2018-thumb-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh35', N'Máy tính bảng iPad Wifi Cellular 32GB (2017)', N'Máy tính bảng chất lượng', 12390000, N'tablet', N'ipad-wifi-32gb-2018-thumb-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh36', N'Máy tính bảng iPad Wifi Cellular 32GB (2018)', N'Máy tính bảng chất lượng', 36580000, N'tablet', N'ipad-wifi-cellular-128gb-2018-thumb-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh37', N'Máy tính bảng iPad Wifi Cellular 128GB (2018)', N'Máy tính bảng chất lượng', 12580000, N'tablet', N'ipad-wifi-cellular-32g-2018-thumb-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh38', N'Máy tính bảng iPad Pro 10.5 inch Wifi Cellular 64GB', N'Máy tính bảng chất lượng', 46990000, N'tablet', N'ipad-wifi-cellular-32gb-2017-thumb-200x200.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh39', N'Máy tính bảng Samsung Galaxy Tab A 10.5 inch', N'Máy tính bảng chất lượng', 23690000, N'tablet', N'samsung-galaxy-tab-a-105-inch-thumb-190x190.jpg')
INSERT [dbo].[mathang] ([mahang], [tenhang], [mota], [dongia], [maloai], [hinh]) VALUES (N'mh40', N'Máy tính bảng Samsung Galaxy Tab S4 10.5 inch S-Pen', N'Máy tính bảng chất lượng', 13680000, N'tablet', N'samsung-galaxy-tab-s4-105-inch-thumb-but-spen-190x190.jpg')
ALTER TABLE [dbo].[donhang]  WITH CHECK ADD  CONSTRAINT [FK_donhang_khachhang] FOREIGN KEY([tendangnhap])
REFERENCES [dbo].[khachhang] ([tendangnhap])
GO
ALTER TABLE [dbo].[donhang] CHECK CONSTRAINT [FK_donhang_khachhang]
GO
ALTER TABLE [dbo].[donhang]  WITH CHECK ADD  CONSTRAINT [FK_donhang_mathang] FOREIGN KEY([mahang])
REFERENCES [dbo].[mathang] ([mahang])
GO
ALTER TABLE [dbo].[donhang] CHECK CONSTRAINT [FK_donhang_mathang]
GO
ALTER TABLE [dbo].[mathang]  WITH CHECK ADD  CONSTRAINT [FK_mathang_loaihang] FOREIGN KEY([maloai])
REFERENCES [dbo].[loaihang] ([maloai])
GO
ALTER TABLE [dbo].[mathang] CHECK CONSTRAINT [FK_mathang_loaihang]
GO
USE [master]
GO
ALTER DATABASE [banhang2] SET  READ_WRITE 
GO
