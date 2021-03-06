USE [master]
GO
/****** Object:  Database [Shop]    Script Date: 6.03.2022 22:51:34 ******/
CREATE DATABASE [Shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Shop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shop] SET RECOVERY FULL 
GO
ALTER DATABASE [Shop] SET  MULTI_USER 
GO
ALTER DATABASE [Shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Shop', N'ON'
GO
ALTER DATABASE [Shop] SET QUERY_STORE = OFF
GO
USE [Shop]
GO
/****** Object:  Table [dbo].[Adress]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adress](
	[AdressId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Title] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Adress] [varchar](100) NULL,
 CONSTRAINT [PK_Adress] PRIMARY KEY CLUSTERED 
(
	[AdressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryDetail]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryDetail](
	[CategoryDetailId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_CategoryDetail] PRIMARY KEY CLUSTERED 
(
	[CategoryDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[UserAdressId] [int] NULL,
	[CreateDate] [varchar](50) NULL,
	[TotalPrice] [money] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[CategoryDetailId] [int] NULL,
	[Brand] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[Price] [money] NULL,
	[Tax] [nchar](10) NULL,
	[Stock] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[UserLastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Telephone] [char](10) NULL,
	[TckNo] [nchar](11) NULL,
	[UserPassword] [char](10) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adress] ON 

INSERT [dbo].[Adress] ([AdressId], [UserId], [Title], [City], [Adress]) VALUES (1, 1, NULL, NULL, NULL)
INSERT [dbo].[Adress] ([AdressId], [UserId], [Title], [City], [Adress]) VALUES (5, 4, N'e4v', N'4e43', N'rdffgcfgf')
SET IDENTITY_INSERT [dbo].[Adress] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (1, N'Bilgisayarlar')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (2, N'Yazıcılar')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (3, N'Tabletler')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryDetail] ON 

INSERT [dbo].[CategoryDetail] ([CategoryDetailId], [CategoryId], [Name]) VALUES (1, 1, N'Dizüstü Bilgisayar')
INSERT [dbo].[CategoryDetail] ([CategoryDetailId], [CategoryId], [Name]) VALUES (2, 1, N'Oyun Bilgisayarları')
INSERT [dbo].[CategoryDetail] ([CategoryDetailId], [CategoryId], [Name]) VALUES (3, 1, N'İkisi Bir Arada')
INSERT [dbo].[CategoryDetail] ([CategoryDetailId], [CategoryId], [Name]) VALUES (4, 2, N'Lazer Yazıcıları')
INSERT [dbo].[CategoryDetail] ([CategoryDetailId], [CategoryId], [Name]) VALUES (5, 2, N'Tanklı Yazıcıları')
INSERT [dbo].[CategoryDetail] ([CategoryDetailId], [CategoryId], [Name]) VALUES (6, 2, N'Püskürtmeli Yazıcılar')
INSERT [dbo].[CategoryDetail] ([CategoryDetailId], [CategoryId], [Name]) VALUES (7, 2, N'Nokta Vuruşlu Yazıcı')
INSERT [dbo].[CategoryDetail] ([CategoryDetailId], [CategoryId], [Name]) VALUES (8, 2, N'3D Yazıcılar')
INSERT [dbo].[CategoryDetail] ([CategoryDetailId], [CategoryId], [Name]) VALUES (9, 2, N'Barkod Yazıcılar')
INSERT [dbo].[CategoryDetail] ([CategoryDetailId], [CategoryId], [Name]) VALUES (10, 2, N'Tarayıcılar')
SET IDENTITY_INSERT [dbo].[CategoryDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [UserId], [UserAdressId], [CreateDate], [TotalPrice]) VALUES (38, 4, 5, N'Feb 20 2022  8:33PM', 10580556.0000)
INSERT [dbo].[Orders] ([OrderId], [UserId], [UserAdressId], [CreateDate], [TotalPrice]) VALUES (45, 4, 5, N'Feb 20 2022  8:39PM', 2645139.0000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryDetailId], [Brand], [Model], [Price], [Tax], [Stock]) VALUES (1, N'MSI Katana GF76 ', 2, N'MSI', N' Katana GF76 ', 2645139.0000, N'18        ', 23)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [UserLastName], [Email], [Telephone], [TckNo], [UserPassword]) VALUES (1, N'Hakan', NULL, NULL, NULL, N'13958442860', N'          ')
INSERT [dbo].[Users] ([UserId], [UserName], [UserLastName], [Email], [Telephone], [TckNo], [UserPassword]) VALUES (4, N'Hakan', N'Eren', N'bluehakan@hotmail.com', N'5380914567', N'1234       ', N'1234      ')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_Users]
GO
ALTER TABLE [dbo].[CategoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_CategoryDetail_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[CategoryDetail] CHECK CONSTRAINT [FK_CategoryDetail_Category]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Adress] FOREIGN KEY([UserAdressId])
REFERENCES [dbo].[Adress] ([AdressId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Adress]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_CategoryDetail] FOREIGN KEY([CategoryDetailId])
REFERENCES [dbo].[CategoryDetail] ([CategoryDetailId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_CategoryDetail]
GO
/****** Object:  StoredProcedure [dbo].[CategoryDetailList]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CategoryDetailList]
as begin
select cd.Name +' ( '+ CONVERT(varchar, COUNT(cd.Name)) +' ) ' as 'Kategori Adı' from CategoryDetail as cd join Products as p on cd.CategoryDetailId = p.CategoryDetailId 
group by cd.Name  
end
GO
/****** Object:  StoredProcedure [dbo].[CategoryDetailListSearch]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CategoryDetailListSearch]
@CategoryName varchar(50) 
as begin
select cd.Name +' ( '+ CONVERT(varchar, COUNT(cd.Name)) +' ) ' as 'Kategori Adı' from CategoryDetail as cd join Products as p on cd.CategoryDetailId = p.CategoryDetailId join Category as c on cd.CategoryId= c.CategoryId where c.Name = @CategoryName +'%' 
group by cd.Name  
end
GO
/****** Object:  StoredProcedure [dbo].[CategoryFindId]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CategoryFindId]
@CategoryName int
as begin
select CategoryId from Category as c where c.Name=@CategoryName
end
GO
/****** Object:  StoredProcedure [dbo].[CategoryList]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CategoryList]
as begin
select  c.Name +' ( '+ CONVERT(varchar, COUNT(c.Name)) +' ) ' as 'Kategori Adı' from Category as c join CategoryDetail as cd on c.CategoryId = cd.CategoryId 
group by c.Name  
end
GO
/****** Object:  StoredProcedure [dbo].[OrdersAdd]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[OrdersAdd]
@UserId int,
@UserAdressId int,
@TotalPrice money
as begin
insert into Orders(UserId,UserAdressId,CreateDate,TotalPrice)
values(@UserId,@UserAdressId,GETDATE(),@TotalPrice)
end
GO
/****** Object:  StoredProcedure [dbo].[OrdersDelete]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[OrdersDelete]
@OrderId int
as begin
delete Orders where OrderId =@OrderId
end
GO
/****** Object:  StoredProcedure [dbo].[OrdersList]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[OrdersList]
@UserId int
as begin
select o.OrderId as 'Sipariş No', u.TckNo as 'TC Kimlik No',
o.TotalPrice as 'Sipariş Tutar' , a.Adress as 'Adres' , o.CreateDate as 'Sipariş Tarihi'from Orders as o join Users as u on u.UserId= o.UserId join Adress as a on a.AdressId = o.UserAdressId where o.UserId = @UserId
end
GO
/****** Object:  StoredProcedure [dbo].[ProductAllList]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ProductAllList]
as begin 
select p.ProductId as 'Ürün No' , p.ProductName as 'Ürün Adı', c.Name as 'Kategori Adı', cd.Name as 'Alt Kategori Adı', p.Brand as 'Marka', p.Model,p.Price as 'Fiyat' , p.Stock as 'Stok' from Products as p join CategoryDetail as cd on p.CategoryDetailId = cd.CategoryDetailId join Category as c on c.CategoryId = cd.CategoryId where Stock != 0 
end
GO
/****** Object:  StoredProcedure [dbo].[ProductDetailList]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ProductDetailList]
@CategoryDetailId int
as begin 
select p.ProductId as 'Ürün No' , p.ProductName as 'Ürün Adı', c.Name as 'Kategori Adı', cd.Name as 'Alt Kategori Adı', p.Brand as 'Marka', p.Model,p.Price as 'Fiyat' ,
p.Stock as 'Stok' from Products as p
join CategoryDetail as cd on p.CategoryDetailId = cd.CategoryDetailId join Category as c on c.CategoryId = cd.CategoryId where Stock != 0 and cd.CategoryDetailId = @CategoryDetailId
end
GO
/****** Object:  StoredProcedure [dbo].[ProductSearchCategory]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ProductSearchCategory]
@CategoryName varchar(50)
as begin 
select p.ProductId as 'Ürün No' , p.ProductName as 'Ürün Adı', c.Name as 'Kategori Adı', cd.Name as 'Alt Kategori Adı', p.Brand as 'Marka', p.Model,p.Price as 'Fiyat' from Products as p join CategoryDetail as cd on p.CategoryDetailId = cd.CategoryDetailId join Category as c on c.CategoryId = cd.CategoryId
where c.Name = @CategoryName
end
GO
/****** Object:  StoredProcedure [dbo].[ProductSearchCategoryDetail]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ProductSearchCategoryDetail]
@CategoryDetailName varchar(50)
as begin 
select p.ProductId as 'Ürün No' , p.ProductName as 'Ürün Adı', c.Name as 'Kategori Adı', cd.Name as 'Alt Kategori Adı', p.Brand as 'Marka', p.Model,p.Price as 'Fiyat' , p.Stock as 'Stok' from Products as p join CategoryDetail as cd on p.CategoryDetailId = cd.CategoryDetailId join Category as c on c.CategoryId = cd.CategoryId
where cd.Name like @CategoryDetailName +'%'
end
GO
/****** Object:  StoredProcedure [dbo].[ProductSearchProductName]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ProductSearchProductName]
@ProductName varchar(50)
as begin 
select p.ProductId as 'Ürün No' , p.ProductName as 'Ürün Adı', c.Name as 'Kategori Adı', cd.Name as 'Alt Kategori Adı', p.Brand as 'Marka', p.Model,p.Price as 'Fiyat' from Products as p join CategoryDetail as cd on p.CategoryDetailId = cd.CategoryDetailId join Category as c on c.CategoryId = cd.CategoryDetailId
where p.ProductName = '%'+@ProductName+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[ProductUpdate]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ProductUpdate] 
@ProductId int
as begin
update Products set Stock= Stock-1 where ProductId=@ProductId 
end
GO
/****** Object:  StoredProcedure [dbo].[UserAdressAdd]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserAdressAdd]
@UserId int,
@Title varchar(50),
@City varchar(50),
@Adress varchar(100)
as begin
insert into Adress(UserId,Title,City,Adress)
values (@UserId,@Title,@City,@Adress)
end
GO
/****** Object:  StoredProcedure [dbo].[UserAdressDelete]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UserAdressDelete]
@AdressId int
as begin
delete Adress where AdressId=@AdressId
end
GO
/****** Object:  StoredProcedure [dbo].[UserAdressList]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UserAdressList]
@UserId int
as begin 
select a.AdressId as 'Adres No', a.Title as 'Başlık', a.City as 'Şehir', a.Adress as 'Adres' from Adress as a
where a.UserId = @UserId
end
GO
/****** Object:  StoredProcedure [dbo].[UserAdressUpdate]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserAdressUpdate]
@AdressId int,
@Title varchar(50),
@City varchar(50),
@Adress varchar(100)
as begin
update Adress set Title = @Title, City=@City,Adress=@Adress 
where AdressId=@AdressId
end
GO
/****** Object:  StoredProcedure [dbo].[UserCreate]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserCreate]
@Name varchar(50),
@LastName varchar(50),
@Email varchar(50),
@Telephone char(11),
@TckNo nchar(11),
@Password char(10)
as begin 
insert into Users(UserName,UserLastName,Email,Telephone,TckNo,UserPassword)
values(@Name,@LastName,@Email,@Telephone,@TckNo,@Password)
end 
GO
/****** Object:  StoredProcedure [dbo].[UserDelete]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UserDelete]
@UserId int
as begin 
delete Users where UserId = @UserId
end
GO
/****** Object:  StoredProcedure [dbo].[UserList]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserList]
@UserId int
as begin 
select u.UserId as 'Kullanıcı No', u.UserName as Ad ,  u.UserLastName as 'Soyad',u.Email, u.Telephone as 'Telefon Numarası', u.TckNo as 'TC No', u.UserPassword as Şifre from Users as u where UserId = @UserId
end
GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserLogin]
@TckNo varchar(50),
@Password char(10)
as begin 
select * from Users where TckNo=@TckNo and UserPassword=@Password
end
GO
/****** Object:  StoredProcedure [dbo].[UserUpdate]    Script Date: 6.03.2022 22:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UserUpdate]
@UserId int,
@Name varchar(50),
@LastName varchar(50),
@Email varchar(50),
@Telephone char(11),
@TckNo nchar(11),
@Password char(10)
as begin 
update Users set UserName=@Name,UserLastName=@LastName,Email=@Email,Telephone=@Telephone,TckNo=@TckNo,UserPassword=@Password
where UserId =@UserId
end 
GO
USE [master]
GO
ALTER DATABASE [Shop] SET  READ_WRITE 
GO
