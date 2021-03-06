USE [master]
GO
/****** Object:  Database [NancyDemo]    Script Date: 2016/1/20 21:11:15 ******/
CREATE DATABASE [NancyDemo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NancyDemo', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\NancyDemo.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NancyDemo_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\NancyDemo_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NancyDemo] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NancyDemo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NancyDemo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NancyDemo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NancyDemo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NancyDemo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NancyDemo] SET ARITHABORT OFF 
GO
ALTER DATABASE [NancyDemo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NancyDemo] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [NancyDemo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NancyDemo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NancyDemo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NancyDemo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NancyDemo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NancyDemo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NancyDemo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NancyDemo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NancyDemo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NancyDemo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NancyDemo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NancyDemo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NancyDemo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NancyDemo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NancyDemo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NancyDemo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NancyDemo] SET RECOVERY FULL 
GO
ALTER DATABASE [NancyDemo] SET  MULTI_USER 
GO
ALTER DATABASE [NancyDemo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NancyDemo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NancyDemo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NancyDemo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NancyDemo', N'ON'
GO
USE [NancyDemo]
GO
/****** Object:  StoredProcedure [dbo].[up_DeleteMovieByMovieId]    Script Date: 2016/1/20 21:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[up_DeleteMovieByMovieId] 
	@MovieId int
AS
BEGIN
	
	SET NOCOUNT ON;

    Delete from Movie
	Where MovieId = @MovieId
END

GO
/****** Object:  StoredProcedure [dbo].[up_DeleteMovieTypeByTypeId]    Script Date: 2016/1/20 21:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[up_DeleteMovieTypeByTypeId]
@TypeId int
AS
BEGIN
	SET NOCOUNT ON;
	Delete from MovieType 
	Where TypeId = @TypeId
END

GO
/****** Object:  StoredProcedure [dbo].[up_GetAllMovies]    Script Date: 2016/1/20 21:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[up_GetAllMovies]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select m.MovieId,m.MovieName,mt.TypeName as MovieTypeName,m.MovieAddTime from Movie as m
	inner join MovieType as mt
	on m.MovieTypeId = mt.TypeId
END

GO
/****** Object:  StoredProcedure [dbo].[up_GetAllMovieTypes]    Script Date: 2016/1/20 21:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[up_GetAllMovieTypes]
AS
BEGIN
	SET NOCOUNT ON;
	Select mt.TypeId,mt.TypeName from MovieType as mt
END

GO
/****** Object:  StoredProcedure [dbo].[up_GetMovieByMovieId]    Script Date: 2016/1/20 21:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[up_GetMovieByMovieId]
	-- Add the parameters for the stored procedure here
@MovieId int
AS
BEGIN
	
	SET NOCOUNT ON;
		Select m.MovieId,m.MovieName,mt.TypeName as MovieTypeName,m.MovieAddTime,mt.TypeId as MovieTypeId from Movie as m
	inner join MovieType as mt
	on m.MovieTypeId = mt.TypeId
	Where m.MovieId = @MovieId
    
	
	
END

GO
/****** Object:  StoredProcedure [dbo].[up_GetMovieTypeByTypeId]    Script Date: 2016/1/20 21:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[up_GetMovieTypeByTypeId]
	@TypeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [TypeId]
      ,[TypeName]
  FROM [dbo].[MovieType]
  WHERE TypeId=@TypeId
END

GO
/****** Object:  StoredProcedure [dbo].[up_InsertMovie]    Script Date: 2016/1/20 21:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[up_InsertMovie]
	@MovieName nvarchar(20),
	@MovieTypeId int,
	@MovieAddTime datetime
AS
BEGIN
	
	SET NOCOUNT ON;

    Insert into Movie(MovieName,MovieTypeId,MovieAddTime)
	Values(@MovieName,@MovieTypeId,@MovieAddTime)
END

GO
/****** Object:  StoredProcedure [dbo].[up_InsertMovieType]    Script Date: 2016/1/20 21:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[up_InsertMovieType] 
@TypeName nvarchar(10)
AS
BEGIN	
	SET NOCOUNT ON;
	Insert into MovieType(TypeName)
	Values(@TypeName)
END

GO
/****** Object:  StoredProcedure [dbo].[up_UpdateMovieByMovieId]    Script Date: 2016/1/20 21:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[up_UpdateMovieByMovieId]
	@MovieId int,
	@MovieName nvarchar(20),
	@MovieTypeId int
AS
BEGIN	
	SET NOCOUNT ON;

	Update Movie 
	Set 
	MovieName = @MovieName,
	MovieTypeId = @MovieTypeId
	Where MovieId = @MovieId
    
END

GO
/****** Object:  StoredProcedure [dbo].[up_UpdateMovieTypeByTypeId]    Script Date: 2016/1/20 21:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[up_UpdateMovieTypeByTypeId]
@TypeId int,
@TypeName nvarchar(10)
AS
BEGIN	
	SET NOCOUNT ON;

    Update MovieType set TypeName = @TypeName
	where TypeId = @TypeId
	
END

GO
/****** Object:  Table [dbo].[Movie]    Script Date: 2016/1/20 21:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[MovieName] [nvarchar](20) NOT NULL,
	[MovieTypeId] [int] NOT NULL,
	[MovieAddTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MovieType]    Script Date: 2016/1/20 21:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_MovieType] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([MovieId], [MovieName], [MovieTypeId], [MovieAddTime]) VALUES (1, N'老炮儿', 2, CAST(0x0000A59100000000 AS DateTime))
INSERT [dbo].[Movie] ([MovieId], [MovieName], [MovieTypeId], [MovieAddTime]) VALUES (3, N'杀破狼2', 2, CAST(0x0000A59200CC9AF0 AS DateTime))
INSERT [dbo].[Movie] ([MovieId], [MovieName], [MovieTypeId], [MovieAddTime]) VALUES (4, N'喜剧之王', 1, CAST(0x0000A59200E76843 AS DateTime))
INSERT [dbo].[Movie] ([MovieId], [MovieName], [MovieTypeId], [MovieAddTime]) VALUES (6, N'蚁人', 2, CAST(0x0000A59200F314B9 AS DateTime))
INSERT [dbo].[Movie] ([MovieId], [MovieName], [MovieTypeId], [MovieAddTime]) VALUES (9, N'test', 4, CAST(0x0000A593008228AF AS DateTime))
SET IDENTITY_INSERT [dbo].[Movie] OFF
SET IDENTITY_INSERT [dbo].[MovieType] ON 

INSERT [dbo].[MovieType] ([TypeId], [TypeName]) VALUES (1, N'喜剧')
INSERT [dbo].[MovieType] ([TypeId], [TypeName]) VALUES (2, N'动作')
INSERT [dbo].[MovieType] ([TypeId], [TypeName]) VALUES (3, N'爱情是什么鬼')
INSERT [dbo].[MovieType] ([TypeId], [TypeName]) VALUES (4, N'其他')
SET IDENTITY_INSERT [dbo].[MovieType] OFF
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_MovieType] FOREIGN KEY([MovieTypeId])
REFERENCES [dbo].[MovieType] ([TypeId])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_MovieType]
GO
USE [master]
GO
ALTER DATABASE [NancyDemo] SET  READ_WRITE 
GO
