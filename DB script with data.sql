USE [master]
GO
/****** Object:  Database [AIRLINE MANAGEMENT]    Script Date: 14-04-2023 17:20:55 ******/
CREATE DATABASE [AIRLINE MANAGEMENT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AIRLINE MANAGEMENT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AIRLINE MANAGEMENT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AIRLINE MANAGEMENT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AIRLINE MANAGEMENT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AIRLINE MANAGEMENT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET ARITHABORT OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET  MULTI_USER 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET QUERY_STORE = OFF
GO
USE [AIRLINE MANAGEMENT]
GO
/****** Object:  Table [dbo].[Airline]    Script Date: 14-04-2023 17:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airline](
	[FlightId] [int] IDENTITY(1,1) NOT NULL,
	[AirlineId]  AS ('AIRLINEID'+right('0000'+CONVERT([varchar](4),[FlightId]),(4))),
	[DepAirport] [varchar](50) NOT NULL,
	[DepDate] [date] NOT NULL,
	[DepTime] [time](7) NOT NULL,
	[ArrAirport] [varchar](50) NOT NULL,
	[ArrDate] [date] NOT NULL,
	[ArrTime] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FlightId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 14-04-2023 17:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Airline] ON 

INSERT [dbo].[Airline] ([FlightId], [DepAirport], [DepDate], [DepTime], [ArrAirport], [ArrDate], [ArrTime]) VALUES (4, N'Delhi', CAST(N'2023-03-22' AS Date), CAST(N'12:06:00' AS Time), N'Mumbai', CAST(N'2023-03-24' AS Date), CAST(N'17:10:00' AS Time))
INSERT [dbo].[Airline] ([FlightId], [DepAirport], [DepDate], [DepTime], [ArrAirport], [ArrDate], [ArrTime]) VALUES (5, N'Fiji', CAST(N'2023-03-21' AS Date), CAST(N'13:48:00' AS Time), N'Delhi', CAST(N'2023-03-30' AS Date), CAST(N'14:50:00' AS Time))
INSERT [dbo].[Airline] ([FlightId], [DepAirport], [DepDate], [DepTime], [ArrAirport], [ArrDate], [ArrTime]) VALUES (6, N'Kottayam', CAST(N'2023-03-22' AS Date), CAST(N'14:53:00' AS Time), N'Delhii', CAST(N'2023-03-30' AS Date), CAST(N'15:54:00' AS Time))
SET IDENTITY_INSERT [dbo].[Airline] OFF
GO
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([userid], [username], [password]) VALUES (1, N'neha@gmail.com', N'Neha@123')
SET IDENTITY_INSERT [dbo].[Login] OFF
GO
/****** Object:  StoredProcedure [dbo].[delete_AirLine]    Script Date: 14-04-2023 17:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_AirLine]
(
@empid int
)
as
begin
delete from Airline where FlightId=@empid
end
GO
/****** Object:  StoredProcedure [dbo].[get_AirLine_by_ID]    Script Date: 14-04-2023 17:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_AirLine_by_ID]
(
@empid int
)
as
begin
select *from Airline where FlightId=@empid
end
GO
/****** Object:  StoredProcedure [dbo].[InsertFlight]    Script Date: 14-04-2023 17:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertFlight]
    @DepAirport VARCHAR(50),
    @DepDate DATE,
    @DepTime TIME,
    @ArrAirport VARCHAR(50),
    @ArrDate DATE,
    @ArrTime TIME
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Airline(DepAirport, DepDate, DepTime, ArrAirport, ArrDate, ArrTime)
    VALUES (@DepAirport, @DepDate, @DepTime, @ArrAirport, @ArrDate, @ArrTime);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllAirLine]    Script Date: 14-04-2023 17:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_GetAllAirLine]
as
begin
select *from Airline
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateFlight]    Script Date: 14-04-2023 17:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateFlight]
    @FlightId INT,
    @DepAirport VARCHAR(50),
    @DepDate DATE,
    @DepTime TIME,
    @ArrAirport VARCHAR(50),
    @ArrDate DATE,
    @ArrTime TIME
AS
BEGIN
    UPDATE Airline
    SET
        DepAirport = @DepAirport,
        DepDate = @DepDate,
        DepTime = @DepTime,
        ArrAirport = @ArrAirport,
        ArrDate = @ArrDate,
        ArrTime = @ArrTime
    WHERE FlightId = @FlightId;
END
GO
/****** Object:  StoredProcedure [dbo].[user_login]    Script Date: 14-04-2023 17:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[user_login]
    @username VARCHAR(50)='',
    @password VARCHAR(50)='',
	@isvalid Bit Out
AS
BEGIN
 set @isvalid=(select count(1) from  Login where username=@username and password=@password)
END
GO
USE [master]
GO
ALTER DATABASE [AIRLINE MANAGEMENT] SET  READ_WRITE 
GO
