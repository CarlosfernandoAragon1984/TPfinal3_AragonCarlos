USE [master]
GO
/****** Object:  Database [CATALOGO_WEB_DB]    Script Date: 06/05/2024 10:52:29 ******/
CREATE DATABASE [CATALOGO_WEB_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CATALOGO_WEB_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CATALOGO_WEB_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CATALOGO_WEB_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CATALOGO_WEB_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CATALOGO_WEB_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET  MULTI_USER 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CATALOGO_WEB_DB]
GO
/****** Object:  Table [dbo].[ARTICULOS]    Script Date: 06/05/2024 10:52:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARTICULOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](150) NULL,
	[IdMarca] [int] NULL,
	[IdCategoria] [int] NULL,
	[ImagenUrl] [varchar](1000) NULL,
	[Precio] [money] NULL,
 CONSTRAINT [PK_ARTICULOS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIAS]    Script Date: 06/05/2024 10:52:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIAS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_CATEGORIAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAVORITOS]    Script Date: 06/05/2024 10:52:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAVORITOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdArticulo] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCAS]    Script Date: 06/05/2024 10:52:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCAS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_MARCAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 06/05/2024 10:52:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[pass] [varchar](20) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[urlImagenPerfil] [varchar](500) NULL,
	[admin] [bit] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ARTICULOS] ON 

INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenUrl], [Precio]) VALUES (1, N'S01', N'Galaxy S10', N'Una canoa cara', 1, 1, N'https://images.fravega.com/f300/7240707b782e381c4ba1f9f573efc03e.jpg.webp', 2877890.0000)
INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenUrl], [Precio]) VALUES (2, N'M03', N'Moto G Play 7ma Gen', N'Ya siete de estos?', 5, 1, N'https://images.fravega.com/f1000/c929b6ca42112f7f839f5a4d6764e6ce.jpg', 1655000.0000)
INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenUrl], [Precio]) VALUES (3, N'S99', N'Play 4', N'Ya no se cuantas versiones hay', 3, 3, N'https://images.fravega.com/f1000/6767e46bffe3e0a5f71638b4ed499e03.jpg', 3500000.0000)
INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenUrl], [Precio]) VALUES (4, N'S56', N'Bravia 65', N'Alta telesion', 4, 2, N'https://images.fravega.com/f500/ef5215572d3b409e11fb2c8b2bf72a69.jpg', 500000.0000)
INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenUrl], [Precio]) VALUES (5, N'A23', N'Apple TV', N'lindo loro', 2, 2, N'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/rfb-apple-tv-4k?wid=1144&hei=1144&fmt=jpeg&qlt=80&.v=1513897159574', 785000.0000)
INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenUrl], [Precio]) VALUES (9, N'SZF4', N'Samsung Z Flip4', N'Moderno, Revolucionario y audaz', 1, 1, N'https://images.fravega.com/f500/4c5d5f8f5c8ac3f2804f88e1e0913623.jpg', 699666.0000)
INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenUrl], [Precio]) VALUES (10, N'stv01', N'Televisor ', N'Televisor samsung', 1, 2, N'https://images.fravega.com/f300/d7ca24bf5639a7db78c31aa9fa963be8.jpg.webp', 500000.0000)
INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenUrl], [Precio]) VALUES (14, N'S56', N'Bravia 55', N'Alta tele', 3, 2, N'https://intercompras.com/product_thumb_keepratio_2.php?img=images/product/SONY_KDL-55W950A.jpg&w=650&h=450', 49500.0000)
INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenUrl], [Precio]) VALUES (15, N'A23', N'Apple TV', N'lindo loro', 2, 3, N'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/rfb-apple-tv-4k?wid=1144&hei=1144&fmt=jpeg&qlt=80&.v=1513897159574', 7850.0000)
SET IDENTITY_INSERT [dbo].[ARTICULOS] OFF
GO
SET IDENTITY_INSERT [dbo].[CATEGORIAS] ON 

INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (1, N'Celulares')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (2, N'Televisores')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (3, N'Media')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (4, N'Audio')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (5, N'Celulares')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (6, N'Televisores')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (7, N'Media')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (8, N'Audio')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (9, N'Celulares')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (10, N'Televisores')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (11, N'Media')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (12, N'Audio')
SET IDENTITY_INSERT [dbo].[CATEGORIAS] OFF
GO
SET IDENTITY_INSERT [dbo].[FAVORITOS] ON 

INSERT [dbo].[FAVORITOS] ([Id], [IdUser], [IdArticulo]) VALUES (168, 1, 1)
INSERT [dbo].[FAVORITOS] ([Id], [IdUser], [IdArticulo]) VALUES (169, 1, 2)
INSERT [dbo].[FAVORITOS] ([Id], [IdUser], [IdArticulo]) VALUES (171, 1, 4)
INSERT [dbo].[FAVORITOS] ([Id], [IdUser], [IdArticulo]) VALUES (172, 1, 9)
INSERT [dbo].[FAVORITOS] ([Id], [IdUser], [IdArticulo]) VALUES (170, 1, 3)
SET IDENTITY_INSERT [dbo].[FAVORITOS] OFF
GO
SET IDENTITY_INSERT [dbo].[MARCAS] ON 

INSERT [dbo].[MARCAS] ([Id], [Descripcion]) VALUES (1, N'Samsung')
INSERT [dbo].[MARCAS] ([Id], [Descripcion]) VALUES (2, N'Apple')
INSERT [dbo].[MARCAS] ([Id], [Descripcion]) VALUES (3, N'Sony')
INSERT [dbo].[MARCAS] ([Id], [Descripcion]) VALUES (4, N'Huawei')
INSERT [dbo].[MARCAS] ([Id], [Descripcion]) VALUES (5, N'Motorola')
INSERT [dbo].[MARCAS] ([Id], [Descripcion]) VALUES (6, N'Samsung')
INSERT [dbo].[MARCAS] ([Id], [Descripcion]) VALUES (7, N'Apple')
INSERT [dbo].[MARCAS] ([Id], [Descripcion]) VALUES (8, N'Sony')
INSERT [dbo].[MARCAS] ([Id], [Descripcion]) VALUES (9, N'Huawei')
INSERT [dbo].[MARCAS] ([Id], [Descripcion]) VALUES (10, N'Motorola')
INSERT [dbo].[MARCAS] ([Id], [Descripcion]) VALUES (11, N'Samsung')
INSERT [dbo].[MARCAS] ([Id], [Descripcion]) VALUES (12, N'Apple')
INSERT [dbo].[MARCAS] ([Id], [Descripcion]) VALUES (13, N'Sony')
INSERT [dbo].[MARCAS] ([Id], [Descripcion]) VALUES (14, N'Huawei')
INSERT [dbo].[MARCAS] ([Id], [Descripcion]) VALUES (15, N'Motorola')
SET IDENTITY_INSERT [dbo].[MARCAS] OFF
GO
SET IDENTITY_INSERT [dbo].[USERS] ON 

INSERT [dbo].[USERS] ([Id], [email], [pass], [nombre], [apellido], [urlImagenPerfil], [admin]) VALUES (1, N'admin@admin.com', N'admin', N'', N'', N'perfil-1.jpg', 1)
INSERT [dbo].[USERS] ([Id], [email], [pass], [nombre], [apellido], [urlImagenPerfil], [admin]) VALUES (2, N'user@user.com', N'user', NULL, NULL, NULL, 0)
INSERT [dbo].[USERS] ([Id], [email], [pass], [nombre], [apellido], [urlImagenPerfil], [admin]) VALUES (14, N'test@test.com', N'test', NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[USERS] OFF
GO
ALTER TABLE [dbo].[USERS] ADD  DEFAULT ((0)) FOR [admin]
GO
/****** Object:  StoredProcedure [dbo].[insertaNuevo]    Script Date: 06/05/2024 10:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[insertaNuevo] 
@email varchar(100),
@pass varchar(20)
as
insert into USERS (email, pass, admin) output inserted.id values (@email, @pass, 0)

GO
/****** Object:  StoredProcedure [dbo].[storedListar]    Script Date: 06/05/2024 10:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[storedListar] as

Select A.Id, Codigo, Nombre, A.Descripcion, M.Descripcion Marca, C.Descripcion Categoria, A.IdMarca, A.IdCategoria, ImagenUrl, Precio 
from ARTICULOS A, MARCAS M, CATEGORIAS C 
where A.IdMarca = M.Id and A.IdCategoria = C.Id

GO
USE [master]
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET  READ_WRITE 
GO
