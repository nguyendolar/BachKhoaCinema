USE [master]
GO
/****** Object:  Database [CGV]    Script Date: 3/1/2023 10:08:30 PM ******/
CREATE DATABASE [CGV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CGV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CGV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CGV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CGV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CGV] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CGV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CGV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CGV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CGV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CGV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CGV] SET ARITHABORT OFF 
GO
ALTER DATABASE [CGV] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CGV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CGV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CGV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CGV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CGV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CGV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CGV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CGV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CGV] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CGV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CGV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CGV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CGV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CGV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CGV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CGV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CGV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CGV] SET  MULTI_USER 
GO
ALTER DATABASE [CGV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CGV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CGV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CGV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CGV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CGV] SET QUERY_STORE = OFF
GO
USE [CGV]
GO
/****** Object:  Table [dbo].[booking]    Script Date: 3/1/2023 10:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[film_id] [int] NOT NULL,
	[schedule_id] [int] NOT NULL,
	[showtime_id] [int] NOT NULL,
	[room_id] [int] NOT NULL,
	[seat_id] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[status] [int] NOT NULL,
	[create_time] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category_film]    Script Date: 3/1/2023 10:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_film](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category_post]    Script Date: 3/1/2023 10:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[films]    Script Date: 3/1/2023 10:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[films](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NULL,
	[director] [nvarchar](255) NULL,
	[actor] [nvarchar](255) NOT NULL,
	[duration] [int] NULL,
	[film_name] [nvarchar](255) NULL,
	[image] [nvarchar](255) NULL,
	[trailer] [nvarchar](max) NULL,
	[id_cfilm] [int] NOT NULL,
	[premiere_date] [datetime] NULL,
	[trash] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 3/1/2023 10:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](250) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[image] [nvarchar](250) NULL,
	[created_at] [datetime] NOT NULL,
	[id_cpost] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ratings]    Script Date: 3/1/2023 10:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ratings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[film_id] [int] NULL,
	[rate] [nvarchar](max) NULL,
	[id_user] [int] NULL,
	[created_time] [datetime] NOT NULL,
	[name_user] [nvarchar](255) NOT NULL,
	[number_start] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 3/1/2023 10:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room]    Script Date: 3/1/2023 10:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[room_name] [nvarchar](255) NULL,
	[trash] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roomseat]    Script Date: 3/1/2023 10:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roomseat](
	[id_room] [int] NOT NULL,
	[id_seat] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scheduleroom]    Script Date: 3/1/2023 10:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scheduleroom](
	[id_schedule] [int] NOT NULL,
	[id_room] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[schedules]    Script Date: 3/1/2023 10:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schedules](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[film_id] [int] NULL,
	[dateschedule] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seats]    Script Date: 3/1/2023 10:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seats](
	[id] [int] IDENTITY(10,1) NOT NULL,
	[seat_name] [nvarchar](255) NULL,
	[trash] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[showtimes]    Script Date: 3/1/2023 10:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[showtimes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[schedule_id] [int] NOT NULL,
	[start_time] [time](7) NOT NULL,
	[end_time] [time](7) NOT NULL,
	[id_room] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usercgv]    Script Date: 3/1/2023 10:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usercgv](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NULL,
	[is_active] [int] NULL,
	[password] [nvarchar](255) NULL,
	[phonenumber] [nvarchar](255) NULL,
	[role_id] [int] NULL,
	[username] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[booking] ON 

INSERT [dbo].[booking] ([id], [id_user], [film_id], [schedule_id], [showtime_id], [room_id], [seat_id], [amount], [status], [create_time]) VALUES (81, 50, 17, 87, 98, 1, 13, 65000, 1, N'638120807042818639')
INSERT [dbo].[booking] ([id], [id_user], [film_id], [schedule_id], [showtime_id], [room_id], [seat_id], [amount], [status], [create_time]) VALUES (82, 50, 17, 87, 98, 1, 15, 65000, 1, N'638120807042818639')
INSERT [dbo].[booking] ([id], [id_user], [film_id], [schedule_id], [showtime_id], [room_id], [seat_id], [amount], [status], [create_time]) VALUES (83, 50, 17, 87, 98, 1, 14, 65000, 1, N'638120807042818639')
INSERT [dbo].[booking] ([id], [id_user], [film_id], [schedule_id], [showtime_id], [room_id], [seat_id], [amount], [status], [create_time]) VALUES (84, 50, 19, 88, 99, 7, 14, 65000, 1, N'638120811111346936')
INSERT [dbo].[booking] ([id], [id_user], [film_id], [schedule_id], [showtime_id], [room_id], [seat_id], [amount], [status], [create_time]) VALUES (85, 50, 19, 88, 99, 7, 15, 65000, 1, N'638120811111346936')
INSERT [dbo].[booking] ([id], [id_user], [film_id], [schedule_id], [showtime_id], [room_id], [seat_id], [amount], [status], [create_time]) VALUES (86, 52, 17, 90, 101, 2, 12, 65000, 1, N'638133032475686653')
INSERT [dbo].[booking] ([id], [id_user], [film_id], [schedule_id], [showtime_id], [room_id], [seat_id], [amount], [status], [create_time]) VALUES (87, 52, 17, 90, 101, 2, 13, 65000, 1, N'638133032475686653')
INSERT [dbo].[booking] ([id], [id_user], [film_id], [schedule_id], [showtime_id], [room_id], [seat_id], [amount], [status], [create_time]) VALUES (88, 52, 17, 90, 101, 2, 14, 65000, 1, N'638133032475686653')
INSERT [dbo].[booking] ([id], [id_user], [film_id], [schedule_id], [showtime_id], [room_id], [seat_id], [amount], [status], [create_time]) VALUES (89, 52, 18, 91, 102, 1, 13, 65000, 1, N'638133034028287553')
INSERT [dbo].[booking] ([id], [id_user], [film_id], [schedule_id], [showtime_id], [room_id], [seat_id], [amount], [status], [create_time]) VALUES (90, 52, 18, 91, 102, 1, 14, 65000, 1, N'638133034028287553')
SET IDENTITY_INSERT [dbo].[booking] OFF
GO
SET IDENTITY_INSERT [dbo].[category_film] ON 

INSERT [dbo].[category_film] ([id], [name]) VALUES (1, N'Phim tình cảm')
INSERT [dbo].[category_film] ([id], [name]) VALUES (2, N'Phim hành động')
INSERT [dbo].[category_film] ([id], [name]) VALUES (3, N'Phim kinh dị')
INSERT [dbo].[category_film] ([id], [name]) VALUES (5, N'Phim hài')
SET IDENTITY_INSERT [dbo].[category_film] OFF
GO
SET IDENTITY_INSERT [dbo].[category_post] ON 

INSERT [dbo].[category_post] ([id], [name]) VALUES (1, N'Khuyến mãi')
INSERT [dbo].[category_post] ([id], [name]) VALUES (2, N'Tin tức hằng ngày')
SET IDENTITY_INSERT [dbo].[category_post] OFF
GO
SET IDENTITY_INSERT [dbo].[films] ON 

INSERT [dbo].[films] ([id], [description], [director], [actor], [duration], [film_name], [image], [trailer], [id_cfilm], [premiere_date], [trash]) VALUES (17, N'<p>Phim xoay quanh gia đình của bà Nữ (nghệ sĩ Lê Giang đảm nhận) - người làm nghề bán bánh canh. Truyện phim khắc họa mối quan hệ phức tạp, đa chiều xảy ra với các thành viên trong gia đình. Câu tagline (thông điệp) chính "Mỗi gia đình đều có những bí mật" chứa nhiều ẩn ý về nội dung bộ phim muốn gửi gắm.</p>
', N'Trấn Thành', N'Trấn Thành, Lê Giang, Uyển Ân, Khả Như,..', 120, N'Nhà Bà Nữ', N'film783311445.jpg', N'https://www.youtube.com/embed/Q8WE8CAPtXw', 1, CAST(N'2023-02-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[films] ([id], [description], [director], [actor], [duration], [film_name], [image], [trailer], [id_cfilm], [premiere_date], [trash]) VALUES (18, N'<p>Sau th&agrave;nh c&ocirc;ng vang dội khắp Ch&acirc;u &Aacute; năm 2019, Muốn Gặp Anh - phi&ecirc;n bản điện ảnh với c&acirc;u chuyện t&igrave;nh y&ecirc;u vượt cả kh&ocirc;ng gian v&agrave; thời gian ho&agrave;n to&agrave;n mới mẻ sẽ ra mắt tr&ecirc;n m&agrave;n ảnh rộng. Liệu rằng Ho&agrave;ng Vũ Huy&ecirc;n v&agrave; L&yacute; Tử Duy c&oacute; thể thay đổi số phận mỗi khi giai điệu b&agrave;i h&aacute;t Last Dance vang l&ecirc;n?</p>
', N'Tienjen Huang', N'Alice Ko, Greg Hsu, Patrick Shih,...', 120, N'Muốn Gặp Anh', N'film702384298.jpg', N'https://www.youtube.com/embed/ywnYmQBwhKU', 1, CAST(N'2023-02-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[films] ([id], [description], [director], [actor], [duration], [film_name], [image], [trailer], [id_cfilm], [premiere_date], [trash]) VALUES (19, N'<p>&quot;Thanh &Acirc;m T&igrave;nh Đầu&quot; xoay quanh c&acirc;u chuyện của hai bạn sinh vi&ecirc;n trẻ c&ugrave;ng học tại một trường đại học, nhưng lại sống ở hai mốc thời gian kh&aacute;c nhau: Kim Yong sống v&agrave;o năm 1999, v&agrave; Mo-nee sống v&agrave;o năm 2022. Cả hai t&igrave;nh cờ c&oacute; được một chiếc radio cũ kỹ. Trong lần nguyệt thực to&agrave;n phần v&agrave;o năm 1999 v&agrave; 2022, cặp đ&ocirc;i n&agrave;y c&oacute; thể li&ecirc;n lạc với nhau xuy&ecirc;n thời gian một c&aacute;ch kỳ diệu th&ocirc;ng qua radio. Họ bắt đầu t&acirc;m sự về c&acirc;u chuyện t&igrave;nh y&ecirc;u cũng như t&igrave;nh bạn của mỗi người.</p>
', N'Eun-young Seo', N'Yi-Hyun Cho, Kim Hye-yoon, Yeo Jin-gu,...', 120, N'Thanh Âm Tình Đầu', N'film144752473.jpg', N'https://www.youtube.com/embed/2MTBdud5sCg', 1, CAST(N'2023-03-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[films] ([id], [description], [director], [actor], [duration], [film_name], [image], [trailer], [id_cfilm], [premiere_date], [trash]) VALUES (20, N'<p>Khi Ta Hai Lăm xoay quanh Tuệ L&acirc;m (Midu), một nữ quản l&yacute; nghệ sĩ trẻ với t&acirc;m huyết ch&aacute;y bỏng d&agrave;nh cho nh&oacute;m nhạc của m&igrave;nh - The Air. Tuy nhi&ecirc;n một biến cố lớn xảy ra khiến mọi dự định d&agrave;nh cho nh&oacute;m bị tr&igrave; ho&atilde;n, c&ograve;n Tuệ L&acirc;m phải sang H&agrave;n Quốc l&agrave;m việc. Ngay sau khi trở về, c&ocirc; quyết t&acirc;m kh&ocirc;i phục lại nh&oacute;m nhạc đầu ti&ecirc;n m&agrave; m&igrave;nh quản l&yacute; trong sự nghiệp v&agrave; cho họ một m&agrave;n debut xứng đ&aacute;ng.</p>
', N'Luk Vân', N'Midu, Phú Thịnh, Lê Dương Bảo Lâm, Lãnh Thanh,...', 120, N'Khi Ta Hai Lăm', N'film191313395.jpg', N'https://www.youtube.com/embed/RkmuehsuS3c', 5, CAST(N'2023-03-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[films] ([id], [description], [director], [actor], [duration], [film_name], [image], [trailer], [id_cfilm], [premiere_date], [trash]) VALUES (31, N'<p>&quot;Kh&oacute;a Chặt Cửa N&agrave;o Suzume&quot; kể c&acirc;u chuyện khi Suzume v&ocirc; t&igrave;nh gặp một ch&agrave;ng trai trẻ đến thị trấn nơi c&ocirc; sinh sống với mục đ&iacute;ch t&igrave;m kiếm &quot;một c&aacute;nh cửa&quot;. Để bảo vệ Nhật Bản khỏi thảm họa, những c&aacute;nh cửa rải r&aacute;c khắp nơi phải được đ&oacute;ng lại, v&agrave; bất ngờ thay Suzume cũng c&oacute; khả năng đ&oacute;ng cửa đặc biệt n&agrave;y. Từ đ&oacute; cả hai c&ugrave;ng nhau thực hiện sự mệnh &quot;kh&oacute;a chặt cửa&quot;!</p>
', N'Makoto Shinkai', N'Makoto Shinkai', 120, N'Khóa chặt cửa nào Suzume', N'film1968643609.jpg', N'https://www.youtube.com/embed/w9HWe8zt64M', 1, CAST(N'2023-03-10T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[films] OFF
GO
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([id], [title], [description], [image], [created_at], [id_cpost]) VALUES (5, N'THÊM 03 THÁNG ĐỂ TRỞ THÀNH VIP & VVIP 2023', N'Nhân dịp đầu năm 2021, xin chân thành cám ơn tất cả Quý khách hàng thành viên đã đồng hành cùng Lê Độ trong 2020 vừa qua. Như một lời tri ân và chào mừng năm mới, Lê Độ mang đến chương trình cực kỳ hấp dẫn: “THÊM 03 THÁNG ĐỂ NÂNG HẠNG VIP / VVIP 2021”<br><br><b>A. DUY TRÌ HẠNG THÀNH VIÊN DÀNH CHO KHÁCH HÀNG VIP/ VVIP 2020</b><br><br><b>1. KHÁCH HÀNG VIP CỦA NĂM 2020</b> có tổng chi tiêu trong 12 tháng (từ 01/01/2020 – 31/12/2020) <b>CHƯA ĐỦ ĐIỀU KIỆN ĐỂ TRỞ THÀNH KHÁCH HÀNG VIP CỦA NĂM 2021</b> vẫn sẽ được sử dụng quyền lợi VIP trong 03 tháng đầu của năm 2021 (từ 01/01/2021 đến 31/03/2021), bao gồm:<br>\r\n                - Quà sinh nhật dành cho VIP (đối với khách hàng có sinh nhật trong tháng 1, 2 & 3 năm 2021)<br>\r\n                - Tích luỹ điểm thưởng theo tỷ lệ của hạng VIP<br>\r\n                - Giảm giá 15% thức ăn nóng<br>\r\n                *Khách hàng thuộc nhóm này nhận 08 vé xem phim 2D/3D miễn phí từ ngày 04/01/2021 do đạt điều kiện trở thành VIP vào 01/01/2021.<br><br><b>B. CƠ HỘI NÂNG HẠNG VIP VVIP 2021 DÀNH CHO TẤT CẢ CÁC KHÁCH HÀNG:</b><br>\r\n                Tất cả các khách hàng thành viên Lê Độ sẽ được xét tổng chi tiêu vào 01/04/2021 để có cơ hội nâng hạng VIP/VVIP 2021. Tổng chi tiêu được sử dụng để xét nâng hạng bao gồm 15 tháng, từ 01/01/2020 đến 31/03/2021.<br>\r\n                Chi tiết về điều kiện và quyền lợi của từng nhóm thành viên sau khi xét hạng ngày 10/02/2023, vui lòng liên hệ hotline để biết thêm thông tin chi tiết!<br>', N'event1.png', CAST(N'2023-02-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[post] ([id], [title], [description], [image], [created_at], [id_cpost]) VALUES (6, N'BỘ SƯU TẬP DORAEMON', N'Còn gì tuyệt hơn khi vừa ôm Mon ú trong tay, vừa nhâm nhi bắp rang giòn tan và thưởng thức phim bom tấn tại hệ thống rạp Lê Độ nè. Cùng Lê Độ sưu tập đủ bộ sản phẩm Doraemon siêu đáng yêu ngay nhé.<br>\r\n                <b>Thông tin sản phẩm:</b><br>\r\n                - Pouch Combo 109k bao gồm: 1 Doraemon Pouch + 1 nước ngọt siêu lớn 32oz<br>\r\n                - Pillow Combo 179k bao gồm: 1 Doraemon Pillow + 1 nước ngọt siêu lớn 32oz<br>\r\n                - Dinosaur Combo 339k bao gồm: 1 Doraemon Dinosaur + 1 nước ngọt siêu lớn 32oz<br>\r\n                (*) Mua thêm một phần bắp ngọt lớn với giá 29k thui nhé\r\n                Sản phẩm được bán độc quyền tại Lê Độ khu vực Hồ Chí Minh, Hà Nội, Bình Dương và Đồng Nai. Số lượng có hạn.', N'event2.png', CAST(N'2023-02-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[post] ([id], [title], [description], [image], [created_at], [id_cpost]) VALUES (7, N'HAPPY OX YEAR – HAPPY OX COMBO', N'Tiếp tục thông lệ đón năm mới hằng năm, Bach Khoa Cinema mở bán “đặc sản” ly thiết kế theo năm <b>Happy Ox Combo</b> mừng năm 2023.<br><br>\r\n                Rinh ngay ly Trâu vui vẻ để cả năm mọi việc đều suông sẻ nhé cả nhà.<br><br>\r\n                Sản phẩm hiện đang được bán độc quyền tại các cụm rạp Lê Độ khu vực Hồ Chí Minh, Hà Nội, Bình Dương, Biên Hòa , Cần Thơ, Trà Vinh.<br><br>\r\n                Happy OX Combo giá 249k bao gồm: 1 ly Trâu vui vẻ 44oz (kèm nước) + 1 bắp ngọt lớn 44oz<br><br>\r\n                <b>Tải app Lê Độ để mua sản phẩm sớm hơn, nhanh hơn:</b><br>\r\n                <a href=\"https://apps.apple.com/us/app/cgv-cinemas/id1067166194\">- Tải Lê Độ Cinemas cho iOS</a><br>\r\n                <a href=\"https://play.google.com/store/apps/details?id=com.cgv.cinema.vn\">- Tải Lê Độ Cinemas cho Android</a>', N'event3.png', CAST(N'2023-02-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[post] ([id], [title], [description], [image], [created_at], [id_cpost]) VALUES (8, N'CHƯƠNG TRÌNH AN TOÀN CÙNG Bach Khoa Cinema', N'<b>Thông tin sản phẩm:</b><br>\r\n                Khi mua N95 Combo giá 139k bao gồm 1 bắp Caramel 44oz, 2 Coke 32oz, và 1 snack, khách hàng sẽ được tặng 1 lần refill nước miễn phí và 1 khẩu trang kháng khuẩn cao cấp 3P-N95.<br>\r\n                Thời gian diễn ra từ 25/3 – 25/4/2021<br>\r\n                Địa điểm áp dụng: tại các cụm rạp Lê Độ Cinemas Hà Nội, Hồ Chí Minh, Đà Nẵng, Bình Dương, Đồng Nai, Cần Thơ.<br>\r\n                <b>Điều kiện & Điều khoản:</b><br>\r\n                - Chương trình áp dụng cho cả giao dịch online và offline<br>\r\n                - Chương trình có thể kết thúc sớm hơn dự kiến khi số lượng quà tặng đã phát hết<br>\r\n                - Một thành viên được tham gia mua nhiều combo để nhận số lượng quà tương ứng<br>\r\n                - Chương trình không áp dụng đồng thời đối với các khuyến mại khác<br>\r\n                - Phụ thu khi đổi vị bắp và nước theo qui định của Bach Khoa Cinema', N'event4.png', CAST(N'2023-02-15T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[post] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[role] ([id], [role_name]) VALUES (2, N'Nhân Viên')
INSERT [dbo].[role] ([id], [role_name]) VALUES (3, N'Khách Hàng')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[room] ON 

INSERT [dbo].[room] ([id], [room_name], [trash]) VALUES (1, N'IMAX', 1)
INSERT [dbo].[room] ([id], [room_name], [trash]) VALUES (2, N'SWEETBOX', 1)
INSERT [dbo].[room] ([id], [room_name], [trash]) VALUES (3, N'IMAX', 1)
INSERT [dbo].[room] ([id], [room_name], [trash]) VALUES (7, N'STD', 1)
SET IDENTITY_INSERT [dbo].[room] OFF
GO
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 10)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 11)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 12)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 13)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 14)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 15)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 16)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 17)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 18)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 19)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 26)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 27)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 28)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 29)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 30)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 31)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 32)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 33)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 34)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 35)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 36)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 37)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 38)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 39)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (7, 40)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (1, 10)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (1, 11)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (1, 12)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (1, 13)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (1, 14)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (1, 15)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (1, 16)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (1, 17)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (1, 18)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (1, 19)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (1, 26)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (1, 27)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (1, 28)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (1, 29)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (1, 30)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 10)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 11)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 12)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 13)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 14)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 15)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 16)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 17)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 18)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 19)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 26)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 27)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 28)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 29)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 30)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 31)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 32)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 33)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 34)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 35)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 36)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 37)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 38)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 39)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (3, 40)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (2, 10)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (2, 11)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (2, 12)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (2, 13)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (2, 14)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (2, 15)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (2, 16)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (2, 17)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (2, 18)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (2, 19)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (2, 26)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (2, 27)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (2, 28)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (2, 29)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (2, 30)
GO
INSERT [dbo].[scheduleroom] ([id_schedule], [id_room]) VALUES (87, 1)
INSERT [dbo].[scheduleroom] ([id_schedule], [id_room]) VALUES (88, 7)
INSERT [dbo].[scheduleroom] ([id_schedule], [id_room]) VALUES (89, 2)
INSERT [dbo].[scheduleroom] ([id_schedule], [id_room]) VALUES (90, 2)
INSERT [dbo].[scheduleroom] ([id_schedule], [id_room]) VALUES (91, 1)
GO
SET IDENTITY_INSERT [dbo].[schedules] ON 

INSERT [dbo].[schedules] ([id], [film_id], [dateschedule]) VALUES (87, 17, CAST(N'2023-02-15' AS Date))
INSERT [dbo].[schedules] ([id], [film_id], [dateschedule]) VALUES (88, 19, CAST(N'2023-02-15' AS Date))
INSERT [dbo].[schedules] ([id], [film_id], [dateschedule]) VALUES (89, 18, CAST(N'2023-02-17' AS Date))
INSERT [dbo].[schedules] ([id], [film_id], [dateschedule]) VALUES (90, 17, CAST(N'2023-03-02' AS Date))
INSERT [dbo].[schedules] ([id], [film_id], [dateschedule]) VALUES (91, 18, CAST(N'2023-03-03' AS Date))
SET IDENTITY_INSERT [dbo].[schedules] OFF
GO
SET IDENTITY_INSERT [dbo].[seats] ON 

INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (10, N'A1', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (11, N'A2', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (12, N'A3', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (13, N'A4', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (14, N'A5', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (15, N'B1', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (16, N'B2', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (17, N'B3', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (18, N'B4', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (19, N'B5', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (26, N'C1', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (27, N'C2', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (28, N'C3', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (29, N'C4', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (30, N'C5', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (31, N'D1', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (32, N'D2', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (33, N'D3', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (34, N'D4', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (35, N'D5', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (36, N'E1', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (37, N'E2', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (38, N'E3', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (39, N'E4', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (40, N'E5', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (41, N'F1', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (42, N'F2', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (43, N'F3', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (44, N'F4', 1)
INSERT [dbo].[seats] ([id], [seat_name], [trash]) VALUES (45, N'F5', 1)
SET IDENTITY_INSERT [dbo].[seats] OFF
GO
SET IDENTITY_INSERT [dbo].[showtimes] ON 

INSERT [dbo].[showtimes] ([id], [schedule_id], [start_time], [end_time], [id_room]) VALUES (98, 87, CAST(N'21:00:00' AS Time), CAST(N'23:00:00' AS Time), 1)
INSERT [dbo].[showtimes] ([id], [schedule_id], [start_time], [end_time], [id_room]) VALUES (99, 88, CAST(N'21:00:00' AS Time), CAST(N'23:00:00' AS Time), 7)
INSERT [dbo].[showtimes] ([id], [schedule_id], [start_time], [end_time], [id_room]) VALUES (100, 89, CAST(N'21:00:00' AS Time), CAST(N'23:00:00' AS Time), 2)
INSERT [dbo].[showtimes] ([id], [schedule_id], [start_time], [end_time], [id_room]) VALUES (101, 90, CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 2)
INSERT [dbo].[showtimes] ([id], [schedule_id], [start_time], [end_time], [id_room]) VALUES (102, 91, CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[showtimes] OFF
GO
SET IDENTITY_INSERT [dbo].[usercgv] ON 

INSERT [dbo].[usercgv] ([id], [email], [is_active], [password], [phonenumber], [role_id], [username]) VALUES (1, N'admin@gmail.com', 1, N'25f9e794323b453885f5181f1b624db', N'0394073758', 1, N'Quản trị viên')
INSERT [dbo].[usercgv] ([id], [email], [is_active], [password], [phonenumber], [role_id], [username]) VALUES (3, N'nhanvien12@gmail.com', 1, N'25f9e794323b453885f5181f1b624db', N'0379135465', 2, N'Nhân Viên')
INSERT [dbo].[usercgv] ([id], [email], [is_active], [password], [phonenumber], [role_id], [username]) VALUES (50, N'nguyencaonguyen@gmail.com', 1, N'25f9e794323b453885f5181f1b624db', N'0390473635', 3, N'Nguyen')
INSERT [dbo].[usercgv] ([id], [email], [is_active], [password], [phonenumber], [role_id], [username]) VALUES (52, N'nguyencaonguyencmu@gmail.com', 1, N'e1adc3949ba59abbe56e057f2f883e', N'0394173635', 3, N'levanc')
SET IDENTITY_INSERT [dbo].[usercgv] OFF
GO
ALTER TABLE [dbo].[booking] ADD  DEFAULT ('0') FOR [status]
GO
ALTER TABLE [dbo].[films] ADD  DEFAULT (NULL) FOR [description]
GO
ALTER TABLE [dbo].[films] ADD  DEFAULT (NULL) FOR [director]
GO
ALTER TABLE [dbo].[films] ADD  DEFAULT (NULL) FOR [duration]
GO
ALTER TABLE [dbo].[films] ADD  DEFAULT (NULL) FOR [film_name]
GO
ALTER TABLE [dbo].[films] ADD  DEFAULT (NULL) FOR [image]
GO
ALTER TABLE [dbo].[films] ADD  DEFAULT (NULL) FOR [trailer]
GO
ALTER TABLE [dbo].[films] ADD  CONSTRAINT [de_fau]  DEFAULT ((1)) FOR [trash]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT (NULL) FOR [image]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[ratings] ADD  DEFAULT (NULL) FOR [film_id]
GO
ALTER TABLE [dbo].[ratings] ADD  DEFAULT (NULL) FOR [rate]
GO
ALTER TABLE [dbo].[ratings] ADD  DEFAULT (NULL) FOR [id_user]
GO
ALTER TABLE [dbo].[ratings] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[role] ADD  DEFAULT (NULL) FOR [role_name]
GO
ALTER TABLE [dbo].[room] ADD  DEFAULT (NULL) FOR [room_name]
GO
ALTER TABLE [dbo].[room] ADD  CONSTRAINT [de_faut]  DEFAULT ((1)) FOR [trash]
GO
ALTER TABLE [dbo].[schedules] ADD  DEFAULT (NULL) FOR [film_id]
GO
ALTER TABLE [dbo].[schedules] ADD  DEFAULT (NULL) FOR [dateschedule]
GO
ALTER TABLE [dbo].[seats] ADD  DEFAULT (NULL) FOR [seat_name]
GO
ALTER TABLE [dbo].[seats] ADD  CONSTRAINT [de_fautr]  DEFAULT ((1)) FOR [trash]
GO
ALTER TABLE [dbo].[usercgv] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[usercgv] ADD  DEFAULT (NULL) FOR [is_active]
GO
ALTER TABLE [dbo].[usercgv] ADD  DEFAULT (NULL) FOR [password]
GO
ALTER TABLE [dbo].[usercgv] ADD  DEFAULT (NULL) FOR [phonenumber]
GO
ALTER TABLE [dbo].[usercgv] ADD  DEFAULT (NULL) FOR [role_id]
GO
ALTER TABLE [dbo].[usercgv] ADD  DEFAULT (NULL) FOR [username]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [booking_ibfk_1] FOREIGN KEY([film_id])
REFERENCES [dbo].[films] ([id])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [booking_ibfk_1]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [booking_ibfk_4] FOREIGN KEY([showtime_id])
REFERENCES [dbo].[showtimes] ([id])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [booking_ibfk_4]
GO
ALTER TABLE [dbo].[films]  WITH CHECK ADD  CONSTRAINT [fk_ten] FOREIGN KEY([id_cfilm])
REFERENCES [dbo].[category_film] ([id])
GO
ALTER TABLE [dbo].[films] CHECK CONSTRAINT [fk_ten]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [fk_post] FOREIGN KEY([id_cpost])
REFERENCES [dbo].[category_post] ([id])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [fk_post]
GO
ALTER TABLE [dbo].[ratings]  WITH CHECK ADD  CONSTRAINT [fk_film] FOREIGN KEY([film_id])
REFERENCES [dbo].[films] ([id])
GO
ALTER TABLE [dbo].[ratings] CHECK CONSTRAINT [fk_film]
GO
ALTER TABLE [dbo].[ratings]  WITH CHECK ADD  CONSTRAINT [fk_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[usercgv] ([id])
GO
ALTER TABLE [dbo].[ratings] CHECK CONSTRAINT [fk_user]
GO
ALTER TABLE [dbo].[roomseat]  WITH CHECK ADD  CONSTRAINT [FK_roomid] FOREIGN KEY([id_room])
REFERENCES [dbo].[room] ([id])
GO
ALTER TABLE [dbo].[roomseat] CHECK CONSTRAINT [FK_roomid]
GO
ALTER TABLE [dbo].[roomseat]  WITH CHECK ADD  CONSTRAINT [FK_seatid] FOREIGN KEY([id_seat])
REFERENCES [dbo].[seats] ([id])
GO
ALTER TABLE [dbo].[roomseat] CHECK CONSTRAINT [FK_seatid]
GO
ALTER TABLE [dbo].[scheduleroom]  WITH CHECK ADD FOREIGN KEY([id_room])
REFERENCES [dbo].[room] ([id])
GO
ALTER TABLE [dbo].[scheduleroom]  WITH CHECK ADD FOREIGN KEY([id_schedule])
REFERENCES [dbo].[schedules] ([id])
GO
ALTER TABLE [dbo].[schedules]  WITH CHECK ADD  CONSTRAINT [fk_filmid] FOREIGN KEY([film_id])
REFERENCES [dbo].[films] ([id])
GO
ALTER TABLE [dbo].[schedules] CHECK CONSTRAINT [fk_filmid]
GO
ALTER TABLE [dbo].[usercgv]  WITH CHECK ADD  CONSTRAINT [fk_userrole] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[usercgv] CHECK CONSTRAINT [fk_userrole]
GO
USE [master]
GO
ALTER DATABASE [CGV] SET  READ_WRITE 
GO
