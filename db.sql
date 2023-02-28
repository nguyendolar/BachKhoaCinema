USE [master]
GO
CREATE DATABASE [CGV]
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
/****** Object:  Table [dbo].[booking]    Script Date: 7/31/2022 12:33:37 PM ******/
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
/****** Object:  Table [dbo].[category_film]    Script Date: 7/31/2022 12:33:37 PM ******/
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
/****** Object:  Table [dbo].[category_post]    Script Date: 7/31/2022 12:33:37 PM ******/
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
/****** Object:  Table [dbo].[films]    Script Date: 7/31/2022 12:33:37 PM ******/
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
/****** Object:  Table [dbo].[post]    Script Date: 7/31/2022 12:33:37 PM ******/
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
/****** Object:  Table [dbo].[ratings]    Script Date: 7/31/2022 12:33:37 PM ******/
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
/****** Object:  Table [dbo].[role]    Script Date: 7/31/2022 12:33:37 PM ******/
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
/****** Object:  Table [dbo].[room]    Script Date: 7/31/2022 12:33:37 PM ******/
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
/****** Object:  Table [dbo].[roomseat]    Script Date: 7/31/2022 12:33:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roomseat](
	[id_room] [int] NOT NULL,
	[id_seat] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scheduleroom]    Script Date: 7/31/2022 12:33:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scheduleroom](
	[id_schedule] [int] NOT NULL,
	[id_room] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[schedules]    Script Date: 7/31/2022 12:33:37 PM ******/
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
/****** Object:  Table [dbo].[seats]    Script Date: 7/31/2022 12:33:37 PM ******/
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
/****** Object:  Table [dbo].[showtimes]    Script Date: 7/31/2022 12:33:37 PM ******/
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
/****** Object:  Table [dbo].[usercgv]    Script Date: 7/31/2022 12:33:37 PM ******/
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
SET IDENTITY_INSERT [dbo].[category_film] ON 

INSERT [dbo].[category_film] ([id], [name]) VALUES (1, N'Phim tình cảm')
INSERT [dbo].[category_film] ([id], [name]) VALUES (2, N'Phim hành động')
INSERT [dbo].[category_film] ([id], [name]) VALUES (3, N'Phim kinh dị')
SET IDENTITY_INSERT [dbo].[category_film] OFF
GO
SET IDENTITY_INSERT [dbo].[category_post] ON 

INSERT [dbo].[category_post] ([id], [name]) VALUES (1, N'Khuyến mãi')
INSERT [dbo].[category_post] ([id], [name]) VALUES (2, N'Giới thiệu')
SET IDENTITY_INSERT [dbo].[category_post] OFF
GO
SET IDENTITY_INSERT [dbo].[films] ON 

INSERT [dbo].[films] ([id], [description], [director], [actor], [duration], [film_name], [image], [trailer], [id_cfilm], [premiere_date], [trash]) VALUES (1, N'Hay', N'Trấn Thành', N'Trấn Thành , Tuấn Trần', 120, N'Bố Già', N'bogia.jpg', N'https://www.youtube.com/embed/jluSu8Rw6YE', 1, CAST(N'2022-06-19T12:11:54.000' AS DateTime), 1)
INSERT [dbo].[films] ([id], [description], [director], [actor], [duration], [film_name], [image], [trailer], [id_cfilm], [premiere_date], [trash]) VALUES (2, N'Hay', N'Quang Dũng', N'Wowy', 120, N'Ròm', N'rom.jpg', N'https://www.youtube.com/embed/XRm1P7oGpMQ', 2, CAST(N'2022-06-19T12:11:54.000' AS DateTime), 1)
INSERT [dbo].[films] ([id], [description], [director], [actor], [duration], [film_name], [image], [trailer], [id_cfilm], [premiere_date], [trash]) VALUES (3, N'Hay', N'Nước ngoài', N'Wowy', 120, N'Ấn Quỷ', N'anquy.jpg', N'https://www.youtube.com/embed/NmQiJPLYzPI', 2, CAST(N'2022-06-19T12:11:54.000' AS DateTime), 1)
INSERT [dbo].[films] ([id], [description], [director], [actor], [duration], [film_name], [image], [trailer], [id_cfilm], [premiere_date], [trash]) VALUES (4, N'Hay', N'Nước ngoài', N'Nước ngoài', 120, N' Minions - Sự Trỗi Dậy Của Gru ', N'minion.jpg', N'https://www.youtube.com/embed/54yAKyNkK7w', 2, CAST(N'2022-06-19T12:11:54.000' AS DateTime), 1)
INSERT [dbo].[films] ([id], [description], [director], [actor], [duration], [film_name], [image], [trailer], [id_cfilm], [premiere_date], [trash]) VALUES (5, N'Hay', N'Nước ngoài', N'Nước ngoài', 120, N'Veldom', N'venom2.jpg', N'https://www.youtube.com/embed/54yAKyNkK7w', 3, CAST(N'2022-06-19T12:11:54.000' AS DateTime), 1)
INSERT [dbo].[films] ([id], [description], [director], [actor], [duration], [film_name], [image], [trailer], [id_cfilm], [premiere_date], [trash]) VALUES (6, N'Hay', N'Nước ngoài', N'Nước ngoài', 120, N'Veldom', N'camtu.jpg', N'https://www.youtube.com/embed/54yAKyNkK7w', 3, CAST(N'2022-06-19T12:11:54.000' AS DateTime), 1)
INSERT [dbo].[films] ([id], [description], [director], [actor], [duration], [film_name], [image], [trailer], [id_cfilm], [premiere_date], [trash]) VALUES (7, N'Hay', N'Nước ngoài', N'Nước ngoài', 120, N'hotel', N'hotel.jpg', N'https://www.youtube.com/embed/54yAKyNkK7w', 3, CAST(N'2022-06-19T12:11:54.000' AS DateTime), 1)
INSERT [dbo].[films] ([id], [description], [director], [actor], [duration], [film_name], [image], [trailer], [id_cfilm], [premiere_date], [trash]) VALUES (8, N'Hay', N'Nước ngoài', N'Nước ngoài', 120, N'kinh dị', N'kinhdi.jpg', N'https://www.youtube.com/embed/54yAKyNkK7w', 3, CAST(N'2022-06-19T12:11:54.000' AS DateTime), 1)
INSERT [dbo].[films] ([id], [description], [director], [actor], [duration], [film_name], [image], [trailer], [id_cfilm], [premiere_date], [trash]) VALUES (9, N'<p>Hay</p>
', N'Nước ngoài', N'Nước ngoài', 120, N'Baby', N'baby.jpg', N'https://www.youtube.com/embed/54yAKyNkK7w', 3, CAST(N'2022-08-06T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[films] ([id], [description], [director], [actor], [duration], [film_name], [image], [trailer], [id_cfilm], [premiere_date], [trash]) VALUES (11, N'<p>Ch&igrave;a Kho&aacute; Trăm Tỷ bắt đầu khi một s&aacute;t thủ kh&eacute;t tiếng v&ocirc; t&igrave;nh bị mất tr&iacute; v&igrave; một tai nạn bất ngờ, rồi bắt đầu một cuộc sống mới bằng nghề diễn vi&ecirc;n quần ch&uacute;ng. Chuyện g&igrave; sẽ xảy ra nếu ch&agrave;ng diễn vi&ecirc;n quần ch&uacute;ng n&agrave;y qu&ecirc;n hẳn cuộc đời s&aacute;t thủ để trở th&agrave;nh một ng&ocirc;i sao h&agrave;nh động? Liệu sự nghiệp diễn vi&ecirc;n v&agrave; c&ocirc; quản l&yacute; bất đắc dĩ c&oacute; gi&uacute;p hắn thay đổi qu&aacute; khứ m&atilde;i m&atilde;i v&agrave; sống trọn vẹn một cuộc đời mới? Một bộ phim h&agrave;i-h&agrave;nh động nhưng cũng đầy sự ấm &aacute;p về h&agrave;nh tr&igrave;nh &quot;đổi đời&quot; của một kẻ giết thu&ecirc; để mưu sinh.</p>
', N'Võ Thanh Hoà', N'Kiều Minh Tuấn, Thu Trang, Jun Vũ', 90, N'Chìa khóa trăm tỷ', N'film1534469493.jpg', N'https://www.youtube.com/embed/WQmGwmc-XUY', 2, CAST(N'2022-08-06T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[films] ([id], [description], [director], [actor], [duration], [film_name], [image], [trailer], [id_cfilm], [premiere_date], [trash]) VALUES (12, N'<p>Shang-Chi v&agrave; Huyền Thoại Thập Nhẫn l&agrave; bộ phim thuộc giai đoạn 4 của Vũ trụ điện ảnh Marvel. Nh&acirc;n vật n&agrave;y được biết đến như một bậc thầy Kung Fu, tinh th&ocirc;ng v&otilde; thuật. Sức mạnh của Shang-Chi đến từ h&agrave;ng ng&agrave;n giờ luyện tập miệt m&agrave;i v&agrave; sự kỷ luật cao độ với bản th&acirc;n. Si&ecirc;u anh h&ugrave;ng v&otilde; thuật n&agrave;y được ch&iacute;nh bố dạy dỗ để trở th&agrave;nh một s&aacute;t thủ chuy&ecirc;n nghiệp v&agrave; kế thừa tập đo&agrave;n tội &aacute;c của &ocirc;ng.</p>
', N'Destin Daniel Cretton', N'Simu Liu, Awkwafina, Tony Chiu-Wai Leung', 120, N'Shang-Chi và Huyền Thoại Thập ', N'film491300553.jpg', N'https://www.youtube.com/embed/WQmGwmc-XUY', 2, CAST(N'2022-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[films] ([id], [description], [director], [actor], [duration], [film_name], [image], [trailer], [id_cfilm], [premiere_date], [trash]) VALUES (13, N'<p>Do miếng cơm manh &aacute;o, c&ocirc; sinh vi&ecirc;n A Young đ&agrave;nh chấp nhận c&ocirc;ng việc tr&ocirc;ng trẻ cho b&agrave; mẹ đơn th&acirc;n Young Chae. Tuy nhi&ecirc;n khi ph&aacute;t hiện chị ta v&igrave; qu&aacute; kh&oacute; khăn m&agrave; định đưa đứa b&eacute; v&agrave;o trại mồ c&ocirc;i, n&agrave;ng ta đ&atilde; quyết t&acirc;m ngăn cản v&igrave; A Young cũng l&agrave; một đứa trẻ lớn l&ecirc;n trong c&ocirc; nhi viện với nhiều đau thương v&agrave; đơn độc.</p>
', N'Kim Hyun Tak', N'Kim Hyang Gi, Ryoo Hyoun Kyoung', 120, N'ĐỨA BÉ', N'film1596570781.jpg', N'https://www.youtube.com/embed/o5MigMFi77M', 1, CAST(N'2022-08-03T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[films] OFF
GO
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([id], [title], [description], [image], [created_at], [id_cpost]) VALUES (5, N'THÊM 03 THÁNG ĐỂ TRỞ THÀNH VIP & VVIP 2021', N'Nhân dịp đầu năm 2021, xin chân thành cám ơn tất cả Quý khách hàng thành viên đã đồng hành cùng Lê Độ trong 2020 vừa qua. Như một lời tri ân và chào mừng năm mới, Lê Độ mang đến chương trình cực kỳ hấp dẫn: “THÊM 03 THÁNG ĐỂ NÂNG HẠNG VIP / VVIP 2021”<br><br><b>A. DUY TRÌ HẠNG THÀNH VIÊN DÀNH CHO KHÁCH HÀNG VIP/ VVIP 2020</b><br><br><b>1. KHÁCH HÀNG VIP CỦA NĂM 2020</b> có tổng chi tiêu trong 12 tháng (từ 01/01/2020 – 31/12/2020) <b>CHƯA ĐỦ ĐIỀU KIỆN ĐỂ TRỞ THÀNH KHÁCH HÀNG VIP CỦA NĂM 2021</b> vẫn sẽ được sử dụng quyền lợi VIP trong 03 tháng đầu của năm 2021 (từ 01/01/2021 đến 31/03/2021), bao gồm:<br>\r\n                - Quà sinh nhật dành cho VIP (đối với khách hàng có sinh nhật trong tháng 1, 2 & 3 năm 2021)<br>\r\n                - Tích luỹ điểm thưởng theo tỷ lệ của hạng VIP<br>\r\n                - Giảm giá 15% thức ăn nóng<br>\r\n                *Khách hàng thuộc nhóm này nhận 08 vé xem phim 2D/3D miễn phí từ ngày 04/01/2021 do đạt điều kiện trở thành VIP vào 01/01/2021.<br><br><b>B. CƠ HỘI NÂNG HẠNG VIP VVIP 2021 DÀNH CHO TẤT CẢ CÁC KHÁCH HÀNG:</b><br>\r\n                Tất cả các khách hàng thành viên Lê Độ sẽ được xét tổng chi tiêu vào 01/04/2021 để có cơ hội nâng hạng VIP/VVIP 2021. Tổng chi tiêu được sử dụng để xét nâng hạng bao gồm 15 tháng, từ 01/01/2020 đến 31/03/2021.<br>\r\n                Chi tiết về điều kiện và quyền lợi của từng nhóm thành viên sau khi xét hạng ngày 01/04/2021, vui lòng liên hệ hotline để biết thêm thông tin chi tiết!<br>', N'event1.png', CAST(N'2022-06-19T12:11:54.000' AS DateTime), 1)
INSERT [dbo].[post] ([id], [title], [description], [image], [created_at], [id_cpost]) VALUES (6, N'BỘ SƯU TẬP DORAEMON', N'Còn gì tuyệt hơn khi vừa ôm Mon ú trong tay, vừa nhâm nhi bắp rang giòn tan và thưởng thức phim bom tấn tại hệ thống rạp Lê Độ nè. Cùng Lê Độ sưu tập đủ bộ sản phẩm Doraemon siêu đáng yêu ngay nhé.<br>\r\n                <b>Thông tin sản phẩm:</b><br>\r\n                - Pouch Combo 109k bao gồm: 1 Doraemon Pouch + 1 nước ngọt siêu lớn 32oz<br>\r\n                - Pillow Combo 179k bao gồm: 1 Doraemon Pillow + 1 nước ngọt siêu lớn 32oz<br>\r\n                - Dinosaur Combo 339k bao gồm: 1 Doraemon Dinosaur + 1 nước ngọt siêu lớn 32oz<br>\r\n                (*) Mua thêm một phần bắp ngọt lớn với giá 29k thui nhé\r\n                Sản phẩm được bán độc quyền tại Lê Độ khu vực Hồ Chí Minh, Hà Nội, Bình Dương và Đồng Nai. Số lượng có hạn.', N'event2.png', CAST(N'2022-06-19T12:11:54.000' AS DateTime), 1)
INSERT [dbo].[post] ([id], [title], [description], [image], [created_at], [id_cpost]) VALUES (7, N'HAPPY OX YEAR – HAPPY OX COMBO', N'Tiếp tục thông lệ đón năm mới hằng năm, Lê Độ mở bán “đặc sản” ly thiết kế theo năm <b>Happy Ox Combo</b> mừng năm Tân Sửu 2021.<br><br>\r\n                Rinh ngay ly Trâu vui vẻ để cả năm mọi việc đều suông sẻ nhé cả nhà.<br><br>\r\n                Sản phẩm hiện đang được bán độc quyền tại các cụm rạp Lê Độ khu vực Hồ Chí Minh, Hà Nội, Bình Dương, Biên Hòa , Cần Thơ, Trà Vinh.<br><br>\r\n                Happy OX Combo giá 249k bao gồm: 1 ly Trâu vui vẻ 44oz (kèm nước) + 1 bắp ngọt lớn 44oz<br><br>\r\n                <b>Tải app Lê Độ để mua sản phẩm sớm hơn, nhanh hơn:</b><br>\r\n                <a href=\"https://apps.apple.com/us/app/cgv-cinemas/id1067166194\">- Tải Lê Độ Cinemas cho iOS</a><br>\r\n                <a href=\"https://play.google.com/store/apps/details?id=com.cgv.cinema.vn\">- Tải Lê Độ Cinemas cho Android</a>', N'event3.png', CAST(N'2022-06-19T12:11:54.000' AS DateTime), 1)
INSERT [dbo].[post] ([id], [title], [description], [image], [created_at], [id_cpost]) VALUES (8, N'CHƯƠNG TRÌNH AN TOÀN CÙNG Lê Độ', N'<b>Thông tin sản phẩm:</b><br>\r\n                Khi mua N95 Combo giá 139k bao gồm 1 bắp Caramel 44oz, 2 Coke 32oz, và 1 snack, khách hàng sẽ được tặng 1 lần refill nước miễn phí và 1 khẩu trang kháng khuẩn cao cấp 3P-N95.<br>\r\n                Thời gian diễn ra từ 25/3 – 25/4/2021<br>\r\n                Địa điểm áp dụng: tại các cụm rạp Lê Độ Cinemas Hà Nội, Hồ Chí Minh, Đà Nẵng, Bình Dương, Đồng Nai, Cần Thơ.<br>\r\n                <b>Điều kiện & Điều khoản:</b><br>\r\n                - Chương trình áp dụng cho cả giao dịch online và offline<br>\r\n                - Chương trình có thể kết thúc sớm hơn dự kiến khi số lượng quà tặng đã phát hết<br>\r\n                - Một thành viên được tham gia mua nhiều combo để nhận số lượng quà tương ứng<br>\r\n                - Chương trình không áp dụng đồng thời đối với các khuyến mại khác<br>\r\n                - Phụ thu khi đổi vị bắp và nước theo qui định của Lê Độ', N'event4.png', CAST(N'2022-06-19T12:11:54.000' AS DateTime), 1)
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
INSERT [dbo].[room] ([id], [room_name], [trash]) VALUES (3, N'IMAX3', 1)
INSERT [dbo].[room] ([id], [room_name], [trash]) VALUES (7, N'STD1', 1)
INSERT [dbo].[room] ([id], [room_name], [trash]) VALUES (8, N'STD2', 1)
INSERT [dbo].[room] ([id], [room_name], [trash]) VALUES (10, N'STD', 1)
INSERT [dbo].[room] ([id], [room_name], [trash]) VALUES (11, N'STD41', 1)
INSERT [dbo].[room] ([id], [room_name], [trash]) VALUES (15, N'phon1', 0)
INSERT [dbo].[room] ([id], [room_name], [trash]) VALUES (16, N'dsdsds', 0)
INSERT [dbo].[room] ([id], [room_name], [trash]) VALUES (17, N'fadsfasdfasd', 0)
INSERT [dbo].[room] ([id], [room_name], [trash]) VALUES (18, N'STDa', 0)
INSERT [dbo].[room] ([id], [room_name], [trash]) VALUES (19, N'CGV', 1)
SET IDENTITY_INSERT [dbo].[room] OFF
GO
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (15, 10)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (15, 11)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (15, 12)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (15, 13)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (15, 14)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (15, 15)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (15, 16)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (15, 17)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (15, 18)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (15, 19)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (15, 26)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (15, 27)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (15, 28)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (15, 29)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (15, 30)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (16, 10)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (16, 11)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (16, 12)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (16, 13)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (16, 14)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (16, 15)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (16, 16)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (16, 17)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (16, 18)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (16, 19)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (17, 10)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (17, 11)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (17, 12)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (17, 13)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (17, 14)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (17, 15)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (17, 16)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (17, 17)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (17, 18)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (17, 19)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (17, 26)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (17, 27)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (17, 28)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (17, 29)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (17, 30)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 10)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 11)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 12)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 13)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 14)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 15)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 16)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 17)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 18)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 19)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 26)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 27)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 28)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 29)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 30)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 31)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 32)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 33)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 34)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 35)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 36)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 37)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 38)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 39)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 40)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 41)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 42)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 43)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 44)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (8, 45)
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
GO
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
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (10, 10)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (10, 11)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (10, 12)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (10, 13)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (10, 14)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (10, 15)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (10, 16)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (10, 17)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (10, 18)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (10, 19)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 10)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 11)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 12)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 13)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 14)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 15)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 16)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 17)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 18)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 19)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 26)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 27)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 28)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 29)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 30)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 31)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 32)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 33)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 34)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 35)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 36)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 37)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 38)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 39)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (11, 40)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (18, 10)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (18, 11)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (18, 12)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (18, 13)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (18, 14)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (18, 15)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (18, 16)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (18, 17)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (18, 18)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (18, 19)
GO
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 10)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 11)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 12)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 13)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 14)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 15)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 16)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 17)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 18)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 19)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 26)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 27)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 28)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 29)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 30)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 31)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 32)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 33)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 34)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 35)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 36)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 37)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 38)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 39)
INSERT [dbo].[roomseat] ([id_room], [id_seat]) VALUES (19, 40)
GO
INSERT [dbo].[scheduleroom] ([id_schedule], [id_room]) VALUES (78, 1)
INSERT [dbo].[scheduleroom] ([id_schedule], [id_room]) VALUES (79, 2)
INSERT [dbo].[scheduleroom] ([id_schedule], [id_room]) VALUES (80, 1)
INSERT [dbo].[scheduleroom] ([id_schedule], [id_room]) VALUES (81, 7)
GO
SET IDENTITY_INSERT [dbo].[schedules] ON 

INSERT [dbo].[schedules] ([id], [film_id], [dateschedule]) VALUES (78, 12, CAST(N'2022-07-01' AS Date))
INSERT [dbo].[schedules] ([id], [film_id], [dateschedule]) VALUES (79, 12, CAST(N'2022-06-30' AS Date))
INSERT [dbo].[schedules] ([id], [film_id], [dateschedule]) VALUES (80, 1, CAST(N'2022-07-30' AS Date))
INSERT [dbo].[schedules] ([id], [film_id], [dateschedule]) VALUES (81, 1, CAST(N'2022-07-31' AS Date))
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

INSERT [dbo].[showtimes] ([id], [schedule_id], [start_time], [end_time], [id_room]) VALUES (90, 80, CAST(N'19:15:00' AS Time), CAST(N'21:15:00' AS Time), 1)
INSERT [dbo].[showtimes] ([id], [schedule_id], [start_time], [end_time], [id_room]) VALUES (93, 81, CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time), 7)
SET IDENTITY_INSERT [dbo].[showtimes] OFF
GO
SET IDENTITY_INSERT [dbo].[usercgv] ON 

INSERT [dbo].[usercgv] ([id], [email], [is_active], [password], [phonenumber], [role_id], [username]) VALUES (1, N'admin@gmail.com', 1, N'25f9e794323b453885f5181f1b624db', N'0394073758', 1, N'Quản trị viên')
INSERT [dbo].[usercgv] ([id], [email], [is_active], [password], [phonenumber], [role_id], [username]) VALUES (3, N'nhanvien12@gmail.com', 1, N'25f9e794323b453885f5181f1b624db', N'0379135465', 2, N'Nhân Viên')
INSERT [dbo].[usercgv] ([id], [email], [is_active], [password], [phonenumber], [role_id], [username]) VALUES (47, N'nguyencaonguyencmu@gmail.com', 1, N'25f9e794323b453885f5181f1b624db', N'0123456789', 3, N'Nguyen')
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
