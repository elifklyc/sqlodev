USE [master]
GO
/****** Object:  Database [elif]    Script Date: 21.01.2021 04:42:26 ******/
CREATE DATABASE [elif]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'elif', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\elif.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'elif_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\elif_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [elif] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [elif].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [elif] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [elif] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [elif] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [elif] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [elif] SET ARITHABORT OFF 
GO
ALTER DATABASE [elif] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [elif] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [elif] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [elif] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [elif] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [elif] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [elif] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [elif] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [elif] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [elif] SET  DISABLE_BROKER 
GO
ALTER DATABASE [elif] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [elif] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [elif] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [elif] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [elif] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [elif] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [elif] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [elif] SET RECOVERY FULL 
GO
ALTER DATABASE [elif] SET  MULTI_USER 
GO
ALTER DATABASE [elif] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [elif] SET DB_CHAINING OFF 
GO
ALTER DATABASE [elif] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [elif] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [elif] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [elif] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'elif', N'ON'
GO
ALTER DATABASE [elif] SET QUERY_STORE = OFF
GO
USE [elif]
GO
/****** Object:  Table [dbo].[calisanlar]    Script Date: 21.01.2021 04:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calisanlar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[calisan_ad] [varchar](100) NOT NULL,
	[calisan_soyad] [varchar](100) NOT NULL,
	[calisan_cinsiyet] [varchar](20) NOT NULL,
	[calisan_yas] [varchar](10) NOT NULL,
	[subesi] [int] NULL,
	[mudurleri] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[magaza]    Script Date: 21.01.2021 04:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[magaza](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[magaza_ad] [varchar](255) NOT NULL,
	[magaza_sehir] [varchar](100) NOT NULL,
	[magaza_telefon] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mudurler]    Script Date: 21.01.2021 04:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mudurler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mudur_ad] [varchar](100) NOT NULL,
	[mudur_soyad] [varchar](100) NOT NULL,
	[mudur_cinsiyet] [varchar](20) NOT NULL,
	[mudur_yas] [varchar](10) NOT NULL,
	[subesi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subeler]    Script Date: 21.01.2021 04:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subeler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sube_ad] [varchar](100) NOT NULL,
	[sube_sehir] [varchar](100) NOT NULL,
	[sube_telefon] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [calisanadsoyad]    Script Date: 21.01.2021 04:42:26 ******/
CREATE NONCLUSTERED INDEX [calisanadsoyad] ON [dbo].[calisanlar]
(
	[calisan_ad] ASC,
	[calisan_soyad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [calisanidx]    Script Date: 21.01.2021 04:42:26 ******/
CREATE NONCLUSTERED INDEX [calisanidx] ON [dbo].[calisanlar]
(
	[calisan_ad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idxcalisanyas]    Script Date: 21.01.2021 04:42:26 ******/
CREATE NONCLUSTERED INDEX [idxcalisanyas] ON [dbo].[calisanlar]
(
	[subesi] ASC,
	[calisan_yas] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idxmudur]    Script Date: 21.01.2021 04:42:26 ******/
CREATE NONCLUSTERED INDEX [idxmudur] ON [dbo].[mudurler]
(
	[subesi] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idxsube]    Script Date: 21.01.2021 04:42:26 ******/
CREATE NONCLUSTERED INDEX [idxsube] ON [dbo].[subeler]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[calisanlar]  WITH CHECK ADD  CONSTRAINT [FK_calisanmudur] FOREIGN KEY([mudurleri])
REFERENCES [dbo].[mudurler] ([id])
GO
ALTER TABLE [dbo].[calisanlar] CHECK CONSTRAINT [FK_calisanmudur]
GO
ALTER TABLE [dbo].[calisanlar]  WITH CHECK ADD  CONSTRAINT [FK_calisansube] FOREIGN KEY([subesi])
REFERENCES [dbo].[subeler] ([id])
GO
ALTER TABLE [dbo].[calisanlar] CHECK CONSTRAINT [FK_calisansube]
GO
ALTER TABLE [dbo].[mudurler]  WITH CHECK ADD  CONSTRAINT [FK_mudursube] FOREIGN KEY([subesi])
REFERENCES [dbo].[subeler] ([id])
GO
ALTER TABLE [dbo].[mudurler] CHECK CONSTRAINT [FK_mudursube]
GO
/****** Object:  StoredProcedure [dbo].[calisanlarekleme]    Script Date: 21.01.2021 04:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[calisanlarekleme]
@calisan_ad varchar(100),
@calisan_soyad varchar(100),
@calisan_cinsiyet varchar(20),
@calisan_yas int,
@subesi int,
@mudurleri int

AS
BEGIN

INSERT INTO calisanlar (calisan_ad, calisan_cinsiyet, calisan_soyad, calisan_yas, subesi, mudurleri )
  VALUES (@calisan_ad, @calisan_soyad, @calisan_cinsiyet, @calisan_yas, @subesi, @mudurleri )
  END
GO
/****** Object:  StoredProcedure [dbo].[calisansorgu]    Script Date: 21.01.2021 04:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[calisansorgu]
@calisan_ad varchar(100)
AS
BEGIN

SELECT * FROM calisanlar
WHERE calisan_ad like '%'+@calisan_ad+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[calisansube]    Script Date: 21.01.2021 04:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[calisansube]

AS  
BEGIN  
SET NOCOUNT ON; 
SELECT * FROM calisanlar  
INNER JOIN subeler ON calisanlar.id = subeler.id
 
END 
GO
/****** Object:  StoredProcedure [dbo].[magazaekleme]    Script Date: 21.01.2021 04:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[magazaekleme]
  @magaza_ad varchar(255),
  @magaza_sehir varchar(100),
  @magaza_telefon varchar(255)

  AS
  BEGIN

  INSERT INTO magaza (magaza_ad,magaza_sehir,magaza_telefon)
  VALUES (@magaza_ad,@magaza_sehir,@magaza_telefon)
  END
GO
/****** Object:  StoredProcedure [dbo].[mudurekleme]    Script Date: 21.01.2021 04:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mudurekleme]
@mudur_ad varchar(100),
@mudur_soyad varchar(100),
@mudur_cinsiyet varchar(20),
@mudur_yas varchar(10),
@subesi int

AS
BEGIN

INSERT INTO mudurler (mudur_ad,mudur_cinsiyet, mudur_soyad, mudur_yas,subesi)
VALUES (@mudur_ad,@mudur_cinsiyet,@mudur_soyad,@mudur_yas,@subesi)
END
GO
/****** Object:  StoredProcedure [dbo].[mudursorgu]    Script Date: 21.01.2021 04:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[mudursorgu]
@mudur_ad varchar(100)
AS
BEGIN

SELECT * FROM mudurler
WHERE mudur_ad like '%'+@mudur_ad+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[Spcalisansube]    Script Date: 21.01.2021 04:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Spcalisansube] 

AS  
BEGIN

SET NOCOUNT ON;  
SELECT * FROM calisanlar   
INNER JOIN subeler ON calisanlar.id = subeler.id  
INNER JOIN magaza ON calisanlar.id = magaza.id 
INNER JOIN mudurler ON subeler.id = mudurler.id
END
GO
/****** Object:  StoredProcedure [dbo].[Spmudurcalisan]    Script Date: 21.01.2021 04:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[Spmudurcalisan]

AS  
BEGIN  
SET NOCOUNT ON; 
SELECT * FROM mudurler  
INNER JOIN calisanlar ON mudurler.id = calisanlar.mudurleri
END 
GO
/****** Object:  StoredProcedure [dbo].[subecalisan]    Script Date: 21.01.2021 04:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[subecalisan]
  AS
  BEGIN
  SET NOCOUNT ON;
  SELECT * FROM subeler
  LEFT JOIN calisanlar ON subeler.id = calisanlar.id

  END
GO
/****** Object:  StoredProcedure [dbo].[subeekleme]    Script Date: 21.01.2021 04:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[subeekleme]
  @sube_ad varchar(100),
  @sube_sehir varchar(100),
  @sube_telefon varchar(20)

  AS
  BEGIN

  INSERT INTO subeler (sube_ad,sube_sehir,sube_telefon)
  VALUES (@sube_ad,@sube_sehir,@sube_telefon)
  END
GO
/****** Object:  StoredProcedure [dbo].[subesorgu]    Script Date: 21.01.2021 04:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[subesorgu]
@sube_sehir varchar(100)
AS
BEGIN

SELECT * FROM subeler
WHERE sube_sehir like '%'+@sube_sehir+'%'
END
GO
USE [master]
GO
ALTER DATABASE [elif] SET  READ_WRITE 
GO
