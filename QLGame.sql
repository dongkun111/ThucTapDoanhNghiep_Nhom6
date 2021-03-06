USE [master]
GO
/****** Object:  Database [QLGame]    Script Date: 8/11/2020 8:35:58 PM ******/
CREATE DATABASE [QLGame]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLGame', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLGame.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLGame_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLGame_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLGame] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLGame].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLGame] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLGame] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLGame] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLGame] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLGame] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLGame] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLGame] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLGame] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLGame] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLGame] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLGame] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLGame] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLGame] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLGame] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLGame] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLGame] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLGame] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLGame] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLGame] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLGame] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLGame] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLGame] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLGame] SET RECOVERY FULL 
GO
ALTER DATABASE [QLGame] SET  MULTI_USER 
GO
ALTER DATABASE [QLGame] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLGame] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLGame] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLGame] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLGame] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLGame', N'ON'
GO
USE [QLGame]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 8/11/2020 8:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDGame] [int] NOT NULL,
	[IDKhach] [int] NOT NULL,
	[NoiDung] [nvarchar](2048) NOT NULL,
	[Ngay] [datetime] NULL CONSTRAINT [DF_BinhLuan_Ngay]  DEFAULT (getdate()),
 CONSTRAINT [PK_BinhLuan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Game]    Script Date: 8/11/2020 8:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[UnTitle] [nvarchar](50) NULL,
	[IDCategory] [int] NULL,
	[Code] [nvarchar](250) NULL,
	[Description] [nvarchar](1000) NULL,
	[Image] [nvarchar](250) NULL,
	[MoreImage] [xml] NULL,
	[Quatity] [int] NULL,
	[Detail] [ntext] NULL,
	[ViewCount] [int] NULL,
	[LK] [nvarchar](2048) NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GameCategory]    Script Date: 8/11/2020 8:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[UnTitle] [nvarchar](50) NULL,
	[SeoTitle] [nvarchar](50) NULL,
	[ShowOnhome] [bit] NULL,
 CONSTRAINT [PK_GameCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 8/11/2020 8:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Displayname] [nvarchar](150) NULL,
	[Password] [varchar](50) NULL,
	[Gender] [nvarchar](10) NULL,
	[Phone] [varchar](15) NULL,
	[Address] [nvarchar](500) NULL,
	[Ngaysinh] [datetime] NULL,
	[Image] [varchar](250) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 8/11/2020 8:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](150) NULL,
	[Link] [nvarchar](250) NULL,
	[Target] [varchar](50) NULL,
	[TypeID] [int] NULL,
	[Status] [bit] NULL,
	[Submenu] [int] NULL,
	[Multilevel] [bit] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 8/11/2020 8:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 8/11/2020 8:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Displayname] [nvarchar](150) NULL,
	[Password] [varchar](50) NULL,
	[Gender] [nvarchar](10) NULL,
	[Phone] [varchar](15) NULL,
	[Address] [nvarchar](500) NULL,
	[Ngaysinh] [datetime] NULL,
	[Image] [varchar](250) NULL,
	[TypeAccount] [varchar](10) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BinhLuan] ON 

INSERT [dbo].[BinhLuan] ([ID], [IDGame], [IDKhach], [NoiDung], [Ngay]) VALUES (1, 1, 1, N'game gì khó chơi ', NULL)
SET IDENTITY_INSERT [dbo].[BinhLuan] OFF
SET IDENTITY_INSERT [dbo].[Game] ON 

INSERT [dbo].[Game] ([ID], [Name], [UnTitle], [IDCategory], [Code], [Description], [Image], [MoreImage], [Quatity], [Detail], [ViewCount], [LK]) VALUES (1, N'Anno 2070 Complete Edition', N'/anno-2070-complete-edition', 2, NULL, N'https://www.fshare.vn/file/369LYOB6PTNI?', N'/Image/images/anno%202070.jpg', NULL, NULL, N'Bạn có hình dung thế giới vào năm 2070 sẽ như thế nào không? Nếu không thể đợi đến đó hoặc tò mò muốn biết ngay bây giờ thì hãy thử qua Anno 2070-tựa game chiến thuật thời gian thực kết hợp mô phỏng do đại gia Ubisoft phát hành để rút ra những cảm nhận cho riêng mình.  				“Biến đổi khí hậu kéo theo những hệ lụy khó lường để rồi con người phải chịu sự trừng phạt của tự nhiên. Những ai thức tỉnh kịp lúc sẽ “quay đầu là bờ" để sửa chữa sai lầm. Còn những kẻ ngoan cố bất chấp hậu quả thì sẽ tiếp tục âm mưu bá chủ thế giới của mình". Đó chính là nội dung của Anno 2070. Thật vậy, đến với game, người chơi có 2 phe để lựa chọn: Eco (ưu tiên bảo vệ môi trường) và Tycoon ( ưu tiên phát triển kinh tế bằng mọi giá). Mỗi phe đếu có những ưu, nhược điểm khác nhau, chẳng hạn Eco thì sở hữu đất đai màu mỡ, thảm thực vật xanh tốt trong khi đó Tycoon lại có tốc độ xây dựng nhanh, …', NULL, NULL)
INSERT [dbo].[Game] ([ID], [Name], [UnTitle], [IDCategory], [Code], [Description], [Image], [MoreImage], [Quatity], [Detail], [ViewCount], [LK]) VALUES (2, N'Raft', N'/raft', 3, NULL, N'https://www.fshare.vn/folder/FSGLCLRQ579F?', N'/Image/images/raft.jpg', NULL, NULL, N'Raft là tựa game sinh tồn với dung lượng và cấu hình cực nhẹ nhàng, ra mắt bản miễn phí vào năm 2016 và đến tầm giữa năm 2018 Raft đã có mặt trên steam với phiên bản early access. Raft đưa người chơi lênh đênh trên biển sâu và phải tìm cách để sống sót được trước sự khắc nghiệt của môi trường này.

Giống như nhiều tựa game sinh tồn khác, Raft không có cốt truyện rõ ràng mà đưa game thủ đột ngột vào tình cảnh hiểm nghèo lênh đênh trên biển, xung quanh không hề có bất cứ người nào hay tàu bè qua lại để có thể hô hào cứu sống. Chúng ta chỉ có duy nhất 2 bàn tay trần và phải xây dựng căn cứ từ con số 0 thần thánh.

Thử thách quan trọng nhất trong Raft là con cá mập cực kỳ nguy hiểm thường xuyên rình rập và sẵn sàng cắn xé nhân vật chính nếu không cẩn thận. Thậm chí con cá mập này còn hung dữ đến nỗi sẵn sàng cắt nát cả tấm gỗ bè khi nó thích, tất nhiên về sau này thì chúng ta mới có cách để trị nó.', NULL, NULL)
INSERT [dbo].[Game] ([ID], [Name], [UnTitle], [IDCategory], [Code], [Description], [Image], [MoreImage], [Quatity], [Detail], [ViewCount], [LK]) VALUES (3, N'Farm Together', N'/farm-together', 4, NULL, N'https://www.fshare.vn/file/O7OH51DI62J9?', N'/Image/images/FarmTC.jpg', NULL, NULL, N'Farm Together là game nông trại trên nền đồ họa 3D do Milkstone Studios phát hành. mang đến cho người chơi cuộc sống bình dị, mộc mạc nơi đồng quê và những trải nghiệm phong phú trong xây dựng và quản lý trang trại của chính mình.

Gameplay của Farm Together giống như những game nông trại khác, người chơi tự tay xây dựng và phát triển trang trại của mình hoặc hợp tác với bạn bè từ một khoảng đất nhỏ, bắt đầu gieo trồng các loài cây, tưới nước và chăm sóc cho cây trồng, chăn nuôi gia súc gia cầm và cho chúng ăn; sau đó thu hoạch và bán nông sản. Sau một thời gian nhất định bạn sẽ trở thành chủ trang trại rộng lớn với sản phẩm phong phú.

Farm Together cung cấp nhiều item tùy chọn để bạn xây dựng và thiết kế nông trại theo ý muốn, từ hàng rào, lối đi, nhà cửa cho đến các đồ trang trí khác. Một điểm thú vị không thể không nhắc đến trong game là hệ thống nhân vật dễ thương, cho phép tùy chỉnh avatar, trang phục và phương tiện.

', NULL, NULL)
INSERT [dbo].[Game] ([ID], [Name], [UnTitle], [IDCategory], [Code], [Description], [Image], [MoreImage], [Quatity], [Detail], [ViewCount], [LK]) VALUES (4, N'World War Z', N'/world-war-z', 4, NULL, N'https://www.fshare.vn/file/W4J3J5TIS663?', N'/Image/images/World-War-Z.jpg', NULL, NULL, N'World War Z là tựa game kinh dị mang tên "thế chiến Z" với chủ đề về ngày tận thế hấp dẫn. World War Z là sản phẩm "ăn theo" bộ phim bom tấn cùng tên, mang đến cho người chơi cảm giác choáng ngợp bởi quy mô hoành tráng nhất từ trước tới nay về đề tài chiến tranh thây ma.  Những ai đã từng xem qua phim World War Z hẳn sẽ không lạ gì với trường đoạn bọn zombie giẫm đạp lên nhau, tạo thành một cái “tháp thịt” để vươt qua phía bên kia bờ tường đã được tái hiện trong trailer game.  Trong một thông cáo báo chí, Saber Interactive cho biết World War Z sẽ là một trò chơi hành động phối hợp giữa 4 người chơi. Phần chơi chiến dịch tập trung vào “những câu chuyện và sứ mệnh độc nhất vô nhị trên toàn cầu, bao gồm New York, Moscow và Jerusalem. Tận dụng các bẫy, rào cản và lợi thế môi trường để sống sót, song song với việc tiêu diệt bầy quái vật bằng nhiều loại vũ khí khác nhau.”  Theo như mình thấy thì tựa game này rất giống với loạt game Left 4 Dead. Vì thế ai đã từng chơi Left 4 Dead sẽ thích ứng nhanh với lối chơi của thể loại game này.', NULL, NULL)
INSERT [dbo].[Game] ([ID], [Name], [UnTitle], [IDCategory], [Code], [Description], [Image], [MoreImage], [Quatity], [Detail], [ViewCount], [LK]) VALUES (5, N'Assassin’s Creed Origins', N'/assassin-creed-origins', 4, NULL, N'https://www.fshare.vn/file/QW2AXN5FFNQE?', N'/Image/images/AssassinCreed.jpg', NULL, NULL, N'Rốt cuộc sau hàng tháng trời khiến người chơi phải đoán già đoán non với những tin đồn đủ kiểu, sáng nay theo giờ Việt Nam (27-10-2017), tại buổi họp báo chính thức trước thềm E3 2017 của Microsoft, dòng game Assassin’s Creed đã chính thức trở lại với phiên bản mới. Đó chính là Assassin’s Creed Origins.  Đúng như các đồn đoán, Assassin’s Creed Origins sẽ có bối cảnh diễn ra tại Ai Cập cổ, nơi các Pharaoh vẫn nắm quyền trị vì đất nước của các Kim tự tháp. Cụ thể hơn, các sự kiện của Assassin’s Creed Origins vào thời kỳ Đế quốc La Mã đã đặt chân đến Ai Cập và đang tìm cách dần dần khống chế đất nước này.  Nhân vật chính của game là Bayek – chiến binh lão luyện được xem như một trong “lá chắn” bảo hộ của Ai Cập và chính là người đã mở đường sáng lập hội Sát Thủ – Assassin’s Brotherhood – về sau này.  Dòng game Assassin’s Creed luôn được biết đến như một phương pháp… học tập lịch sử sinh động và hết sức lý tưởng đối với những ai yêu thích tìm hiểu những thời kỳ mà thương hiệu này đã ghé thăm nhưng lại không muốn gắn đôi mắt mình vào những trang sách đơn điệu. Và với Assassin’s Creed Origins, Ubisoft sẽ phát huy “truyền thống” này của Assassin’s Creed mạnh mẽ hơn bao giờ hết.', NULL, NULL)
INSERT [dbo].[Game] ([ID], [Name], [UnTitle], [IDCategory], [Code], [Description], [Image], [MoreImage], [Quatity], [Detail], [ViewCount], [LK]) VALUES (6, N'Outlast II', N'/outlast-2', 5, NULL, N'https://www.fshare.vn/file/LBG53Q31LMZX?', N'/Image/images/Outlast2.jpg', NULL, NULL, N'Outlast 2 - trò chơi kinh dị nhất năm 2017 (tính tới thời điểm hiện tại). Bên cạnh việc nó gây ấn tượng bởi sự sợ hãi khủng khiếp xuyên suốt nhiều tiếng đồng hồ thì cốt truyện khó hiểu đến mức độ "hack não" cũng khiến người ta phải bàn tán không thôi.  Outlast 2 là một trò chơi kinh dị sống còn góc nhìn người đầu tiên được phát triển bởi Red Barrels. Cũng như trong Outlast, các bạn sẽ không được trang bị bất kỳ loại vũ khí nào và không có khả năng tấn công. Để tồn tại người chơi cần phải tránh bị phát hiện, trong nhiều trường hợp bỏ chạy là cơ hội duy nhất để thoát thân. Game có một hệ thống parkour, cho phép người chơi có cơ hội trốn thoát dễ dàng hơn phiên bản trước.  Outlast 2 có hai cốt truyện chính là ngôi làng và tuyến phụ là ngôi trường.', NULL, NULL)
INSERT [dbo].[Game] ([ID], [Name], [UnTitle], [IDCategory], [Code], [Description], [Image], [MoreImage], [Quatity], [Detail], [ViewCount], [LK]) VALUES (7, N'ARK: Survival Evolved', N'/ark-survival-evolved', 1, NULL, N'https://www.fshare.vn/file/EELF4YA8YV9D?token=1555998337', N'/Image/images/ARKTC.jpg', NULL, NULL, N'ARK: Survival Evolved là tựa game sinh tồn lấy đề tài về thời kỳ khủng long. Khỏi phải nói về độ chân thực và hoàn mỹ của ARK: Survival Evolved, nó quá đẹp, đẹp đến nỗi xóa nhòa đi ranh giới giữa game và đời thực. Được đánh giá là một trong những tựa game sinh tồn hàng đầu trên thế giới hiện này, ARK có thể giúp bạn có những giờ phút giải trí tuyệt vời nhất.  Cho những ai chưa biết, ARK: Survival Evolved là một game online có thế giới ảo vô cùng rộng lớn đang được phát hành dưới dạng free-to-play tại thị trường Châu Á. Game thủ sẽ được "chơi đùa" với những chú khủng long, bao gồm cả việc săn bắt, huấn luyện, chiến đấu với chúng cũng như thu thập các nguyên liệu khác để chế tạo vũ khí, xây dựng nhà cửa, đồ đạc...  Điều cơ bản trong Ark: Survival Evolved chính là làm sao để sinh tồn. Vào lúc ban đầu thì người chơi gần như không phải chạm trán với các game thủ khác. Dù vậy thì học cách sinh tồn trong game chính là vấn đề khó nhất.', NULL, NULL)
INSERT [dbo].[Game] ([ID], [Name], [UnTitle], [IDCategory], [Code], [Description], [Image], [MoreImage], [Quatity], [Detail], [ViewCount], [LK]) VALUES (8, N'Resedent Evil 7', N'/resedent-evil-7', 5, NULL, N'https://www.fshare.vn/file/8M7S3SFIY4BZ?', N'/Image/images/Resident%20Evil%207.jpg', NULL, NULL, N'Resident Evil 7 - tựa game bom tấn đầu tiên của năm 2017 đã chính ra mắt trên toàn thế giới vào ngày 24-1. Kể từ khi giới thiệu chính thức, nhiều người đã cảm thấy hoài nghi về sự thay đổi đột ngột về phong cách của trò chơi, trong khi cũng tồn tại một bộ phận tỏ ra hào hứng trước trải nghiệm mới. Liệu trò chơi có xứng đáng với sự chờ đợi của các fan hâm mộ trong suốt hơn 6 tháng qua? Trong bài viết này chúng ta sẽ cùng đề cập đến một số yếu tố đáng chú ý nhất của nó.  Nhân vật chính trong Resident Evil 7 là Ethan Winters, một gương mặt hoàn toàn mới trong series đến với ngôi nhà bỏ hoang bí ẩn với mục đích truy tìm tung tích của người vợ tưởng chừng đã chết. Nhưng thật bất ngờ, ngay khi vừa đặt chân đến đây Ethan đã bị đánh đập và bắt giữ bởi gia đình Baker - những kẻ không những có diện mạo quái đản mà còn có sở thích ăn thịt người.  Trong thời lượng lớn thời gian của game, bạn sẽ phải chạy trốn khỏi sự săn đuổi của gia đình Baker cũng như chạm trán với nhiều loại sinh vật đột biến quái dị cư trú trong căn biệt thự. Không còn là những đàn zombie vô hồn như trước, nét kinh dị của Resident Evil 7 được tạo ra bởi những không gian chật hẹp, những tiếng động ghê rợn liên tục phát ra từ khắp mọi ngóc ngách của căn nhà cũ kĩ, và quả thực nó giống với phong cách kinh dị sinh tồn hiện đại ngày nay như Outlast, The Evil Within hơn là những phiên bản Resident Evil trước.  Tóm lại Resident Evil 7 đã thực sự đánh dấu một bước ngoặt lớn của series game kinh dị Nhật Bản lâu năm này. Nhiều fan hâm mộ có thể sẽ không thích sự thay đổi mới, nhưng công bằng mà nói thì đây là một động thái cần thiết khi mà các phiên bản cũ đã biểu lộ rõ sự cạn kiệt về mặt ý tưởng. Kết thúc của trò chơi có một sự liên hệ thú vị tới nội dung của những phiên bản trước, và hy vọng là Capcom sẽ không để game thủ phải thất vọng với một cái kết dang dở như vậy với những phần tiếp theo.', NULL, NULL)
INSERT [dbo].[Game] ([ID], [Name], [UnTitle], [IDCategory], [Code], [Description], [Image], [MoreImage], [Quatity], [Detail], [ViewCount], [LK]) VALUES (9, N'Nier: Automataa', N'/nier-automata', 1, NULL, N'https://www.fshare.vn/file/VHGMG678BKL3C4C?', N'/Image/images/NieR.jpg', NULL, NULL, N'Nier: Automata (được cách điệu NieR: Automata) là một game hành động nhập vai, thế giới mở được phát triển bởi PlatinumGames và phát hành bởi Square Enix cho PlayStation 4 và Microsoft Windows. Game được ra mắt tại Nhật vào tháng 2 năm 2017 và tại Châu Âu và Bắc Mỹ vào tháng 3 năm 2017. Nier: Automata là phần tiếp theo của tựa game Nier - 1 tựa game ăn theo series Drakengard.  Nier: Automata được đặt trong bối cảnh hậu tận thế, khi mà một thế lực máy móc từ hành tinh khác đến xâm lược Trái Đất và buộc nhân loại phải rút chạy lên Mặt Trăng. Với quyết tâm đoạt lại ngôi nhà Trái Đất của mình, nhân loại đã liên tiếp triển khai lực lượng người máy xuống Trái Đất để chiến đấu với đội quân xâm lược kia. Tuy nhiên, trước sức mạnh hung hãn của đối phương, nỗ lực tái chiếm Địa Cầu của loài người không thu được kết quả gì đáng kể.  YoRHa – biệt đội android (người máy dạng người) thế hệ mới nhất với năng lực chiến đấu siêu việt chính là niềm hi vọng lớn nhất của các nhà khoa học để mở ra cơ hội đánh bại thế lực máy móc hắc ám đang bá chiếm Địa Cầu. Và không ai khác, các thành viên của YoRHa mà đặc biệt là android nữ 2B chính là vai chính trong câu chuyện xoay quanh hành trình chiến đấu và tìm hiểu những bí mật trên Trái-Đất-không-còn-bóng-người trong Nier: Automata.  Điều thú vị là, 2B cũng như những người máy khác mà bạn sẽ gặp trong game hoàn toàn không phải là những cỗ máy vô tri vô giác. Bên cạnh bản tính vốn có được lập trình sẵn, thông qua tương tác với môi trường, họ sẽ dần dần hình thành nên tính cách của riêng mình – điều này ảnh hưởng không nhỏ đến cốt truyện của game. Và phải nói ngay rằng, Nier: Automata sẽ không phải là một tựa game chỉ có duy nhất một kết thúc. Cùng nhau, những người máy có thể là đồng minh, có thể là kẻ địch của nhau mang đến “nhân tính” và “sinh khí” cho một Trái Đất đã không còn bóng dáng của con người.', NULL, NULL)
INSERT [dbo].[Game] ([ID], [Name], [UnTitle], [IDCategory], [Code], [Description], [Image], [MoreImage], [Quatity], [Detail], [ViewCount], [LK]) VALUES (1016, N'GTA V', N'/gta-5', 1, NULL, N'https://www.fshare.vn/file/29SWXN9131NY?', N'/Image/images/gta5_2.jpg', NULL, NULL, N'Cốt truyện phản ánh hiện thực nước Mỹ, khác với các phiên bản trước, GTA V lấy bối cảnh năm 2013 và trong game phản ánh đầy đủ bức tranh đồi sống Mỹ hiện tại. Khủng hoảng kinh tế, trào lưu công nghệ, sự thay đổi trong cuộc sống người Mỹ thậm chí cả trào lưu chụp ảnh tự sướng..  Kết cấu mới 3 nhân vật song song, đây là lần đầu tiên game có 3 nhân vật chính và người chơi có thể “nhảy” quyền điều khiển giữa 3 người Michael, Franklin, Trevor bất cứ lúc nào trong tình trạng rảnh tay. Mỗi nhân vật có một hoàn cảnh và cá tính riêng dẫn đến một tính cách riêng. Michael là một tay giang hồ gác kiếm ở tuổi 40 có gia đình con cái và tài sản ổn định đại diện cho một hình ảnh điềm tĩnh thành đạt. Franklin là một tay giang hồ trẻ đang muốn trèo cao trong giới tội phạm đường phố đại diện cho một hình ảnh tuổi trẻ đầy tham vọng. Trevor là một tay nóng tính chuyên bán ma túy và chuyên gây sự có quá khứ bị bạo hành gia đình đại diện cho một kẻ liều lĩnh nóng nảy bất cần đời.', NULL, NULL)
INSERT [dbo].[Game] ([ID], [Name], [UnTitle], [IDCategory], [Code], [Description], [Image], [MoreImage], [Quatity], [Detail], [ViewCount], [LK]) VALUES (1017, N'Battlefield V', N'/battlefield-5', 1, NULL, N'https://www.fshare.vn/file/L996UGEEKDSPUTE?', N'/Image/images/btf5_2.jpg', NULL, NULL, N'Nếu người chơi đã quá quen thuộc đến nhàm chán với những trận đánh nổi tiếng trong D-Day tại Normandy, hay khung cảnh đổ nát của Berlin vào ngày chiến thắng, thì khi đến với Battlefield V, bạn sẽ được trải nghiệm cuộc chiến tại những địa điểm mới, ít hoặc chưa từng được mô phỏng trong những game Thế Chiến trước đây. Không dừng lại ở đó, diễn biết nội dung trong Battlefield V sẽ đồng nhất với quá trình diễn ra của cuộc đại chiến, có nghĩa là những nội dung đầu tiên của Battlefield V sẽ bắt đầu với sự kiện Châu Âu thất thủ và những phần được thêm vào sau này sẽ rơi vào các mốc thời gian diễn ra tiếp theo của cuộc đại chiến..  Chưa dừng lại ở đó, Battlefield V còn xây dựng cả một lối chơi phi tuyến tính trong màn chơi rộng lớn của mình. Người chơi hoàn toàn có thể quyết định được hướng cũng như cách thức tiếp cận mục tiêu của mình để tạo ra trải nghiệm hoàn toàn khác cho mỗi lần chơi lại. Hai yếu tố được vay mượn từ mục chơi mạng phía trên đã giúp gia tăng giá trị chơi lại của mục chơi đơn lên rất nhiều.', NULL, NULL)
INSERT [dbo].[Game] ([ID], [Name], [UnTitle], [IDCategory], [Code], [Description], [Image], [MoreImage], [Quatity], [Detail], [ViewCount], [LK]) VALUES (1018, N'Watch Dog 2', N'/watch-dog-2', 2, NULL, N'https://www.fshare.vn/file/96VNA6PRHTFB?', N'/Image/images/watchdog2.jpg', NULL, NULL, N'Watch Dogs 2 (Watch_Dogs 2) là game hành động, phiêu lưu, lén lút (stealth), thế giới mở. Các bạn trong vai Marcus, một hacker trẻ tuổi và tài năng cùng với nhóm của mình thực hiện vụ hack lớn nhất trong lịch sử; Hạ gục ctOS 2.0, một hệ thống giám sát các công dân trong thành phố.  "I am Hacker..."', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Game] OFF
SET IDENTITY_INSERT [dbo].[GameCategory] ON 

INSERT [dbo].[GameCategory] ([ID], [Name], [UnTitle], [SeoTitle], [ShowOnhome]) VALUES (1, N'Hành động', N'/hanh-dong', NULL, NULL)
INSERT [dbo].[GameCategory] ([ID], [Name], [UnTitle], [SeoTitle], [ShowOnhome]) VALUES (2, N'Chiến thuật', N'/chien-thuat/1', NULL, NULL)
INSERT [dbo].[GameCategory] ([ID], [Name], [UnTitle], [SeoTitle], [ShowOnhome]) VALUES (3, N'Sinh tồn', N'/sinh-ton', NULL, NULL)
INSERT [dbo].[GameCategory] ([ID], [Name], [UnTitle], [SeoTitle], [ShowOnhome]) VALUES (4, N'Nhập vai', N'/nhap-vai', NULL, NULL)
INSERT [dbo].[GameCategory] ([ID], [Name], [UnTitle], [SeoTitle], [ShowOnhome]) VALUES (5, N'Kinh dị', N'/kinh-di', NULL, NULL)
SET IDENTITY_INSERT [dbo].[GameCategory] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([ID], [Username], [Displayname], [Password], [Gender], [Phone], [Address], [Ngaysinh], [Image]) VALUES (1, N'anhdaden', N'Anh da đen', N'827ccb0eea8a706c4c34a16891f84e7b', N'Nam', N'0123456789', N'Thuận An - Bình Dương', CAST(N'1999-08-21 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[KhachHang] ([ID], [Username], [Displayname], [Password], [Gender], [Phone], [Address], [Ngaysinh], [Image]) VALUES (2, N'anhdatrang', N'Anh da trắng', N'827ccb0eea8a706c4c34a16891f84e7b', N'Nam', N'0123456987', N'Dầu Tiếng - Bình Dương', CAST(N'1999-08-25 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[KhachHang] ([ID], [Username], [Displayname], [Password], [Gender], [Phone], [Address], [Ngaysinh], [Image]) VALUES (3, N'anhdado', N'Anh da đỏ', N'827ccb0eea8a706c4c34a16891f84e7b', N'Nam', N'0123654789', N'Bến Cát - Bình Dương', CAST(N'1999-08-12 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[KhachHang] ([ID], [Username], [Displayname], [Password], [Gender], [Phone], [Address], [Ngaysinh], [Image]) VALUES (4, N'chidatrang', N'Chị da trắng', N'827ccb0eea8a706c4c34a16891f84e7b', N'Nữ', N'0123458769', N'Dầu Tiếng - Bình Dương', CAST(N'1999-08-24 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[KhachHang] ([ID], [Username], [Displayname], [Password], [Gender], [Phone], [Address], [Ngaysinh], [Image]) VALUES (1003, N'dongkun', N'Lê Đông', N'827ccb0eea8a706c4c34a16891f84e7b', N'Nam', N'0363885338', N'Bình Dương - BC', CAST(N'1999-08-25 00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (4, N'TRANG CHỦ', N'/trang-chu', N'_target', 1, 1, NULL, 0)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (5, N'Tên KH', N'/', N'_self', 1, 1, NULL, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (6, N'KHO GAME', N'/kho-game', N'_self', 1, 1, NULL, 0)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (7, N'CHIẾN THUẬT', N'/chien-thuat/2', N'_self', 2, 1, 6, 0)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (8, N'HÀNH ĐỘNG', N'/hanh-dong/1', N'_self', 2, 1, 6, 0)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (9, N'KINH DỊ', N'/kinh-di/5', N'_self', 2, 1, 6, 0)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (10, N'SINH TỒN', N'/sinh-ton/3', N'_self', 2, 1, 6, 0)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (11, N'NHẬP VAI', N'/nhap-vai/4', N'_self', 2, 1, 6, 0)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (12, N'THÀNH VIÊN', N'/thanh-vien', N'_self', 1, 1, NULL, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (13, N'ĐĂNG NHẬP', N'/dang-nhap', N'_self', 2, 1, 12, 0)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (14, N'ĐĂNG KÝ', N'/dang-ky', N'_self', 2, 1, 12, 0)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (15, N'THÔNG TIN TK', N'/thong-tin-ca-nhan', N'_self', 2, 1, 5, 0)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (16, N'ĐĂNG XUẤT', N'/dang-xuat', N'_self', 2, 1, 5, 0)
SET IDENTITY_INSERT [dbo].[Menu] OFF
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Menu Chính')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Menu Phụ')
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([ID], [Username], [Displayname], [Password], [Gender], [Phone], [Address], [Ngaysinh], [Image], [TypeAccount]) VALUES (1, N'TrungHieu2108', N'Tăng Trung Hiếu', N'827ccb0eea8a706c4c34a16891f84e7b', N'Nam', N'0921156997', N'Dĩ An - Bình Dương', CAST(N'1999-08-21 00:00:00.000' AS DateTime), NULL, N'1')
INSERT [dbo].[TaiKhoan] ([ID], [Username], [Displayname], [Password], [Gender], [Phone], [Address], [Ngaysinh], [Image], [TypeAccount]) VALUES (2, N'VanDong2508', N'Lê Văn Đông', N'827ccb0eea8a706c4c34a16891f84e7b', N'Nam', N'0363885338', N'Bến Cát - Bình Dương', CAST(N'1999-08-25 00:00:00.000' AS DateTime), NULL, N'1')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_Game] FOREIGN KEY([IDGame])
REFERENCES [dbo].[Game] ([ID])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_Game]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_TaiKhoan] FOREIGN KEY([IDKhach])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_TaiKhoan]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_GameCategory] FOREIGN KEY([IDCategory])
REFERENCES [dbo].[GameCategory] ([ID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_GameCategory]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_MenuType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[MenuType] ([ID])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_MenuType]
GO
USE [master]
GO
ALTER DATABASE [QLGame] SET  READ_WRITE 
GO
