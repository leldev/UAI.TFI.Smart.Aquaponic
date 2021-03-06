USE [master]
GO
/****** Object:  Database [SmartAquaponic]    Script Date: 11/12/2020 8:53:31 PM ******/
CREATE DATABASE [SmartAquaponic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmartAquaponic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SmartAquaponic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SmartAquaponic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SmartAquaponic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SmartAquaponic] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmartAquaponic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmartAquaponic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmartAquaponic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmartAquaponic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmartAquaponic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmartAquaponic] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmartAquaponic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SmartAquaponic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmartAquaponic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmartAquaponic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmartAquaponic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmartAquaponic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmartAquaponic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmartAquaponic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmartAquaponic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmartAquaponic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SmartAquaponic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmartAquaponic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmartAquaponic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmartAquaponic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SmartAquaponic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmartAquaponic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SmartAquaponic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmartAquaponic] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SmartAquaponic] SET  MULTI_USER 
GO
ALTER DATABASE [SmartAquaponic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmartAquaponic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SmartAquaponic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SmartAquaponic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SmartAquaponic] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SmartAquaponic', N'ON'
GO
ALTER DATABASE [SmartAquaponic] SET QUERY_STORE = OFF
GO
USE [SmartAquaponic]
GO
/****** Object:  UserDefinedTableType [dbo].[TTDictionary]    Script Date: 11/12/2020 8:53:31 PM ******/
CREATE TYPE [dbo].[TTDictionary] AS TABLE(
	[Key] [int] NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[TTListInt]    Script Date: 11/12/2020 8:53:31 PM ******/
CREATE TYPE [dbo].[TTListInt] AS TABLE(
	[CommonValue] [int] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[CommonValue] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[Checksum]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Checksum](
	[ChecksumId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[Hash] [int] NOT NULL,
	[Table] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Checksum] PRIMARY KEY CLUSTERED 
(
	[ChecksumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Communication]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Communication](
	[CommunicationId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[IsAnswered] [bit] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Response] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Communication] PRIMARY KEY CLUSTERED 
(
	[CommunicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Decor]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Decor](
	[DecorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Volume] [decimal](18, 2) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Decor] PRIMARY KEY CLUSTERED 
(
	[DecorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fish]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fish](
	[FishId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[IsLonely] [bit] NOT NULL,
	[WaterRequired] [decimal](18, 2) NOT NULL,
	[Size] [decimal](18, 2) NOT NULL,
	[Temp] [numeric](18, 2) NOT NULL,
	[PhId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Fish] PRIMARY KEY CLUSTERED 
(
	[FishId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupId] [int] NOT NULL,
	[RoleId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lamp]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lamp](
	[LampId] [int] IDENTITY(1,1) NOT NULL,
	[Lumen] [int] NOT NULL,
	[Power] [int] NOT NULL,
	[SocketId] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Lamp] PRIMARY KEY CLUSTERED 
(
	[LampId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[Hash] [int] NOT NULL,
	[EventId] [int] NOT NULL,
	[Ip] [nvarchar](50) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ph]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ph](
	[PhId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Ph] PRIMARY KEY CLUSTERED 
(
	[PhId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plant]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plant](
	[PlantId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[IsHydroponic] [bit] NOT NULL,
	[IsLowLight] [bit] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Plant] PRIMARY KEY CLUSTERED 
(
	[PlantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pot]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pot](
	[PotId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Rgb] [nvarchar](7) NOT NULL,
	[Heigth] [decimal](18, 2) NOT NULL,
	[Length] [decimal](18, 2) NOT NULL,
	[Width] [decimal](18, 2) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[RockId] [int] NOT NULL,
 CONSTRAINT [PK_Pot] PRIMARY KEY CLUSTERED 
(
	[PotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PotPlant]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PotPlant](
	[PlantId] [int] NOT NULL,
	[PotId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Predator]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Predator](
	[PredatorId] [int] NOT NULL,
	[FishId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreferenceResource]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreferenceResource](
	[UserPreferenceId] [int] NOT NULL,
	[ResourceId] [int] NOT NULL,
	[Value] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[ResourceId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[Key] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rock]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rock](
	[RockId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rock] PRIMARY KEY CLUSTERED 
(
	[RockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Socket]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Socket](
	[SocketId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Socket] PRIMARY KEY CLUSTERED 
(
	[SocketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpotLight]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpotLight](
	[SpotLightId] [int] IDENTITY(1,1) NOT NULL,
	[Slots] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Heigth] [decimal](18, 2) NOT NULL,
	[Length] [decimal](18, 2) NOT NULL,
	[Width] [decimal](18, 2) NOT NULL,
	[SocketId] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_SpotLight] PRIMARY KEY CLUSTERED 
(
	[SpotLightId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpotLightLamp]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpotLightLamp](
	[SpotLightId] [int] NOT NULL,
	[LampId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tank]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tank](
	[TankId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[WaterTemp] [numeric](18, 2) NOT NULL,
	[Heigth] [numeric](18, 2) NOT NULL,
	[Length] [numeric](18, 2) NOT NULL,
	[Width] [numeric](18, 2) NOT NULL,
	[PhId] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[WaterPumpId] [int] NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Tank] PRIMARY KEY CLUSTERED 
(
	[TankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TankDecor]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TankDecor](
	[TankId] [int] NOT NULL,
	[DecorId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TankFish]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TankFish](
	[TankId] [int] NOT NULL,
	[FishId] [int] NOT NULL,
	[Cant] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[Hash] [int] NOT NULL,
	[IsLocked] [bit] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[LoginAttempts] [int] NOT NULL,
	[UserPreferenceId] [int] NOT NULL,
	[TempPassword] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[Email] [nvarchar](255) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPreference]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPreference](
	[UserPreferenceId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[DateFormat] [nvarchar](50) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TimeZone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserPreference] PRIMARY KEY CLUSTERED 
(
	[UserPreferenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WaterPump]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WaterPump](
	[WaterPumpId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[FlowRate] [int] NOT NULL,
	[Power] [int] NOT NULL,
	[Volume] [decimal](18, 2) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_WaterPump] PRIMARY KEY CLUSTERED 
(
	[WaterPumpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Checksum] ON 

INSERT [dbo].[Checksum] ([ChecksumId], [CreatedDate], [ModifiedDate], [Hash], [Table]) VALUES (1, CAST(N'2020-09-13T00:36:20.9266667' AS DateTime2), CAST(N'2020-11-12T19:42:26.5833333' AS DateTime2), 437, N'Log')
INSERT [dbo].[Checksum] ([ChecksumId], [CreatedDate], [ModifiedDate], [Hash], [Table]) VALUES (2, CAST(N'2020-09-13T18:43:16.0133333' AS DateTime2), CAST(N'2020-11-12T19:25:03.3233333' AS DateTime2), 265, N'User')
SET IDENTITY_INSERT [dbo].[Checksum] OFF
GO
SET IDENTITY_INSERT [dbo].[Decor] ON 

INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (1, N'Jellyfish', N'Plastic', CAST(281.25 AS Decimal(18, 2)), CAST(N'2020-11-07T20:06:20.5766667' AS DateTime2), CAST(N'2020-11-07T20:06:20.5766667' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (2, N'Plant Green', N'Plastic', CAST(500.00 AS Decimal(18, 2)), CAST(N'2020-11-07T20:06:44.9166667' AS DateTime2), CAST(N'2020-11-07T20:06:44.9166667' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (3, N'Plant Large', N'Plastic', CAST(368.66 AS Decimal(18, 2)), CAST(N'2020-11-07T20:07:02.3800000' AS DateTime2), CAST(N'2020-11-07T20:07:02.3800000' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (4, N'Stone Toten', N'Stone', CAST(487.50 AS Decimal(18, 2)), CAST(N'2020-11-07T20:07:27.5233333' AS DateTime2), CAST(N'2020-11-07T20:07:27.5233333' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (5, N'Fish House', N'Plastic', CAST(1583.90 AS Decimal(18, 2)), CAST(N'2020-11-07T20:07:48.1900000' AS DateTime2), CAST(N'2020-11-07T20:07:48.1900000' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (6, N'Castle', N'Platic', CAST(2690.00 AS Decimal(18, 2)), CAST(N'2020-11-07T20:08:17.0766667' AS DateTime2), CAST(N'2020-11-07T20:08:17.0766667' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (7, N'Fish Nemo', N'Plastic', CAST(189.00 AS Decimal(18, 2)), CAST(N'2020-11-07T20:08:34.6933333' AS DateTime2), CAST(N'2020-11-07T20:08:34.6933333' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (8, N'Air Stone Bubble', N'LED', CAST(500.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:05:21.0100000' AS DateTime2), CAST(N'2020-11-08T22:05:21.0100000' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (9, N'Gravel ', N'Stone', CAST(250.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:05:52.1700000' AS DateTime2), CAST(N'2020-11-08T22:05:52.1700000' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (10, N'Polished Gravel', N'Stone', CAST(400.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:06:07.8100000' AS DateTime2), CAST(N'2020-11-08T22:06:07.8100000' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (11, N'Gravel River Rock', N'Stone', CAST(1000.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:06:24.7400000' AS DateTime2), CAST(N'2020-11-08T22:06:24.7400000' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (12, N'Aquarium Bubble LED Lights', N'LED', CAST(500.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:06:42.5300000' AS DateTime2), CAST(N'2020-11-08T22:06:42.5300000' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (13, N'Oxygen Pump', N'LED', CAST(600.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:07:04.7200000' AS DateTime2), CAST(N'2020-11-08T22:07:04.7200000' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (14, N'Granite', N'Stone', CAST(300.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:07:26.7100000' AS DateTime2), CAST(N'2020-11-08T22:07:26.7100000' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (15, N'GloFish Accent Gravel', N'Stone', CAST(250.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:07:41.1466667' AS DateTime2), CAST(N'2020-11-08T22:07:41.1466667' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (16, N'Broken Barrel', N'Plastic', CAST(300.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:08:03.5733333' AS DateTime2), CAST(N'2020-11-08T22:08:03.5733333' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (17, N'Tree trunk', N'Plastic', CAST(300.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:08:25.7466667' AS DateTime2), CAST(N'2020-11-08T22:08:25.7466667' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (18, N'Starfishes', N'Plastic', CAST(250.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:08:43.0500000' AS DateTime2), CAST(N'2020-11-08T22:08:43.0500000' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (19, N'Resin Cave', N'Plastic', CAST(350.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:09:02.0733333' AS DateTime2), CAST(N'2020-11-08T22:09:02.0733333' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (20, N'Cave', N'Plastic', CAST(600.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:09:21.4966667' AS DateTime2), CAST(N'2020-11-08T22:09:21.4966667' AS DateTime2))
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (21, N'Glowing Artificial Mushroom', N'Plastic', CAST(600.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:09:43.3800000' AS DateTime2), CAST(N'2020-11-08T22:09:43.3800000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Decor] OFF
GO
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([EventId], [Name]) VALUES (1, N'Error')
INSERT [dbo].[Event] ([EventId], [Name]) VALUES (2, N'Info')
INSERT [dbo].[Event] ([EventId], [Name]) VALUES (3, N'Verbose')
INSERT [dbo].[Event] ([EventId], [Name]) VALUES (4, N'Warning')
SET IDENTITY_INSERT [dbo].[Event] OFF
GO
SET IDENTITY_INSERT [dbo].[Fish] ON 

INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (1, CAST(N'2020-11-07T16:42:01.1566667' AS DateTime2), CAST(N'2020-11-07T17:23:43.5833333' AS DateTime2), 0, CAST(12000.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(21.00 AS Numeric(18, 2)), 7, N'Goldfish')
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (2, CAST(N'2020-11-07T16:45:42.1333333' AS DateTime2), CAST(N'2020-11-07T17:23:47.2300000' AS DateTime2), 1, CAST(24000.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(25.00 AS Numeric(18, 2)), 7, N'Betta')
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (3, CAST(N'2020-11-07T16:49:00.2966667' AS DateTime2), CAST(N'2020-11-07T17:23:39.9133333' AS DateTime2), 0, CAST(22000.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), CAST(24.00 AS Numeric(18, 2)), 6, N'Piranha')
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (4, CAST(N'2020-11-07T22:53:12.5000000' AS DateTime2), CAST(N'2020-11-07T22:53:12.5000000' AS DateTime2), 0, CAST(2000.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(26.00 AS Numeric(18, 2)), 7, N'Guppy')
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (5, CAST(N'2020-11-08T21:08:16.8400000' AS DateTime2), CAST(N'2020-11-08T21:09:24.8200000' AS DateTime2), 0, CAST(50000.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(20.00 AS Numeric(18, 2)), 5, N'Snakehead ')
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (6, CAST(N'2020-11-08T21:10:30.1766667' AS DateTime2), CAST(N'2020-11-08T21:13:22.9300000' AS DateTime2), 0, CAST(12000.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(23.00 AS Numeric(18, 2)), 4, N'Catfish')
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (7, CAST(N'2020-11-08T21:12:27.8200000' AS DateTime2), CAST(N'2020-11-08T21:13:31.4066667' AS DateTime2), 0, CAST(3000.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(22.00 AS Numeric(18, 2)), 8, N'Comet (goldfish)')
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (8, CAST(N'2020-11-08T21:13:09.5866667' AS DateTime2), CAST(N'2020-11-08T21:13:09.5866667' AS DateTime2), 1, CAST(5000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(22.00 AS Numeric(18, 2)), 7, N'Bubble Eye')
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (9, CAST(N'2020-11-08T21:14:06.1966667' AS DateTime2), CAST(N'2020-11-08T21:14:06.1966667' AS DateTime2), 0, CAST(4000.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(19.00 AS Numeric(18, 2)), 9, N'Telescope (goldfish)')
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (10, CAST(N'2020-11-08T21:14:46.6000000' AS DateTime2), CAST(N'2020-11-08T21:14:46.6000000' AS DateTime2), 1, CAST(3500.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), CAST(23.00 AS Numeric(18, 2)), 7, N'Shubunkin')
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (11, CAST(N'2020-11-08T21:16:32.2433333' AS DateTime2), CAST(N'2020-11-08T21:16:32.2433333' AS DateTime2), 0, CAST(24000.00 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)), CAST(25.00 AS Numeric(18, 2)), 7, N'Parachromis dovii')
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (12, CAST(N'2020-11-08T21:18:34.7366667' AS DateTime2), CAST(N'2020-11-08T21:18:34.7366667' AS DateTime2), 0, CAST(5000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(23.00 AS Numeric(18, 2)), 6, N'Lionhead (goldfish)')
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (13, CAST(N'2020-11-08T22:11:53.1366667' AS DateTime2), CAST(N'2020-11-08T22:11:53.1366667' AS DateTime2), 0, CAST(15000.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(23.00 AS Numeric(18, 2)), 7, N'Cichlid')
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (14, CAST(N'2020-11-08T22:13:23.4033333' AS DateTime2), CAST(N'2020-11-08T22:13:23.4033333' AS DateTime2), 0, CAST(7500.00 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), CAST(25.00 AS Numeric(18, 2)), 7, N'Clownfish')
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (15, CAST(N'2020-11-08T22:14:40.6366667' AS DateTime2), CAST(N'2020-11-08T22:14:40.6366667' AS DateTime2), 0, CAST(20000.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(20.00 AS Numeric(18, 2)), 7, N'Koi')
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (16, CAST(N'2020-11-08T22:16:24.2200000' AS DateTime2), CAST(N'2020-11-08T22:16:24.2200000' AS DateTime2), 0, CAST(23000.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(16.00 AS Numeric(18, 2)), 11, N'Axolotl')
SET IDENTITY_INSERT [dbo].[Fish] OFF
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (101, 1)
GO
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (1, CAST(N'2020-11-12T19:24:50.7200000' AS DateTime2), CAST(N'2020-11-12T19:24:50.7200000' AS DateTime2), 3, 2, N'127.0 0.1', N'8D8LqDrSKAnUslo7kyX1pw==', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (2, CAST(N'2020-11-12T19:24:57.3966667' AS DateTime2), CAST(N'2020-11-12T19:24:57.3966667' AS DateTime2), 19, 4, N'127.0 0.1', N'rRoG2sxyuI4+z8dLf4pZ/bqgiPsyD0uQpLHUzK4OQto=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (3, CAST(N'2020-11-12T19:24:57.4900000' AS DateTime2), CAST(N'2020-11-12T19:24:57.4900000' AS DateTime2), 11, 1, N'127.0 0.1', N'MFFsTs/QvUwyXDdanuw7vWveXNpfWobT5t9grCWp0Ms=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (4, CAST(N'2020-11-12T19:24:57.5200000' AS DateTime2), CAST(N'2020-11-12T19:24:57.5200000' AS DateTime2), 12, 1, N'127.0 0.1', N'nIHcRjRoJTBdM+d42tsuqcccrYbfsdoON6iEk9phVMM=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (5, CAST(N'2020-11-12T19:24:57.5533333' AS DateTime2), CAST(N'2020-11-12T19:24:57.5533333' AS DateTime2), 10, 1, N'127.0 0.1', N'0BUNgfou2NdN9QjjMWGr6P0W1OE88iAJQYwJKUI/TaM=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (6, CAST(N'2020-11-12T19:24:57.5933333' AS DateTime2), CAST(N'2020-11-12T19:24:57.5933333' AS DateTime2), 11, 1, N'127.0 0.1', N'NMZQ70PdwuP7vEwRjRwtZHVj1ncaBINgD4KllK5bETo=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (7, CAST(N'2020-11-12T19:24:57.6333333' AS DateTime2), CAST(N'2020-11-12T19:24:57.6333333' AS DateTime2), 9, 1, N'127.0 0.1', N'63L8dbx39eDDHcybs8j08RU2AzcM2QzzplfDfTdWiZU=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (8, CAST(N'2020-11-12T19:24:57.6666667' AS DateTime2), CAST(N'2020-11-12T19:24:57.6666667' AS DateTime2), 16, 1, N'127.0 0.1', N'gMLCeciGufYFxnD6xdO5nrh26jUJzcMOhw5/+NekSWI=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (9, CAST(N'2020-11-12T19:24:57.7033333' AS DateTime2), CAST(N'2020-11-12T19:24:57.7033333' AS DateTime2), 10, 1, N'127.0 0.1', N'ph9GEoHo+l3lSb4jCdR4TPWPqq2TMYgWJpxDSUGqHq8=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (10, CAST(N'2020-11-12T19:24:57.7366667' AS DateTime2), CAST(N'2020-11-12T19:24:57.7366667' AS DateTime2), 17, 1, N'127.0 0.1', N'7i6pc9lPgmZrzV3/3aMsOeUrOqCo+lIDNkgqpmbhTjs=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (11, CAST(N'2020-11-12T19:24:57.7700000' AS DateTime2), CAST(N'2020-11-12T19:24:57.7700000' AS DateTime2), 1, 1, N'127.0 0.1', N'DaplLyLg8+1vH7ncLE7XeXqx89qlUgY+P7R641nqjFI=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (12, CAST(N'2020-11-12T19:24:57.8300000' AS DateTime2), CAST(N'2020-11-12T19:24:57.8300000' AS DateTime2), 15, 1, N'127.0 0.1', N'maHO1pG/6XwoCUvwVO8c2BP2m/eSmT4wP5irHkdmhmc=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (13, CAST(N'2020-11-12T19:24:57.8800000' AS DateTime2), CAST(N'2020-11-12T19:24:57.8800000' AS DateTime2), 17, 1, N'127.0 0.1', N'w/oR3UooCG0Kr/lvoDoYNTXwk+AgkK857ijqHg+swGs=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (14, CAST(N'2020-11-12T19:24:57.9366667' AS DateTime2), CAST(N'2020-11-12T19:24:57.9366667' AS DateTime2), 10, 1, N'127.0 0.1', N'yeQRsHLX1zVJZskdLblBVkib8x1dFuCQk/R78TkYHYQ=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (15, CAST(N'2020-11-12T19:24:58.0066667' AS DateTime2), CAST(N'2020-11-12T19:24:58.0066667' AS DateTime2), 7, 1, N'127.0 0.1', N'XrRJH+5db7xx604syu/Hf1DpWHo9FbUDnnQBR9BG6lk=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (16, CAST(N'2020-11-12T19:24:58.0566667' AS DateTime2), CAST(N'2020-11-12T19:24:58.0566667' AS DateTime2), 5, 1, N'127.0 0.1', N'ggY7a6BvsYDrKiunjD+5R8OTVjO8yLMx1jMmbCvmIJo=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (17, CAST(N'2020-11-12T19:24:58.1000000' AS DateTime2), CAST(N'2020-11-12T19:24:58.1000000' AS DateTime2), 4, 1, N'127.0 0.1', N'V8huWA9K+AWSNEN4mLa7GCVq2WjcTRMH82MrUOMiH3U=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (18, CAST(N'2020-11-12T19:24:58.1400000' AS DateTime2), CAST(N'2020-11-12T19:24:58.1400000' AS DateTime2), 7, 1, N'127.0 0.1', N'PAiOCur9Gw9JbuI+11GFY627+xv5d4f46per+FHK3nI=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (19, CAST(N'2020-11-12T19:24:58.1866667' AS DateTime2), CAST(N'2020-11-12T19:24:58.1866667' AS DateTime2), 18, 1, N'127.0 0.1', N'Fv+V088sluIjY//ZSLGy7ozG/IaZgXASA+wj+l7+uYM=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (20, CAST(N'2020-11-12T19:24:58.2266667' AS DateTime2), CAST(N'2020-11-12T19:24:58.2266667' AS DateTime2), 13, 1, N'127.0 0.1', N'Nnqu0dM+nsaR/u3Qzl1LlwwOpv3u6+g95S/wFdqItdo=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (21, CAST(N'2020-11-12T19:24:58.2800000' AS DateTime2), CAST(N'2020-11-12T19:24:58.2800000' AS DateTime2), 7, 1, N'127.0 0.1', N'oVMAxbXMfdr3/rl+N8hrPNDku3IiyzPLXYpyl4T5dV4=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (22, CAST(N'2020-11-12T19:24:58.3466667' AS DateTime2), CAST(N'2020-11-12T19:24:58.3466667' AS DateTime2), 9, 1, N'127.0 0.1', N'x5WsiMkT8+06MHNWVIgQ+tf5nkwatFWGehfKCg8LoSo=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (23, CAST(N'2020-11-12T19:24:58.4100000' AS DateTime2), CAST(N'2020-11-12T19:24:58.4100000' AS DateTime2), 11, 1, N'127.0 0.1', N'n6uFsylGXVFQM/mPC6YWL5/MjTlyrNWMVDNRT0uNebw=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (24, CAST(N'2020-11-12T19:24:58.4600000' AS DateTime2), CAST(N'2020-11-12T19:24:58.4600000' AS DateTime2), 11, 1, N'127.0 0.1', N'yMPWe1kjH0A+VDMT/25JVGvTA5EOlhvb8xARTWEydQ0=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (25, CAST(N'2020-11-12T19:24:58.5166667' AS DateTime2), CAST(N'2020-11-12T19:24:58.5166667' AS DateTime2), 19, 1, N'127.0 0.1', N'dEF2AI/LoViKMDY1GAii0v3hgIGt8ElMGT3RAKGcoTQ=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (26, CAST(N'2020-11-12T19:24:58.5533333' AS DateTime2), CAST(N'2020-11-12T19:24:58.5533333' AS DateTime2), 2, 1, N'127.0 0.1', N'jccrnbmePbttB6atmHG4L6S7744hQhhYjvDdgTNJJio=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (27, CAST(N'2020-11-12T19:24:58.6033333' AS DateTime2), CAST(N'2020-11-12T19:24:58.6033333' AS DateTime2), 7, 1, N'127.0 0.1', N'CDfYdh00bhPz7hFmx4pTOXNgo67SqaIcFO64BbpD4aA=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (28, CAST(N'2020-11-12T19:24:58.6433333' AS DateTime2), CAST(N'2020-11-12T19:24:58.6433333' AS DateTime2), 12, 1, N'127.0 0.1', N'LRlhnvt7wY/6RZMHdcv+xWUTJdLERG1eLIJtnhwULio=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (29, CAST(N'2020-11-12T19:24:58.7033333' AS DateTime2), CAST(N'2020-11-12T19:24:58.7033333' AS DateTime2), 2, 1, N'127.0 0.1', N'mMjawhXoF9O6XMmQ2PXcUUB9yidkTbmlM04j68g+/ms=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (30, CAST(N'2020-11-12T19:24:58.7400000' AS DateTime2), CAST(N'2020-11-12T19:24:58.7400000' AS DateTime2), 14, 1, N'127.0 0.1', N'QB/JOeHHwenqtrnX4ro8QjMc/LCfx5paRYbBULPIhCI=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (31, CAST(N'2020-11-12T19:24:58.7800000' AS DateTime2), CAST(N'2020-11-12T19:24:58.7800000' AS DateTime2), 15, 1, N'127.0 0.1', N'gLt0YG1xq6FNVEmwiDb4NqtV+Ray+vIQuQX8zUjNTjs=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (32, CAST(N'2020-11-12T19:24:58.8200000' AS DateTime2), CAST(N'2020-11-12T19:24:58.8200000' AS DateTime2), 4, 1, N'127.0 0.1', N'8+AY7FQJx8WbYXFOlD/RjSJIc9FOsayaz1cEMKR5fHo=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (33, CAST(N'2020-11-12T19:24:58.8633333' AS DateTime2), CAST(N'2020-11-12T19:24:58.8633333' AS DateTime2), 12, 1, N'127.0 0.1', N'JRE/NVGfLVbLinGN3Ocp6UBumUWQljWhTNMvsPUtQ5Q=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (34, CAST(N'2020-11-12T19:24:58.9366667' AS DateTime2), CAST(N'2020-11-12T19:24:58.9366667' AS DateTime2), 13, 1, N'127.0 0.1', N'9pkSiDpJd4WRZmf4JtdPxHqtgY1uovTUc7FuTQJwZZ0=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (35, CAST(N'2020-11-12T19:24:58.9800000' AS DateTime2), CAST(N'2020-11-12T19:24:58.9800000' AS DateTime2), 3, 1, N'127.0 0.1', N's64u5/f77nU/78C8/IEqX1RwZeH7Sp6t7ILeOxMqs4s=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (36, CAST(N'2020-11-12T19:24:59.0433333' AS DateTime2), CAST(N'2020-11-12T19:24:59.0433333' AS DateTime2), 13, 1, N'127.0 0.1', N'qDnOjGk91S/J5csemtqV8stAeZuLSf1EVmMzKj/a5bw=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (37, CAST(N'2020-11-12T19:24:59.1200000' AS DateTime2), CAST(N'2020-11-12T19:24:59.1200000' AS DateTime2), 4, 1, N'127.0 0.1', N'IUgH/jsl9q5Q5sBcjG77ShWhsU62DG8m0nkD45QkJWs=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (38, CAST(N'2020-11-12T19:24:59.1766667' AS DateTime2), CAST(N'2020-11-12T19:24:59.1766667' AS DateTime2), 13, 1, N'127.0 0.1', N'phhbWFBv8g4Z3dkuW4dRP+FQDv6cjQPVP+JbEDZP2RA=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (39, CAST(N'2020-11-12T19:24:59.2200000' AS DateTime2), CAST(N'2020-11-12T19:24:59.2200000' AS DateTime2), 6, 1, N'127.0 0.1', N'M801vJstIoPclHDJ99LOky0AIetSQYWDGVPm3mfvUQE=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (40, CAST(N'2020-11-12T19:24:59.2633333' AS DateTime2), CAST(N'2020-11-12T19:24:59.2633333' AS DateTime2), 4, 1, N'127.0 0.1', N'U9EztYIJBAkzQDBDBB1il8fxg98D/jknHMF2s77s7zo=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (41, CAST(N'2020-11-12T19:25:02.2900000' AS DateTime2), CAST(N'2020-11-12T19:25:02.2900000' AS DateTime2), 15, 4, N'127.0 0.1', N'VRQSqvv3aa97yBgg7m/exD9VEMlSBE/woPNzzHPkhM4=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (42, CAST(N'2020-11-12T19:32:52.6266667' AS DateTime2), CAST(N'2020-11-12T19:32:52.6266667' AS DateTime2), 12, 2, N'127.0 0.1', N'FWM2zZzw5WbKHmjJ+ei/h/ykrosRw31jnxrxohW8Fps=', NULL)
INSERT [dbo].[Log] ([LogId], [CreatedDate], [ModifiedDate], [Hash], [EventId], [Ip], [Message], [UserId]) VALUES (43, CAST(N'2020-11-12T19:42:26.5566667' AS DateTime2), CAST(N'2020-11-12T19:42:26.5566667' AS DateTime2), 14, 2, N'127.0 0.1', N'kdjB2SDQPOouJmRz+kNv+g==', NULL)
SET IDENTITY_INSERT [dbo].[Log] OFF
GO
SET IDENTITY_INSERT [dbo].[Ph] ON 

INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (1, N'Beige')
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (2, N'Blue')
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (3, N'DarkBlue')
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (4, N'DarkGreen')
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (5, N'Green')
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (6, N'LimeGreen')
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (7, N'Orange')
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (8, N'PaleBlue')
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (9, N'Pink')
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (10, N'Purple')
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (11, N'Red')
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (12, N'Tarquoise')
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (13, N'Violet')
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (14, N'Yellow')
SET IDENTITY_INSERT [dbo].[Ph] OFF
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 0, N'An unexpected error has occurred. Please try again later.')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 1, N'No results found.')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 2, N'The record was modified by another user. Please try again later')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 3, N'Item Already exist. Please try again later')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 4, N'Item cannot be deleted')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 5, N'The user or password is incorrect.')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 6, N'Your user is corrupted. Please try again later')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 7, N'You are not allowed to sign in.')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 8, N'Your user is blocked.')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 9, N'Integrity error in the database')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 10, N'You do not have permiossion to access this page.')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 11, N'Restore has been created successfully. You have been logged off.')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 12, N'Integrity without error in the database')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 13, N'Backup has been created successfully')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 14, N'Your message was successfully sent.')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 15, N'Logout')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 16, N'Language management')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 17, N'Back office')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 18, N'Database management')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 19, N'Logs')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 20, N'Permission management')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 21, N'User management')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 22, N'Inventory')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 23, N'Tank management')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 24, N'Fish management')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 25, N'Decor management')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 26, N'Water pump management')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 27, N'Pot management')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 28, N'Plant management')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 29, N'Spotligth management')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 30, N'Lamp management')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 31, N'Product')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 32, N'Product management')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 33, N'Clay pebble')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 34, N'Expanded shale')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 35, N'Growstone')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 36, N'Lava rock')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 37, N'Red')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 38, N'Pink')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 39, N'Orange')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 40, N'Beige')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 41, N'Yellow')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 42, N'Lime green')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 43, N'Green')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 44, N'Dark green')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 45, N'Tarquoise')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 46, N'Pale blue')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 47, N'Blue')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 48, N'Dark blue')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 49, N'Violet')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 50, N'Purple')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 51, N'Login')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 52, N'Contact us')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 53, N'Delete')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 54, N'Update')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 55, N'Generate password')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 56, N'Unlock')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 57, N'Recovery')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 58, N'Backup')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 59, N'Verify')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 60, N'Generate password')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 61, N'Recovery password')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 62, N'Send')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 63, N'Restore')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 64, N'Sing in')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 65, N'Create')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 66, N'Permissions')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 67, N'Create Permission')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 68, N'Name')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 69, N'Required')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 70, N'Roles')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 71, N'Delete Permission')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 72, N'Name')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 73, N'Update Permision')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 74, N'User Preference')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 75, N'Update User Preference')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 76, N'Date format')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 77, N'Time zone')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 78, N'Resources')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 79, N'Delete User Preference')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 80, N'Create User Preference')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 81, N'Users')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 82, N'Create User')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 83, N'Delete User')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 84, N'Update User')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 85, N'Last name')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 86, N'Username')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 87, N'Permission')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 88, N'Password')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 89, N'Login')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 90, N'Language')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 91, N'Logs')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 92, N'Email')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 93, N'Database management')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 94, N'Volumes')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 95, N'Backup')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 96, N'Recovery password')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 97, N'Enter your email')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 98, N'Contact us')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 99, N'Message')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 100, N'Temp password')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 101, N'New password')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 102, N'Decors')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 103, N'Create decor')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 104, N'Type')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 105, N'Volume')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 106, N'Delete decor')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 107, N'Update decor')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 108, N'Lamps')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 109, N'Create lamp')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 110, N'Delete lamp')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 111, N'Update lamp')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 112, N'Lumen')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 113, N'Power')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 114, N'Socket')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 115, N'Plants')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 116, N'Create plant')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 117, N'Delete plant')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 118, N'Update plant')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 119, N'Is hydroponic')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 120, N'Is low light')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 121, N'Water pumps')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 122, N'Create water pump')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 123, N'Delete water pump')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 124, N'Update water pump')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 125, N'Flow rate')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 126, N'Fishes')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 127, N'Create fish')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 128, N'Delete fish')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 129, N'Update fish')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 130, N'Size')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 131, N'Temp')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 132, N'PH')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 133, N'Water required')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 134, N'Is lonely')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 135, N'Plants')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 136, N'Pots')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 137, N'Create pot')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 138, N'Delete pot')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 139, N'Update pot')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 140, N'RGB')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 141, N'Heigth')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 142, N'Length')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 143, N'Width')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 144, N'Weight')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 145, N'Rock')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 146, N'Predators')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 147, N'SpotLights')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 148, N'Create SpotLight')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 149, N'Delete SpotLight')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 150, N'Update SpotLight')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 151, N'Slots')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 152, N'Tanks')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 153, N'Create Tank')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 154, N'Delete Tank')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 155, N'Update Tank')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 156, N'Fishes')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 157, N'Decors')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 158, N'Water pump')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 159, N'Water temp')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 160, N'Groups')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 161, N'Lamp')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 162, N'Restore')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 163, N'Verify integrity')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 164, N'Name')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 165, N'Role Count')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 166, N'Created Date')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 167, N'Modified Date')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 168, N'Date format')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 169, N'Time zone')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 170, N'Is default')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 171, N'Key')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 172, N'Value')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 173, N'Last name')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 174, N'Username')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 175, N'Is locked')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 176, N'Ip')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 177, N'Message')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 178, N'Event')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 179, N'User')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 180, N'Email')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 181, N'Verify')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 182, N'Backup')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 183, N'Restore')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 184, N'Type')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 185, N'Volume')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 186, N'Lumen')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 187, N'Power')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 188, N'Socket')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 189, N'Is hydroponic')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 190, N'Is low light')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 191, N'Flow rate')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 192, N'Size')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 193, N'Temp')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 194, N'PH')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 195, N'Water required')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 196, N'Is lonely')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 197, N'Predators')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 198, N'Plants')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 199, N'RGB')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 200, N'Heigth')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 201, N'Length')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 202, N'Width')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 203, N'Weight')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 204, N'Rock')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 205, N'Slots')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 206, N'Lamp')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 207, N'Fishes')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 208, N'Decors')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 209, N'Water pump')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 210, N'Water temp')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 211, N'Cant')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 212, N'Is hydroponic')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 213, N'Is low light')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 214, N'Is lonely')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 0, N'Se ha producido un error inesperado. Inténtelo de nuevo más tarde.')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 1, N'No se han encontrado resultados.')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 2, N'El registro fue modificado por otro usuario. Inténtelo de nuevo más tarde')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 3, N'Elemento Ya existe. Inténtelo de nuevo más tarde')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 4, N'El elemento no se puede eliminar')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 5, N'El usuario o la contraseña son incorrectos.')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 6, N'El usuario está dañado. Inténtelo de nuevo más tarde')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 7, N'No se le permite iniciar sesión.')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 8, N'El usuario está bloqueado.')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 9, N'Error de integridad en la base de datos')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 10, N'No tiene permiossion para acceder a esta página.')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 11, N'La restauración se ha creado correctamente. Se le ha cerrado la sesión.')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 12, N'Integridad sin errores en la base de datos')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 13, N'La copia de seguridad se ha creado correctamente')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 14, N'Su mensaje fue enviado con éxito.')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 15, N'Cerrar sesión')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 16, N'Gestión del lenguaje')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 17, N'Back office')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 18, N'Administración de bases de datos')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 19, N'Registros')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 20, N'Gestión de permisos')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 21, N'Gestión de usuarios')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 22, N'Inventario')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 23, N'Gestión de tanques')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 24, N'Gestión de peces')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 25, N'Gestión de la decoración')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 26, N'Gestión de la bomba de agua')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 27, N'Gestión de la olla')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 28, N'Gestión de plantas')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 29, N'Gestión de Spotligth')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 30, N'Gestión de lámparas')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 31, N'Producto')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 32, N'Gestión de productos')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 33, N'Guijarro de arcilla')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 34, N'Esquisto ampliado')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 35, N'Growstone')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 36, N'Roca de lava')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 37, N'Rojo')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 38, N'Rosa')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 39, N'Naranja')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 40, N'Beige')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 41, N'Amarillo')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 42, N'Verde lima')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 43, N'Verde')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 44, N'Verde oscuro')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 45, N'Tarquoise')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 46, N'Azul pálido')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 47, N'Azul')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 48, N'Azul oscuro')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 49, N'Violeta')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 50, N'Púrpura')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 51, N'Iniciar sesión')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 52, N'contáctenos')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 53, N'Eliminar')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 54, N'actualizar')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 55, N'Generar contraseña')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 56, N'Desbloquear')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 57, N'Recuperación')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 58, N'copia de seguridad')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 59, N'Verificar')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 60, N'Generar contraseña')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 61, N'Contraseña de recuperación')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 62, N'Enviar')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 63, N'Restaurar')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 64, N'Canta en')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 65, N'Crear')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 66, N'Permisos')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 67, N'Crear permiso')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 68, N'Nombre')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 69, N'Obligatorio')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 70, N'Papeles')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 71, N'Permiso de eliminación')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 72, N'Nombre')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 73, N'Permisión de actualización')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 74, N'Preferencia del usuario')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 75, N'Actualizar preferencia de usuario')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 76, N'Formato de fecha')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 77, N'Zona horaria')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 78, N'Recursos')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 79, N'Eliminar preferencia de usuario')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 80, N'Crear preferencia de usuario')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 81, N'Usuarios')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 82, N'Crear usuario')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 83, N'Eliminar usuario')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 84, N'Actualizar usuario')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 85, N'Apellido')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 86, N'nombre de usuario')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 87, N'Permiso')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 88, N'Contraseña')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 89, N'Iniciar sesión')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 90, N'Idioma')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 91, N'Registros')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 92, N'Correo electrónico')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 93, N'Administración de bases de datos')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 94, N'Volúmenes')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 95, N'copia de seguridad')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 96, N'Contraseña de recuperación')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 97, N'Ingrese su correo electrónico')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 98, N'contáctenos')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 99, N'Mensaje')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 100, N'Contraseña temporal')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 101, N'Nueva contraseña')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 102, N'Decoraciones')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 103, N'Crear decoración')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 104, N'Tipo')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 105, N'Volumen')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 106, N'Eliminar decoración')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 107, N'Actualizar la decoración')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 108, N'Lámparas')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 109, N'Crear lámpara')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 110, N'Eliminar lámpara')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 111, N'Lámpara de actualización')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 112, N'Lumen')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 113, N'Poder')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 114, N'Zócalo')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 115, N'Plantas')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 116, N'Crear planta')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 117, N'Eliminar planta')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 118, N'Planta de actualización')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 119, N'Es hidropónico')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 120, N'Es poca luz')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 121, N'Bombas de agua')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 122, N'Crear bomba de agua')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 123, N'Eliminar bomba de agua')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 124, N'Actualizar bomba de agua')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 125, N'Caudal')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 126, N'Peces')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 127, N'Crear peces')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 128, N'Eliminar peces')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 129, N'Actualizar peces')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 130, N'Tamaño')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 131, N'Temp')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 132, N'Ph')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 133, N'Agua requerida')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 134, N'Se siente solo')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 135, N'Plantas')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 136, N'Ollas')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 137, N'Crear maceta')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 138, N'Eliminar bote')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 139, N'Actualizar la olla')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 140, N'Rgb')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 141, N'Altura')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 142, N'Longitud')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 143, N'Ancho')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 144, N'Peso')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 145, N'Roca')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 146, N'Depredadores')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 147, N'Focos')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 148, N'Crear SpotLight')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 149, N'Eliminar SpotLight')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 150, N'Actualizar SpotLight')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 151, N'Ranuras')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 152, N'Tanques')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 153, N'Crear tanque')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 154, N'Eliminar tanque')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 155, N'Actualizar tanque')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 156, N'Peces')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 157, N'Decoraciones')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 158, N'Bomba de agua')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 159, N'Temperatura del agua')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 160, N'Grupos')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 161, N'Lámpara')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 162, N'Restaurar')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 163, N'Verificar la integridad')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 164, N'Nombre')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 165, N'Recuento de roles')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 166, N'Fecha de creación')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 167, N'Fecha modificada')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 168, N'Formato de fecha')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 169, N'Zona horaria')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 170, N'Es por defecto')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 171, N'Clave')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 172, N'Valor')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 173, N'Apellido')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 174, N'nombre de usuario')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 175, N'Está bloqueado')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 176, N'Ip')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 177, N'Mensaje')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 178, N'Evento')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 179, N'Usuario')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 180, N'Correo electrónico')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 181, N'Verificar')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 182, N'copia de seguridad')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 183, N'Restaurar')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 184, N'Tipo')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 185, N'Volumen')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 186, N'Lumen')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 187, N'Poder')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 188, N'Zócalo')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 189, N'Es hidropónico')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 190, N'Es poca luz')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 191, N'Caudal')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 192, N'Tamaño')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 193, N'Temp')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 194, N'Ph')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 195, N'Agua requerida')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 196, N'Se siente solo')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 197, N'Depredadores')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 198, N'Plantas')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 199, N'Rgb')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 200, N'Altura')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 201, N'Longitud')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 202, N'Ancho')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 203, N'Peso')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 204, N'Roca')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 205, N'Ranuras')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 206, N'Lámpara')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 207, N'Peces')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 208, N'Decoraciones')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 209, N'Bomba de agua')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 210, N'Temperatura del agua')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 211, N'hipocresía')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 212, N'Es hidropónico')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 213, N'Es poca luz')
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 214, N'Se siente solo')
GO
SET IDENTITY_INSERT [dbo].[Resource] ON 

INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (0, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-1')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (1, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-2')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (2, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-3')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (3, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-4')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (4, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-5')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (5, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-6')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (6, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-7')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (7, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-8')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (8, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-9')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (9, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-10')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (10, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-11')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (11, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'102')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (12, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'103')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (13, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'101')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (14, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'104')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (15, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuLogout')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (16, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuLanguageManagemenet')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (17, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuBackOffice')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (18, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuDatabaseManagement')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (19, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuLogs')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (20, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuPermissionManager')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (21, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuUserManagement')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (22, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuInventory')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (23, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuTankManagement')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (24, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuFishManagement')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (25, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuDecorManagement')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (26, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuWaterPumpManagement')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (27, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuPotManagement')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (28, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuPlantManagement')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (29, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuSpotLightManagement')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (30, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuLampManagement')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (31, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuProduct')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (32, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuProductManagement')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (33, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'ClayPebble')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (34, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'ExpandedShale')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (35, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Growstone')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (36, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LavaRock')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (37, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Red')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (38, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Pink')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (39, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Orange')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (40, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Beige')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (41, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Yellow')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (42, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LimeGreen')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (43, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Green')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (44, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'DarkGreen')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (45, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Tarquoise')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (46, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'PaleBlue')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (47, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Blue')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (48, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'DarkBlue')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (49, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Violet')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (50, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Purple')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (51, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuLogin')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (52, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuContacUs')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (53, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnDelete')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (54, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnUpdate')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (55, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnGeneratePassowrd')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (56, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnUnlock')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (57, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnRecovery')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (58, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnBackup')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (59, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnVerify')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (60, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnGeneratePassword')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (61, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnRecoveryPassword')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (62, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnSend')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (63, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnRestore')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (64, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnSignIn')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (65, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnCreate')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (66, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPermisionTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (67, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreatePermissionTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (68, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblName')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (69, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblRequired')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (70, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblRoles')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (71, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeletePermissionTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (72, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblGroupName')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (73, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdatePermisionTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (74, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUserPreferenceTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (75, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdateUserPreferenceTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (76, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDateFormat')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (77, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblTimeZone')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (78, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblResources')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (79, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeleteUserPreferenceTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (80, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreateUserPreferenceTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (81, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUserTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (82, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreateUserTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (83, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeleteUserTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (84, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdateUserTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (85, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblLastName')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (86, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUsername')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (87, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPermission')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (88, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPassword')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (89, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblLoginTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (90, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblLanguage')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (91, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblLogsTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (92, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblEmail')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (93, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDatabaseTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (94, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblVolumes')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (95, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblBackup')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (96, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblRecoveryPasswordTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (97, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblEnterEmail')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (98, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblContactUsTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (99, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblMessage')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (100, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblTempPassword')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (101, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblNewPassword')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (102, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDecorTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (103, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreateDecorTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (104, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblType')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (105, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblVolume')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (106, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeleteDecorTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (107, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdateDecorTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (108, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblLampTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (109, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreateLampTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (110, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeleteLampTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (111, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdateLampTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (112, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblLumen')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (113, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPower')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (114, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblSocket')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (115, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPlantTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (116, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreatePlantTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (117, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeletePlantTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (118, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdatePlantTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (119, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblIsHydroponic')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (120, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblIsLowLight')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (121, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblWaterPumpTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (122, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreateWaterPumpTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (123, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeleteWaterPumpTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (124, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdateWaterPumpTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (125, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblFlowRate')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (126, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblFishTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (127, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreateFishTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (128, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeleteFishTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (129, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdateFishTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (130, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblSize')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (131, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblTemp')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (132, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPh')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (133, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblWaterRequired')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (134, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblIsLonely')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (135, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPlants')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (136, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPotTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (137, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreatePotTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (138, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeletePotTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (139, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdatePotTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (140, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblRgb')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (141, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblHeigth')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (142, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblLength')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (143, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblWidth')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (144, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblWeight')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (145, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblRock')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (146, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPredators')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (147, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblSpotLightTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (148, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreateSpotLightTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (149, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeleteSpotLightTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (150, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdateSpotLightTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (151, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblSlots')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (152, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblTankTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (153, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreateTankTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (154, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeleteTankTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (155, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdateTankTitle')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (156, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblFishes')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (157, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDecors')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (158, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblWaterPump')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (159, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblWaterTemp')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (160, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblGroups')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (161, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblLamp')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (162, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblRestore')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (163, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblVerifyIntegrity')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (164, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlName')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (165, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlRoleCount')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (166, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlCreateDate')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (167, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlModifiedDate')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (168, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlDateFormat')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (169, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTimeZone')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (170, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlIsDefault')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (171, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlKey')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (172, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlValue')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (173, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlLastName')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (174, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlUsername')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (175, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlIsLocked')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (176, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlIp')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (177, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlMessage')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (178, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlEvent')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (179, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlUser')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (180, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlEmail')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (181, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlVerify')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (182, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlBackup')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (183, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlRestore')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (184, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlType')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (185, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlVolume')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (186, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlLumen')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (187, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlPower')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (188, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlSocket')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (189, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlIsHydroponic')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (190, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlIsLowLight')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (191, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlFlowRate')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (192, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlSize')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (193, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTemp')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (194, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlPh')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (195, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlWaterRequired')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (196, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlIsLonely')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (197, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlPredators')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (198, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlPlants')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (199, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlRgb')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (200, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlHeigth')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (201, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlLength')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (202, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlWidth')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (203, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlWeight')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (204, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlRock')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (205, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlSlots')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (206, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlLamp')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (207, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlFishes')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (208, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlDecors')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (209, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlWaterPump')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (210, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlWaterTemp')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (211, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlCant')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (212, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'CbxIsHydroponic')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (213, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'CbxIsLowLight')
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (214, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'CbxIsLonely')
SET IDENTITY_INSERT [dbo].[Resource] OFF
GO
SET IDENTITY_INSERT [dbo].[Rock] ON 

INSERT [dbo].[Rock] ([RockId], [Name]) VALUES (1, N'ClayPebble')
INSERT [dbo].[Rock] ([RockId], [Name]) VALUES (2, N'ExpandedShale')
INSERT [dbo].[Rock] ([RockId], [Name]) VALUES (3, N'Growstone')
INSERT [dbo].[Rock] ([RockId], [Name]) VALUES (4, N'LavaRock')
SET IDENTITY_INSERT [dbo].[Rock] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (1, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Login')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (2, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Read user')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (3, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Create user')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (4, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Update user')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (5, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Delete user')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (6, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Generate password')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (7, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Recovery user')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (8, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Log')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (9, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Read permission')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (10, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Create permission')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (11, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Update permission')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (12, CAST(N'2020-08-17T13:33:19.6800000' AS DateTime2), CAST(N'2020-08-17T13:33:19.6800000' AS DateTime2), N'Delete permission')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (13, CAST(N'2020-09-05T18:39:40.5000000' AS DateTime2), CAST(N'2020-09-15T21:29:23.6533333' AS DateTime2), N'Db integrity')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (14, CAST(N'2020-09-07T21:52:10.4333333' AS DateTime2), CAST(N'2020-09-07T21:52:10.4333333' AS DateTime2), N'Db reset integrity')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (15, CAST(N'2020-09-15T21:09:51.5800000' AS DateTime2), CAST(N'2020-09-15T21:09:51.5800000' AS DateTime2), N'Backup')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (16, CAST(N'2020-09-15T21:09:54.3366667' AS DateTime2), CAST(N'2020-09-15T21:09:54.3366667' AS DateTime2), N'Restore')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (17, CAST(N'2020-09-15T21:09:57.6800000' AS DateTime2), CAST(N'2020-09-15T21:09:57.6800000' AS DateTime2), N'Read language')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (18, CAST(N'2020-09-15T21:10:01.2233333' AS DateTime2), CAST(N'2020-09-15T21:10:01.2233333' AS DateTime2), N'Create language')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (19, CAST(N'2020-09-15T21:10:04.3900000' AS DateTime2), CAST(N'2020-09-15T21:10:04.3900000' AS DateTime2), N'Update language')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (20, CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), N'Delete language')
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (101, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'All user')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Socket] ON 

INSERT [dbo].[Socket] ([SocketId], [Name]) VALUES (1, N'E14')
INSERT [dbo].[Socket] ([SocketId], [Name]) VALUES (2, N'E26')
INSERT [dbo].[Socket] ([SocketId], [Name]) VALUES (3, N'E27')
INSERT [dbo].[Socket] ([SocketId], [Name]) VALUES (4, N'GU10')
INSERT [dbo].[Socket] ([SocketId], [Name]) VALUES (5, N'GU53')
SET IDENTITY_INSERT [dbo].[Socket] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (1, CAST(N'2020-09-22T22:55:19.7800000' AS DateTime2), CAST(N'2020-11-12T19:24:50.5600000' AS DateTime2), 9, 0, N'Admin', N'Admin', N'7cb6bbb8de205df7a14365c5346f6bf6', N'VhhiD6mVRpMZtV0htt1UvQ==', 0, 1, NULL, 0, N'Tgo+3MKRaAOzPe4gEvWMXGV58nm+cOH/kFaYvd3yLrg=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (2, CAST(N'2020-10-01T22:38:54.2466667' AS DateTime2), CAST(N'2020-11-08T22:27:22.0066667' AS DateTime2), 2, 0, N'Lucas', N'Luna', N'7cb6bbb8de205df7a14365c5346f6bf6', N'lAoj7A7SjxQcVJz+XZ6wKA==', 0, 1, N'', 0, N'1ruUF264+YkxPc13zW2UcZ37IXBRboCIFSMTZiUHCoE=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (3, CAST(N'2020-11-08T18:48:33.4000000' AS DateTime2), CAST(N'2020-11-08T18:48:33.4000000' AS DateTime2), 8, 0, N'Tony', N'Stark', N'7cb6bbb8de205df7a14365c5346f6bf6', N'5w7e6N321AcU5mnot7EUbw==', 0, 1, NULL, 0, N'JNMNZsNAj3P+zAqd24MUT0nMPVpjx6frEieRmL3HKeU=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (4, CAST(N'2020-11-08T18:48:42.5433333' AS DateTime2), CAST(N'2020-11-08T18:48:42.5433333' AS DateTime2), 3, 0, N'Bruce', N'Wayne', N'7cb6bbb8de205df7a14365c5346f6bf6', N'pErqYJLp4v/K875kiK4R9w==', 0, 1, NULL, 0, N'k/Z/T0JAL0i46K1HKFQ1n+Gm+GNxB2R29tPYd77IP1c=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (5, CAST(N'2020-11-08T18:48:45.7000000' AS DateTime2), CAST(N'2020-11-08T18:48:45.7000000' AS DateTime2), 8, 0, N'Bruce', N'Banner', N'7cb6bbb8de205df7a14365c5346f6bf6', N'/41JicvZQa5kKjkCtxjn4g==', 0, 1, NULL, 0, N'EQQwhHV0a+RUXsIP71il3QzOPf6uaUNKasryeHT06jA=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (6, CAST(N'2020-11-08T18:48:48.4166667' AS DateTime2), CAST(N'2020-11-08T18:48:48.4166667' AS DateTime2), 8, 0, N'Peter', N'Parker', N'7cb6bbb8de205df7a14365c5346f6bf6', N'NV8bUZewNo5UbtUMmyEmJA==', 0, 1, NULL, 0, N'IvOEmefodxdKxyR4o8rfnREUyenTAbHwTx19U6Ng9A4=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (7, CAST(N'2020-11-08T18:48:51.6200000' AS DateTime2), CAST(N'2020-11-08T18:48:51.6200000' AS DateTime2), 9, 0, N'Barry', N'Allen', N'7cb6bbb8de205df7a14365c5346f6bf6', N'DXaK01QOjscMSTXwyfAmAg==', 0, 1, NULL, 0, N'pl/K8s6gbHx/1BEqUt+aC12UF+1MUCP/h3+I7mivkjA=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (8, CAST(N'2020-11-08T18:48:54.4733333' AS DateTime2), CAST(N'2020-11-08T18:48:54.4733333' AS DateTime2), 2, 0, N'Steve', N'Rogers', N'7cb6bbb8de205df7a14365c5346f6bf6', N'b2qjNY7Wp2SEVDNG5Owc/g==', 0, 1, NULL, 0, N'ecBKZp0ap+c8V8p20rjUVaCaPXgLTTlPSyh8Ilotov4=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (9, CAST(N'2020-11-08T18:48:57.1266667' AS DateTime2), CAST(N'2020-11-08T18:48:57.1266667' AS DateTime2), 6, 0, N'T''', N'Challa', N'7cb6bbb8de205df7a14365c5346f6bf6', N'sodKdiVB+jtbRkP8AM0OjQ==', 0, 1, NULL, 0, N'rnXO5N0Ry2r8FXmxaHcJul5Oo9Je53A7trQRc+rAqLo=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (10, CAST(N'2020-11-08T18:48:59.8666667' AS DateTime2), CAST(N'2020-11-08T18:48:59.8666667' AS DateTime2), 9, 0, N'Natasha', N'Romanoff', N'7cb6bbb8de205df7a14365c5346f6bf6', N'jSai3bLFVR4msZTtcUFKDQ==', 0, 1, NULL, 0, N'lzEK4KBTyP62jupC/3N/5cClbfF8qDKToZwIQQVkadk=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (11, CAST(N'2020-11-08T18:49:02.7233333' AS DateTime2), CAST(N'2020-11-08T18:49:02.7233333' AS DateTime2), 4, 0, N'Clark', N'Kent', N'7cb6bbb8de205df7a14365c5346f6bf6', N'y3VcUMXh6CsFcjX1QhODow==', 0, 1, NULL, 0, N'f/evqQtRjA1y1H4Y5iyzWuxYldaYPbHVh8DhqdSwUHU=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (12, CAST(N'2020-11-08T18:49:05.4300000' AS DateTime2), CAST(N'2020-11-08T18:49:05.4300000' AS DateTime2), 6, 0, N'Charles', N'Xavier', N'7cb6bbb8de205df7a14365c5346f6bf6', N'yiO/l28k4qx+RhRy2nxQ9w==', 0, 1, NULL, 0, N'oh6z1Fv2RPMS7Ge/e0vsggNZouAQZt2p0Q2HFfWIoDU=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (13, CAST(N'2020-11-08T18:49:08.0966667' AS DateTime2), CAST(N'2020-11-08T18:49:08.0966667' AS DateTime2), 5, 0, N'Diana', N'Prince', N'7cb6bbb8de205df7a14365c5346f6bf6', N'AjL4wnHPO6Eqay8uYUCd8Q==', 0, 1, NULL, 0, N'WYzOLLUXCz4p3NqNof93Y+Q59Ntwv4bNqyWowdgr9+A=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (14, CAST(N'2020-11-08T18:49:10.7466667' AS DateTime2), CAST(N'2020-11-08T18:49:10.7466667' AS DateTime2), 9, 0, N'Hal', N'Jordan', N'7cb6bbb8de205df7a14365c5346f6bf6', N'H3oGrWQU+5pkGm0Hpqc3cQ==', 0, 1, NULL, 0, N'gzD3QBRo8kpbQdNFOq+3HXy4zh538ksuvOubDXswXs0=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (15, CAST(N'2020-11-08T18:49:13.4300000' AS DateTime2), CAST(N'2020-11-08T18:49:13.4300000' AS DateTime2), 4, 0, N'Peter', N'Quill', N'7cb6bbb8de205df7a14365c5346f6bf6', N'4CvNKkPLmk4CXFKjEopqEA==', 0, 1, NULL, 0, N'7vi4tVWyLHkgKqdDpldX9R9Q9KTYcvMjPLwC87mWXCU=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (16, CAST(N'2020-11-08T18:49:16.1900000' AS DateTime2), CAST(N'2020-11-08T18:49:16.1900000' AS DateTime2), 18, 0, N'Kara', N'Danvers', N'7cb6bbb8de205df7a14365c5346f6bf6', N'Vg8eXVT05f8E/gfzoGqvOA==', 0, 1, NULL, 0, N'CzzgePcWXmaZNVqSbEMDks2MQFpuy1pOlh1QbS3VHdM=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (17, CAST(N'2020-11-08T18:49:18.8600000' AS DateTime2), CAST(N'2020-11-08T18:49:18.8600000' AS DateTime2), 6, 0, N'Clint', N'Barton', N'7cb6bbb8de205df7a14365c5346f6bf6', N'g6qpHhUrM+JUXiF1pl+18w==', 0, 1, NULL, 0, N'HHeBUL1zzkCipCZdr2fg000NOjf7sSN/PJIN9Br6jXs=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (18, CAST(N'2020-11-08T18:49:21.5766667' AS DateTime2), CAST(N'2020-11-08T18:49:21.5766667' AS DateTime2), 7, 0, N'Wade', N'Wilson', N'7cb6bbb8de205df7a14365c5346f6bf6', N'r4ubtLus2f0g7XJOL3tCAA==', 0, 1, NULL, 0, N'6bxiSJwZWNuDIyQ4iq/xagzFp30BL06AsIgV+sOIMhQ=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (19, CAST(N'2020-11-08T18:50:58.1033333' AS DateTime2), CAST(N'2020-11-08T18:50:58.1033333' AS DateTime2), 6, 0, N'Selina', N'Kyle', N'7cb6bbb8de205df7a14365c5346f6bf6', N'/LuMsO7IgoT6dgNmlhKucw==', 0, 1, NULL, 0, N'dVw/EVKMilLcBeHw0XJINZltLsx08BPoGSSpCH9Qxzs=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (20, CAST(N'2020-11-08T18:51:01.0833333' AS DateTime2), CAST(N'2020-11-08T18:51:01.0833333' AS DateTime2), 6, 0, N'Oliver', N'Queen', N'7cb6bbb8de205df7a14365c5346f6bf6', N'TJEBFDdLkhwKdVgTxybf+Q==', 0, 1, NULL, 0, N'CdD/cDMh2DbHp9Kfp4SY2ZjiI+5kp0Picz85jMmOOWc=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (21, CAST(N'2020-11-08T18:51:03.8266667' AS DateTime2), CAST(N'2020-11-08T18:51:03.8266667' AS DateTime2), 9, 0, N'Matthew', N'Murdock', N'7cb6bbb8de205df7a14365c5346f6bf6', N'xzpPYU1vyahkqtJSJeXbGQ==', 0, 1, NULL, 0, N'xRHSqF5g/998dYW+aQd1cHOQqQUUcr6k6KFSvJm4m9M=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (22, CAST(N'2020-11-08T18:51:06.4233333' AS DateTime2), CAST(N'2020-11-08T18:51:06.4233333' AS DateTime2), 1, 0, N'Hank', N'Pym', N'7cb6bbb8de205df7a14365c5346f6bf6', N'mgYEqEFPKRMBUrr+NwSX7A==', 0, 1, NULL, 0, N'HkpIK/zJOPk+yYW50Q2/hg1qxJY/mfk2oKCpD6qoyJQ=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (23, CAST(N'2020-11-08T18:51:09.1933333' AS DateTime2), CAST(N'2020-11-08T18:51:09.1933333' AS DateTime2), 8, 0, N'Barbara', N'Gordon', N'7cb6bbb8de205df7a14365c5346f6bf6', N'1CDN03H9YEZpRWVsQMCzmQ==', 0, 1, NULL, 0, N'OiwhK2gnZ0GPxLgAcYEX7NYkPdV80CCWxbfS9J+SH0k=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (24, CAST(N'2020-11-08T18:51:11.8933333' AS DateTime2), CAST(N'2020-11-08T18:51:11.8933333' AS DateTime2), 10, 0, N'Scott', N'Summers', N'7cb6bbb8de205df7a14365c5346f6bf6', N'dmOvCRJy6mL04yuR990j5A==', 0, 1, NULL, 0, N'LSvQQn5Q9Tjix92Kps+SqXtTBh+Bv8xqLZD0Xfno4hc=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (25, CAST(N'2020-11-08T18:51:15.2333333' AS DateTime2), CAST(N'2020-11-08T18:51:15.2333333' AS DateTime2), 6, 0, N'Arthur', N'Curry', N'7cb6bbb8de205df7a14365c5346f6bf6', N'JKIIcP6Uy/CFMBRlosHVDA==', 0, 1, NULL, 0, N'GPQNZcKpV+pe1/j8ab0N16R84S1zQDHb5IULt0HjsF8=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (26, CAST(N'2020-11-08T18:51:17.9366667' AS DateTime2), CAST(N'2020-11-08T18:51:17.9366667' AS DateTime2), 5, 0, N'Jean', N'Grey', N'7cb6bbb8de205df7a14365c5346f6bf6', N'i5iHl+/MKW+B0lfVA2s+sw==', 0, 1, NULL, 0, N'osxcAMc6eMXlh9SQSeE9+5UsplPwjeKcHnPClgSCcdU=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (27, CAST(N'2020-11-08T18:51:20.5666667' AS DateTime2), CAST(N'2020-11-08T18:51:20.5666667' AS DateTime2), 9, 0, N'Sam', N'Wilson', N'7cb6bbb8de205df7a14365c5346f6bf6', N'xRzv+tqFXOaKbTo9fjqT5g==', 0, 1, NULL, 0, N'z4uRWFf3YbpjIvFj70GFRIJ2SqRTkPZlrRqUqJAfZAc=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (28, CAST(N'2020-11-08T18:51:23.2700000' AS DateTime2), CAST(N'2020-11-08T18:51:23.2700000' AS DateTime2), 2, 0, N'Frank', N'Castle', N'7cb6bbb8de205df7a14365c5346f6bf6', N'42DYmuLCmvrwgT5POXHlXg==', 0, 1, NULL, 0, N'/yM/ybYVkZfC/cDbWDY2Ik38XLokBW7cVa9SOgdUgG4=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (29, CAST(N'2020-11-08T18:51:26.4333333' AS DateTime2), CAST(N'2020-11-08T18:51:26.4333333' AS DateTime2), 7, 0, N'Johnny', N'Blaze', N'7cb6bbb8de205df7a14365c5346f6bf6', N'qEhsRAAZ5pRhQ7MagKI6Pw==', 0, 1, NULL, 0, N'JOlchkOW49Sg3d1pTu2W97yh5oEA1ua3TEWGjxY5OnU=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (30, CAST(N'2020-11-08T18:51:29.1900000' AS DateTime2), CAST(N'2020-11-08T18:51:29.1900000' AS DateTime2), 7, 0, N'Damian', N'Wayne', N'7cb6bbb8de205df7a14365c5346f6bf6', N'tkJ+5WOkIsfjQWC7Uo794g==', 0, 1, NULL, 0, N'XU3/gAiTi4V+BeT2Ued3FXIYe+P8FL2pUd+pRlWUuaQ=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (31, CAST(N'2020-11-08T18:51:31.8800000' AS DateTime2), CAST(N'2020-11-08T18:51:31.8800000' AS DateTime2), 6, 0, N'James', N'Barnes', N'7cb6bbb8de205df7a14365c5346f6bf6', N'hLX80CF+KA7xkbg0aGj/fw==', 0, 1, NULL, 0, N'jZ3pwbnSDvXJSLRNo+3E1ZlD2j67xudxauQiixIKWXY=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (32, CAST(N'2020-11-08T18:51:35.0300000' AS DateTime2), CAST(N'2020-11-08T18:51:35.0300000' AS DateTime2), 7, 0, N'Jason', N'Todd', N'7cb6bbb8de205df7a14365c5346f6bf6', N'SRFme/UvIcnF6xxrGCSoJg==', 0, 1, NULL, 0, N'JeAlJ2sRAHqvRTwSGLnq9JRdRbZCdKEAzJi6dSJVPfk=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (33, CAST(N'2020-11-08T18:51:37.7000000' AS DateTime2), CAST(N'2020-11-08T18:51:37.7000000' AS DateTime2), 6, 0, N'James', N'Howlett', N'7cb6bbb8de205df7a14365c5346f6bf6', N'UazAMimYwZB/sJUiZbO8eQ==', 0, 1, NULL, 0, N'xpa1aZ6q9nriraHVQvywCvrEgGaKN12FwvxhF85jHDg=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (34, CAST(N'2020-11-08T18:51:40.5200000' AS DateTime2), CAST(N'2020-11-08T18:51:40.5200000' AS DateTime2), 19, 0, N'Billy', N'Batson', N'7cb6bbb8de205df7a14365c5346f6bf6', N'w3vgDassEJ1coLkJTe9H2A==', 0, 1, NULL, 0, N'0TTLTRVyNcXxlKkEeT0QDEazQA7sIYoosVUhEknuxDo=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (35, CAST(N'2020-11-08T18:51:43.3366667' AS DateTime2), CAST(N'2020-11-08T18:51:43.3366667' AS DateTime2), 1, 0, N'Dinah', N'Lance', N'7cb6bbb8de205df7a14365c5346f6bf6', N'ZPo6PQAlva73FUOGMdVZgw==', 0, 1, NULL, 0, N'FvehMy2lNpN14JEjAqe+2DRiByrP3WnBMO27qcw5LqY=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (36, CAST(N'2020-11-08T18:51:46.0633333' AS DateTime2), CAST(N'2020-11-08T18:51:46.0633333' AS DateTime2), 10, 0, N'Victor', N'Stone', N'7cb6bbb8de205df7a14365c5346f6bf6', N'dfcKaARbWLWCWOSz9QzJgg==', 0, 1, NULL, 0, N'CXT/tB+WGXjmv3lgtck/EQKBGf82FQ2eGovIRxPRC6M=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (37, CAST(N'2020-11-08T18:51:48.8233333' AS DateTime2), CAST(N'2020-11-08T18:51:48.8233333' AS DateTime2), 1, 0, N'Remy', N'LeBeau', N'7cb6bbb8de205df7a14365c5346f6bf6', N'hUJNub3+hrdTOZ+mOVCgAg==', 0, 1, NULL, 0, N'zENgvdlPlW3LFr1IEr3ST+IEMjy2sNN/LXnM5Cj8N4k=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (38, CAST(N'2020-11-08T18:51:51.5766667' AS DateTime2), CAST(N'2020-11-08T18:51:51.5766667' AS DateTime2), 9, 0, N'Piotr', N'Rasputin', N'7cb6bbb8de205df7a14365c5346f6bf6', N'JX5qzSSwE8lHXqpfwfb6BA==', 0, 1, NULL, 0, N'WcGMuD1UABSdi0jyvaIvuVlGcC362YtdxSttAbPigtM=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (39, CAST(N'2020-11-08T18:51:54.3100000' AS DateTime2), CAST(N'2020-11-08T18:51:54.3100000' AS DateTime2), 4, 0, N'Daniel', N'Rand', N'7cb6bbb8de205df7a14365c5346f6bf6', N'aLibe3pZmBA3QcTzQftZ8Q==', 0, 1, NULL, 0, N'mjqJ4Ri7nQQyo9I+CisOuDdck42YTikO2M1bV8BkcpI=')
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (40, CAST(N'2020-11-08T18:51:56.9600000' AS DateTime2), CAST(N'2020-11-08T18:51:56.9600000' AS DateTime2), 3, 0, N'Rachel', N'Roth', N'7cb6bbb8de205df7a14365c5346f6bf6', N'FvOl6aoqW2HAgIVxVvz3jQ==', 0, 1, NULL, 0, N'aLABpc1CaaJ+1UzKZVqiQt08Ac07IHsX3Y9NAC60Zwc=')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserPreference] ON 

INSERT [dbo].[UserPreference] ([UserPreferenceId], [CreatedDate], [ModifiedDate], [DateFormat], [IsDefault], [Name], [TimeZone]) VALUES (1, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-09-23T20:07:58.8033333' AS DateTime2), N'MM/dd/yyyy', 1, N'English', N'hh:mm:ss')
INSERT [dbo].[UserPreference] ([UserPreferenceId], [CreatedDate], [ModifiedDate], [DateFormat], [IsDefault], [Name], [TimeZone]) VALUES (2, CAST(N'2020-09-11T21:27:14.9000000' AS DateTime2), CAST(N'2020-11-12T19:32:52.5766667' AS DateTime2), N'dd/MM/yyyy', 0, N'Spanish', N'hh:mm:ss')
SET IDENTITY_INSERT [dbo].[UserPreference] OFF
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 2)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 4)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 5)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 6)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 7)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 8)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 9)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 10)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 11)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 12)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 13)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 14)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 15)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 16)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 17)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 18)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 19)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 20)
GO
SET IDENTITY_INSERT [dbo].[WaterPump] ON 

INSERT [dbo].[WaterPump] ([WaterPumpId], [CreatedDate], [ModifiedDate], [FlowRate], [Power], [Volume], [Name]) VALUES (1, CAST(N'2020-11-07T19:57:24.5233333' AS DateTime2), CAST(N'2020-11-07T19:57:24.5233333' AS DateTime2), 200, 2, CAST(64.00 AS Decimal(18, 2)), N'BL109')
INSERT [dbo].[WaterPump] ([WaterPumpId], [CreatedDate], [ModifiedDate], [FlowRate], [Power], [Volume], [Name]) VALUES (2, CAST(N'2020-11-07T20:00:59.7466667' AS DateTime2), CAST(N'2020-11-07T20:00:59.7466667' AS DateTime2), 300, 3, CAST(60.75 AS Decimal(18, 2)), N'Atman 301')
INSERT [dbo].[WaterPump] ([WaterPumpId], [CreatedDate], [ModifiedDate], [FlowRate], [Power], [Volume], [Name]) VALUES (3, CAST(N'2020-11-07T20:01:37.4133333' AS DateTime2), CAST(N'2020-11-07T20:01:37.4133333' AS DateTime2), 820, 18, CAST(537.60 AS Decimal(18, 2)), N'RS Electrical 932')
SET IDENTITY_INSERT [dbo].[WaterPump] OFF
GO
ALTER TABLE [dbo].[Fish]  WITH CHECK ADD  CONSTRAINT [FK_Fish_Ph] FOREIGN KEY([PhId])
REFERENCES [dbo].[Ph] ([PhId])
GO
ALTER TABLE [dbo].[Fish] CHECK CONSTRAINT [FK_Fish_Ph]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_RoleChild] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_RoleChild]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_RoleParent] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_RoleParent]
GO
ALTER TABLE [dbo].[Lamp]  WITH CHECK ADD  CONSTRAINT [FK_Lamp_Socket] FOREIGN KEY([SocketId])
REFERENCES [dbo].[Socket] ([SocketId])
GO
ALTER TABLE [dbo].[Lamp] CHECK CONSTRAINT [FK_Lamp_Socket]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([EventId])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_Event]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_User_UserId]
GO
ALTER TABLE [dbo].[Pot]  WITH CHECK ADD  CONSTRAINT [FK_Pot_Rock] FOREIGN KEY([RockId])
REFERENCES [dbo].[Rock] ([RockId])
GO
ALTER TABLE [dbo].[Pot] CHECK CONSTRAINT [FK_Pot_Rock]
GO
ALTER TABLE [dbo].[PotPlant]  WITH CHECK ADD  CONSTRAINT [FK_PotPlant_Plant] FOREIGN KEY([PlantId])
REFERENCES [dbo].[Plant] ([PlantId])
GO
ALTER TABLE [dbo].[PotPlant] CHECK CONSTRAINT [FK_PotPlant_Plant]
GO
ALTER TABLE [dbo].[PotPlant]  WITH CHECK ADD  CONSTRAINT [FK_PotPlant_Pot] FOREIGN KEY([PotId])
REFERENCES [dbo].[Pot] ([PotId])
GO
ALTER TABLE [dbo].[PotPlant] CHECK CONSTRAINT [FK_PotPlant_Pot]
GO
ALTER TABLE [dbo].[Predator]  WITH CHECK ADD  CONSTRAINT [FK_Predator_Fish] FOREIGN KEY([PredatorId])
REFERENCES [dbo].[Fish] ([FishId])
GO
ALTER TABLE [dbo].[Predator] CHECK CONSTRAINT [FK_Predator_Fish]
GO
ALTER TABLE [dbo].[Predator]  WITH CHECK ADD  CONSTRAINT [FK_Predator_Fish1] FOREIGN KEY([FishId])
REFERENCES [dbo].[Fish] ([FishId])
GO
ALTER TABLE [dbo].[Predator] CHECK CONSTRAINT [FK_Predator_Fish1]
GO
ALTER TABLE [dbo].[PreferenceResource]  WITH CHECK ADD  CONSTRAINT [FK_PreferenceResource_Resource] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([ResourceId])
GO
ALTER TABLE [dbo].[PreferenceResource] CHECK CONSTRAINT [FK_PreferenceResource_Resource]
GO
ALTER TABLE [dbo].[PreferenceResource]  WITH CHECK ADD  CONSTRAINT [FK_PreferenceResource_UserPreference] FOREIGN KEY([UserPreferenceId])
REFERENCES [dbo].[UserPreference] ([UserPreferenceId])
GO
ALTER TABLE [dbo].[PreferenceResource] CHECK CONSTRAINT [FK_PreferenceResource_UserPreference]
GO
ALTER TABLE [dbo].[SpotLight]  WITH CHECK ADD  CONSTRAINT [FK_SpotLight_Socket] FOREIGN KEY([SocketId])
REFERENCES [dbo].[Socket] ([SocketId])
GO
ALTER TABLE [dbo].[SpotLight] CHECK CONSTRAINT [FK_SpotLight_Socket]
GO
ALTER TABLE [dbo].[SpotLightLamp]  WITH CHECK ADD  CONSTRAINT [FK_SpotLightLamp_Lamp] FOREIGN KEY([LampId])
REFERENCES [dbo].[Lamp] ([LampId])
GO
ALTER TABLE [dbo].[SpotLightLamp] CHECK CONSTRAINT [FK_SpotLightLamp_Lamp]
GO
ALTER TABLE [dbo].[SpotLightLamp]  WITH CHECK ADD  CONSTRAINT [FK_SpotLightLamp_SpotLight] FOREIGN KEY([SpotLightId])
REFERENCES [dbo].[SpotLight] ([SpotLightId])
GO
ALTER TABLE [dbo].[SpotLightLamp] CHECK CONSTRAINT [FK_SpotLightLamp_SpotLight]
GO
ALTER TABLE [dbo].[Tank]  WITH CHECK ADD  CONSTRAINT [FK_Tank_Ph] FOREIGN KEY([PhId])
REFERENCES [dbo].[Ph] ([PhId])
GO
ALTER TABLE [dbo].[Tank] CHECK CONSTRAINT [FK_Tank_Ph]
GO
ALTER TABLE [dbo].[Tank]  WITH CHECK ADD  CONSTRAINT [FK_Tank_WaterPump] FOREIGN KEY([WaterPumpId])
REFERENCES [dbo].[WaterPump] ([WaterPumpId])
GO
ALTER TABLE [dbo].[Tank] CHECK CONSTRAINT [FK_Tank_WaterPump]
GO
ALTER TABLE [dbo].[TankDecor]  WITH CHECK ADD  CONSTRAINT [FK_TankDecor_Decor] FOREIGN KEY([DecorId])
REFERENCES [dbo].[Decor] ([DecorId])
GO
ALTER TABLE [dbo].[TankDecor] CHECK CONSTRAINT [FK_TankDecor_Decor]
GO
ALTER TABLE [dbo].[TankDecor]  WITH CHECK ADD  CONSTRAINT [FK_TankDecor_Tank] FOREIGN KEY([TankId])
REFERENCES [dbo].[Tank] ([TankId])
GO
ALTER TABLE [dbo].[TankDecor] CHECK CONSTRAINT [FK_TankDecor_Tank]
GO
ALTER TABLE [dbo].[TankFish]  WITH CHECK ADD  CONSTRAINT [FK_TankFish_Fish] FOREIGN KEY([FishId])
REFERENCES [dbo].[Fish] ([FishId])
GO
ALTER TABLE [dbo].[TankFish] CHECK CONSTRAINT [FK_TankFish_Fish]
GO
ALTER TABLE [dbo].[TankFish]  WITH CHECK ADD  CONSTRAINT [FK_TankFish_Tank] FOREIGN KEY([TankId])
REFERENCES [dbo].[Tank] ([TankId])
GO
ALTER TABLE [dbo].[TankFish] CHECK CONSTRAINT [FK_TankFish_Tank]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserPreference_PreferenceId] FOREIGN KEY([UserPreferenceId])
REFERENCES [dbo].[UserPreference] ([UserPreferenceId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserPreference_PreferenceId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
/****** Object:  StoredProcedure [dbo].[USP_Backup]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_Backup]
    (
    @Disk           NVARCHAR(MAX)
)
AS

SET NOCOUNT ON;

DECLARE @Command NVARCHAR(MAX)

PRINT @Disk

SET @Command= 'BACKUP DATABASE [SmartAquaponic] TO ' + @Disk + ' WITH NOFORMAT, NOINIT, SKIP, NOREWIND, NOUNLOAD,  STATS = 10'

PRINT @Command

EXEC (@Command)

SELECT 101
GO
/****** Object:  StoredProcedure [dbo].[USP_ChecksumLog]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_ChecksumLog]
    (
    @LogId                  INT,
    @Hash                   INT,
    @Table                  NVARCHAR(MAX)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION

/******************* Update *******************/
UPDATE [dbo].[Log]
SET [Hash] = @Hash 
WHERE [LogId] = @LogId

IF EXISTS 
(SELECT 1
FROM [dbo].[Checksum] c
WHERE c.[Table] = @Table)
BEGIN
    /******************* Update *******************/
    UPDATE [dbo].[Checksum]
    SET 
    [Hash] = (SELECT SUM(l.[Hash]) FROM dbo.[Log] l),
    [ModifiedDate] = GETDATE()
    WHERE [Table] = @Table
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[Checksum]
        ([Table], [Hash], [CreatedDate], [ModifiedDate])
    VALUES
        (@Table, @Hash, GETDATE(), GETDATE())
END

IF @@ERROR <> 0
    BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @LogId
GO
/****** Object:  StoredProcedure [dbo].[USP_ChecksumUser]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_ChecksumUser]
    (
    @UserId                 INT,
    @Hash                   INT,
    @Table                  NVARCHAR(MAX)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION

/******************* Update *******************/
UPDATE [dbo].[User]
SET [Hash] = @Hash 
WHERE [UserId] = @UserId

IF EXISTS 
(SELECT 1
FROM [dbo].[Checksum] c
WHERE c.[Table] = @Table)
BEGIN
    /******************* Update *******************/
    UPDATE [dbo].[Checksum]
    SET 
    [Hash] = (SELECT SUM(l.[Hash]) FROM dbo.[User] l),
    [ModifiedDate] = GETDATE()
    WHERE [Table] = @Table
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[Checksum]
        ([Table], [Hash], [CreatedDate], [ModifiedDate])
    VALUES
        (@Table, @Hash, GETDATE(), GETDATE())
END

IF @@ERROR <> 0
    BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @UserId
GO
/****** Object:  StoredProcedure [dbo].[USP_CreateCommunication]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_CreateCommunication]
    (
    @Message                NVARCHAR(MAX),
    @Name                   NVARCHAR(MAX),
    @Email                  NVARCHAR(MAX)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

INSERT INTO [dbo].[Communication]
    ([Message], [Email], [IsAnswered], [Name], [CreatedDate], [ModifiedDate])
VALUES
    (@Message, @Email, 0, @Name, GETDATE(), GETDATE())
SET @NewId = SCOPE_IDENTITY();

IF @@ERROR <> 0
    BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @NewId
GO
/****** Object:  StoredProcedure [dbo].[USP_CreateDecor]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_CreateDecor]
    (
    @Name               NVARCHAR(50),
    @Type               NVARCHAR(50),
    @Volume             DECIMAL(18, 2)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[Decor] d
WHERE d.[Name] = @Name)
BEGIN
    /******************* Already exist *******************/
    ROLLBACK
    SELECT -4
    RETURN
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[Decor]
        ([Name], [Type], [Volume], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, @Type, @Volume, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT
    
    SELECT @NewId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CreateFish]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_CreateFish]
    (
    @Name                      NVARCHAR(50),
    @IsLonely                  BIT,
    @PhId                      INT,
    @Size                      DECIMAL(18, 2),
    @Temp                      DECIMAL(18, 2),
    @WaterRequired             INT,
    @Predators                 [dbo].[TTListInt] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[Fish] f
WHERE f.[Name] = @Name)
BEGIN
    /******************* Already exist *******************/
    ROLLBACK
    SELECT -4
    RETURN
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[Fish]
        ([Name], [IsLonely], [PhId], [Size], [Temp], [WaterRequired], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, @IsLonely, @PhId, @Size, @Temp, @WaterRequired, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    /******************* Relate *******************/
    INSERT INTO [dbo].[Predator]
        ([PredatorId], [FishId])
    SELECT p.[CommonValue], @NewId
    FROM @Predators p

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT

    SELECT @NewId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CreateGroup]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_CreateGroup]
    (
    @Name               NVARCHAR(50),
    @Roles              [dbo].[TTListInt] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[Role] r
WHERE r.[Name] = @Name)
BEGIN
    /******************* Already exist *******************/
    ROLLBACK
    SELECT -4
    RETURN
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[Role]
        ([Name], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    /******************* Relate *******************/
    INSERT INTO [dbo].[Group]
        ([GroupId], [RoleId])
    SELECT @NewId, r.[CommonValue]
    FROM @Roles r

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT
    SELECT @NewId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CreateLamp]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_CreateLamp]
    (
    @Name                   NVARCHAR(50),
    @Lumen                  INT,
    @Power                  INT,
    @SocketId               INT
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[Lamp] l
WHERE l.[Name] = @Name)
BEGIN
    /******************* Already exist *******************/
    ROLLBACK
    SELECT -4
    RETURN
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[Lamp]
        ([Name], [Lumen], [Power], [SocketId], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, @Lumen, @Power, @SocketId, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT
    
    SELECT @NewId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CreateLog]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_CreateLog]
    (
    @Message            NVARCHAR(MAX),
    @Ip                 NVARCHAR(MAX),
    @EventId            INT,
    @UserId             INT = NULL
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

INSERT INTO [dbo].[Log]
    ([Message], [Ip], [UserId], [Hash], [EventId], [CreatedDate], [ModifiedDate])
VALUES
    (@Message, @Ip, @UserId, 0, @EventId, GETDATE(), GETDATE())
SET @NewId = SCOPE_IDENTITY();

IF @@ERROR <> 0
    BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @NewId
GO
/****** Object:  StoredProcedure [dbo].[USP_CreatePlant]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_CreatePlant]
    (
    @Name                       NVARCHAR(50),
    @IsHydroponic               BIT,
    @IsLowLight                 BIT
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[Plant] p
WHERE p.[Name] = @Name)
BEGIN
    /******************* Already exist *******************/
    ROLLBACK
    SELECT -4
    RETURN
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[Plant]
        ([Name], [IsHydroponic], [IsLowLight], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, @IsHydroponic, @IsLowLight, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT
    
    SELECT @NewId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CreatePot]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_CreatePot]
    (
    @Name                   NVARCHAR(50),
    @Rgb                    NVARCHAR(7),
    @Heigth                 DECIMAL(18, 2),
    @Length                 DECIMAL(18, 2),
    @Width                  DECIMAL(18, 2),
    @RockId                 INT,
    @Plants                 [dbo].[TTListInt] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[Pot] p
WHERE p.[Name] = @Name)
BEGIN
    /******************* Already exist *******************/
    ROLLBACK
    SELECT -4
    RETURN
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[Pot]
        ([Name], [Rgb], [Heigth], [Length], [Width], [RockId], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, @Rgb, @Heigth, @Length, @Width, @RockId, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    /******************* Relate *******************/
    INSERT INTO [dbo].[PotPlant]
        ([PlantId], [PotId])
    SELECT p.[CommonValue], @NewId
    FROM @Plants p

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT

    SELECT @NewId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CreateSpotLight]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_CreateSpotLight]
    (
    @Name                   NVARCHAR(50),
    @Slots                  NVARCHAR(7),
    @Heigth                 DECIMAL(18, 2),
    @Length                 DECIMAL(18, 2),
    @Width                  DECIMAL(18, 2),
    @SocketId               INT,
    @Lamps                  [dbo].[TTListInt] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[SpotLight] s
WHERE s.[Name] = @Name)
BEGIN
    /******************* Already exist *******************/
    ROLLBACK
    SELECT -4
    RETURN
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[SpotLight]
        ([Name], [Slots], [Heigth], [Length], [Width], [SocketId], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, @Slots, @Heigth, @Length, @Width, @SocketId, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    /******************* Relate *******************/
    INSERT INTO [dbo].[SpotLightLamp]
        ([LampId], [SpotLightId])
    SELECT l.[CommonValue], @NewId
    FROM @Lamps l

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT

    SELECT @NewId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CreateTank]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_CreateTank]
    (
    @Name                      NVARCHAR(50),
    @WaterTemp                 DECIMAL(18, 2),
    @Heigth                    DECIMAL(18, 2),
    @Length                    DECIMAL(18, 2),
    @Width                     DECIMAL(18, 2),
    @PhId                      INT,
    @WaterPumpId               INT,
    @Decors                    [dbo].[TTListInt] READONLY,
    @Fishes                    [dbo].[TTDictionary] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[Tank] t
WHERE t.[Name] = @Name)
BEGIN
    /******************* Already exist *******************/
    ROLLBACK
    SELECT -4
    RETURN
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[Tank]
        ([Name], [WaterTemp], [Heigth], [Length], [Width], [PhId], [WaterPumpId], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, @WaterTemp, @Heigth, @Length, @Width, @PhId, @WaterPumpId, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    /******************* Relate *******************/
    INSERT INTO [dbo].[TankDecor]
        ([DecorId], [TankId])
    SELECT d.[CommonValue], @NewId
    FROM @Decors d

    INSERT INTO [dbo].[TankFish]
        ([FishId], [TankId], [Cant])
    SELECT f.[Key], @NewId, f.[Value] 
    FROM @Fishes f

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT

    SELECT @NewId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CreateUser]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_CreateUser]
    (
    @Name               NVARCHAR(255),
    @LastName           NVARCHAR(255),
    @Username           NVARCHAR(MAX),
    @Email              NVARCHAR(255),
    @Password           NVARCHAR(MAX),
    @UserPreferenceId   INT,
    @Roles              [dbo].[TTListInt] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[User] u
WHERE u.[Username] = @Username OR u.[Email] = @Email)
BEGIN
    /******************* Already exist *******************/
    ROLLBACK
    SELECT -4
    RETURN
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[User]
        ([Name], [Hash], [LastName], [Password], [Username], [Email], [IsDeleted], [IsLocked], [UserPreferenceId], [LoginAttempts], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, 0, @LastName, @Password, @Username, @Email, 0, 0, @UserPreferenceId, 0, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    /******************* Relate *******************/
    INSERT INTO [dbo].[UserRole]
        ([UserId], [RoleId])
    SELECT @NewId, r.[CommonValue]
    FROM @Roles r

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT
    
    SELECT @NewId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CreateUserPreference]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_CreateUserPreference]
    (
    @Name               NVARCHAR(MAX),
    @DateFormat         NVARCHAR(MAX),
    @TimeZone           NVARCHAR(MAX)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[UserPreference] u
WHERE u.[Name] = @Name)
BEGIN
    /******************* Already exist *******************/
    ROLLBACK
    SELECT -4
    RETURN
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[UserPreference]
        ([Name], [DateFormat], [TimeZone], [IsDefault], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, @DateFormat, @TimeZone, 0, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    /******************* Relate *******************/
    INSERT INTO [dbo].[PreferenceResource]
        ([UserPreferenceId], [ResourceId], [Value])
    SELECT @NewId, pr.[ResourceId], pr.[Value]
    FROM [dbo].[PreferenceResource] pr
    WHERE pr.[UserPreferenceId] = 1

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT
    SELECT @NewId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CreateWaterPump]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_CreateWaterPump]
    (
    @Name                   NVARCHAR(50),
    @FlowRate               INT,
    @Power                  INT,
    @Volume                 DECIMAL(18, 2)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[WaterPump] w
WHERE w.[Name] = @Name)
BEGIN
    /******************* Already exist *******************/
    ROLLBACK
    SELECT -4
    RETURN
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[WaterPump]
        ([Name], [FlowRate], [Power], [Volume], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, @FlowRate, @Power, @Volume, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT
    
    SELECT @NewId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteDecor]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_DeleteDecor]
    (
    @DecorId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[Decor]
    WHERE [DecorId] = @DecorId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @DecorId
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteFish]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_DeleteFish]
    (
    @FishId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[Predator]
    WHERE [PredatorId] = @FishId OR [FishId] = @FishId

DELETE FROM [dbo].[Fish]
    WHERE [FishId] = @FishId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @FishId
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteGroup]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_DeleteGroup]
    (
    @GroupId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[Group]
    WHERE [GroupId] = @GroupId

DELETE FROM [dbo].[Role]
    WHERE [RoleId] = @GroupId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @GroupId
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteLamp]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_DeleteLamp]
    (
    @LampId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[Lamp]
    WHERE [LampId] = @LampId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @LampId
GO
/****** Object:  StoredProcedure [dbo].[USP_DeletePlant]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_DeletePlant]
    (
    @PlantId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[Plant]
    WHERE [PlantId] = @PlantId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @PlantId
GO
/****** Object:  StoredProcedure [dbo].[USP_DeletePot]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_DeletePot]
    (
    @PotId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[PotPlant]
    WHERE [PotId] =  @PotId

DELETE FROM [dbo].[Pot]
    WHERE [PotId] = @PotId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @PotId
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteSpotLight]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_DeleteSpotLight]
    (
    @SpotLightId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[SpotLightLamp]
    WHERE [SpotLightId] =  @SpotLightId

DELETE FROM [dbo].[SpotLight]
    WHERE [SpotLightId] = @SpotLightId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @SpotLightId
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteTank]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_DeleteTank]
    (
    @FishId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[Predator]
    WHERE [FishId] =  @FishId

DELETE FROM [dbo].[Fish]
    WHERE [FishId] = @FishId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @FishId
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteUser]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_DeleteUser]
    (
    @UserId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[UserRole]
    WHERE [UserId] = @UserId

UPDATE [dbo].[User]
SET [IsDeleted] = 1
WHERE [UserId] = @UserId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @UserId
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteUserPreference]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_DeleteUserPreference]
    (
    @UserPreferenceId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

IF (@UserPreferenceId > 1)
BEGIN
    DELETE FROM [dbo].[PreferenceResource]
    WHERE [UserPreferenceId] = @UserPreferenceId

    DELETE FROM [dbo].[UserPreference]
    WHERE [UserPreferenceId] = @UserPreferenceId

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT

    SELECT @UserPreferenceId
END
ELSE
BEGIN
    ROLLBACK
    SELECT -5
    RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteWaterPump]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_DeleteWaterPump]
    (
    @WaterPumpId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[WaterPump]
    WHERE [WaterPumpId] = @WaterPumpId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @WaterPumpId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetChecksum]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetChecksum]
AS

SET NOCOUNT ON;

SELECT
    c.[ChecksumId], c.[CreatedDate], c.[Hash], c.[ModifiedDate], c.[Table]
FROM [dbo].[Checksum] c
GO
/****** Object:  StoredProcedure [dbo].[USP_GetDecor]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetDecor]
    (
    @DecorId            INT
)
AS

SET NOCOUNT ON;

SELECT
    d.[DecorId], d.[Name], d.[Type], d.[Volume], d.[CreatedDate], d.[ModifiedDate]
FROM [dbo].[Decor] d
WHERE d.[DecorId] = @DecorId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetDecors]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetDecors]
AS

SET NOCOUNT ON;

SELECT
    d.[DecorId], d.[Name], d.[Type], d.[Volume], d.[CreatedDate], d.[ModifiedDate]
FROM [dbo].[Decor] d
GO
/****** Object:  StoredProcedure [dbo].[USP_GetFish]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetFish]
    (
    @FishId             INT
)
AS

SET NOCOUNT ON;

SELECT
    f.[FishId], f.[IsLonely], f.[Name], f.[PhId], f.[Size], f.[Temp], f.[WaterRequired], f.[CreatedDate], f.[ModifiedDate], fp.[FishId] as PredatorId, fp.[Name] as PredatorName
FROM [dbo].[Fish] f
    LEFT JOIN [dbo].[Predator] p ON p.FishId = f.FishId
    LEFT JOIN [dbo].[Fish] fp ON fp.FishId = p.PredatorId
WHERE f.[FishId] = @FishId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetFishes]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetFishes]
AS

SET NOCOUNT ON;

SELECT
    f.[FishId], f.[IsLonely], f.[Name], f.[PhId], f.[Size], f.[Temp], f.[WaterRequired], f.[CreatedDate], f.[ModifiedDate], fp.[FishId] as PredatorId, fp.[Name] as PredatorName
FROM [dbo].[Fish] f
    LEFT JOIN [dbo].[Predator] p ON p.FishId = f.FishId
    LEFT JOIN [dbo].[Fish] fp ON fp.FishId = p.PredatorId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetGroup]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetGroup]
    (
    @GroupId            INT
)
AS

SET NOCOUNT ON;

SELECT r.[RoleID] GroupId, r.[Name] GroupName, g.[RoleId] RoleId, ro.[Name] RoleName, r.[CreatedDate], r.[ModifiedDate]
FROM [dbo].[Role] r
    LEFT JOIN [dbo].[Group] g ON g.[GroupId] = r.[RoleId]
    LEFT JOIN [dbo].[Role] ro ON ro.[RoleId] = g.[RoleId]
WHERE r.[RoleId] = @GroupId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetGroups]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetGroups]
    (
    @UserId            INT = NULL
)
AS

SET NOCOUNT ON;

IF (@UserId IS NULL)
BEGIN
    SELECT r.[RoleID] GroupId, r.[Name] GroupName, g.[RoleId] RoleId, ro.[Name] RoleName, r.[CreatedDate], r.[ModifiedDate]
    FROM [dbo].[Role] r
        LEFT JOIN [dbo].[Group] g ON g.[GroupId] = r.[RoleId]
        LEFT JOIN [dbo].[Role] ro ON ro.[RoleId] = g.[RoleId]
    WHERE r.[RoleId] > 100
    ORDER BY r.[RoleID]
END
ELSE
BEGIN
    SELECT r.[RoleID] GroupId, r.[Name] GroupName, g.[RoleId] RoleId, ro.[Name] RoleName, r.[CreatedDate], r.[ModifiedDate]
    FROM [dbo].[Role] r
        LEFT JOIN [dbo].[Group] g ON g.[GroupId] = r.[RoleId]
        LEFT JOIN [dbo].[Role] ro ON ro.[RoleId] = g.[RoleId]
        LEFT JOIN dbo.[UserRole] ur ON ur.[RoleId] = r.[RoleId]
        LEFT JOIN dbo.[User] u ON u.[UserId] = ur.[UserId]
    WHERE r.[RoleId] > 100 AND u.[UserId] = @UserId
    ORDER BY r.[RoleID]
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetLamp]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetLamp]
    (
    @LampId             INT
)
AS

SET NOCOUNT ON;

SELECT
    l.[LampId], l.[Lumen], l.[Name], l.[Power], l.[SocketId], l.[CreatedDate], l.[ModifiedDate]
FROM [dbo].[Lamp] l
WHERE l.[LampId] = @LampId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetLamps]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetLamps]
AS

SET NOCOUNT ON;

SELECT
    l.[LampId], l.[Lumen], l.[Name], l.[Power], l.[SocketId], l.[CreatedDate], l.[ModifiedDate]
FROM [dbo].[Lamp] l
GO
/****** Object:  StoredProcedure [dbo].[USP_GetLogs]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetLogs]
AS

SET NOCOUNT ON;

SELECT l.[LogId], l.[Hash], l.[UserId], l.[EventId], l.[Ip], l.[Message], l.[CreatedDate], l.[ModifiedDate], u.[Name], u.[LastName]
FROM [dbo].[Log] l
    LEFT JOIN dbo.[User] u on u.[UserId] = l.[UserId]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetPlant]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetPlant]
    (
    @PlantId             INT
)
AS

SET NOCOUNT ON;

SELECT
    p.[PlantId], p.[IsHydroponic], p.[IsLowLight], p.[Name], p.[CreatedDate], p.[ModifiedDate]
FROM [dbo].[Plant] p
WHERE p.[PlantId] = @PlantId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetPlants]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetPlants]
AS

SET NOCOUNT ON;

SELECT
    p.[PlantId], p.[IsHydroponic], p.[IsLowLight], p.[Name], p.[CreatedDate], p.[ModifiedDate]
FROM [dbo].[Plant] p
GO
/****** Object:  StoredProcedure [dbo].[USP_GetPot]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetPot]
    (
    @PotId             INT
)
AS

SET NOCOUNT ON;

SELECT
    p.[Heigth], p.[Length], p.[Name], p.[PotId], p.[Rgb], p.[RockId], p.[Width], p.[CreatedDate], p.[ModifiedDate],
    pl.[PlantId], pl.[Name] PlantName
FROM [dbo].[Pot] p
    LEFT JOIN [dbo].[PotPlant] pp ON pp.[PotId] = p.[PotId]
    LEFT JOIN [dbo].[Plant] pl ON pl.[PlantId] = pp.[PlantId]
WHERE p.[PotId] = @PotId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetPots]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetPots]
AS

SET NOCOUNT ON;

SELECT
    p.[Heigth], p.[Length], p.[Name], p.[PotId], p.[Rgb], p.[RockId], p.[Width], p.[CreatedDate], p.[ModifiedDate],
    pl.[PlantId], pl.[Name] PlantName
FROM [dbo].[Pot] p
    LEFT JOIN [dbo].[PotPlant] pp ON pp.[PotId] = p.[PotId]
    LEFT JOIN [dbo].[Plant] pl ON pl.[PlantId] = pp.[PlantId]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetRoles]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetRoles]
    (
    @UserId            INT = NULL
)
AS

SET NOCOUNT ON;

IF (@UserId IS NULL)
BEGIN
    SELECT *
    FROM [dbo].[Role] r
    WHERE r.[RoleId] <= 100
    ORDER BY r.[RoleID]
END
ELSE
BEGIN
    SELECT *
    FROM [dbo].[Role] r
        LEFT JOIN dbo.[UserRole] ur ON ur.[RoleId] = r.[RoleId]
        LEFT JOIN dbo.[User] u ON u.[UserId] = ur.[UserId]
    WHERE r.[RoleId] <= 100 AND u.[UserId] = @UserId
    ORDER BY r.[RoleID]
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetSpotLight]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetSpotLight]
    (
    @SpotLightId             INT
)
AS

SET NOCOUNT ON;

SELECT
    s.[SpotLightId], s.[Slots], s.[Name], s.[Heigth], s.[Length], s.[SocketId], s.[Width], s.[CreatedDate], s.[ModifiedDate], l.[LampId] as LampId, l.[Name] as LampName
FROM [dbo].[SpotLight] s
    INNER JOIN [dbo].[SpotLightLamp] sl ON sl.SpotLightId = s.SpotLightId
    INNER JOIN [dbo].[Lamp] l ON l.LampId = sl.LampId
WHERE s.[SpotLightId] = @SpotLightId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetSpotLights]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetSpotLights]
AS

SET NOCOUNT ON;

SELECT
    s.[SpotLightId], s.[Slots], s.[Name], s.[Heigth], s.[Length], s.[SocketId], s.[Width], s.[CreatedDate], s.[ModifiedDate], l.[LampId] as LampId, l.[Name] as LampName
FROM [dbo].[SpotLight] s
    INNER JOIN [dbo].[SpotLightLamp] sl ON sl.SpotLightId = s.SpotLightId
    INNER JOIN [dbo].[Lamp] l ON l.LampId = sl.LampId
ORDER BY s.[SpotLightId]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTank]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetTank]
    (
    @TankId             INT
)
AS

SET NOCOUNT ON;

SELECT
    t.[TankId], t.[WaterTemp], t.[Name], t.[Heigth], t.[Length], t.[PhId], t.[WaterPumpId], t.[Width], t.[CreatedDate], t.[ModifiedDate], w.[Name] WaterPumpName
FROM [dbo].[Tank] t
    INNER JOIN [dbo].[WaterPump] w ON w.[WaterPumpId] = t.[WaterPumpId]
WHERE t.[TankId] = @TankId

SELECT tf.[FishId], tf.[TankId], f.[Name]
FROM [dbo].[TankFish] tf
    INNER JOIN [dbo].[Fish] f ON f.[FishId] = tf.[FishId]
WHERE tf.[TankId] = @TankId
    
SELECT td.[DecorId], td.[TankId], d.[Name]
FROM [dbo].[TankDecor] td
    INNER JOIN [dbo].[Decor] d ON d.[DecorId] = td.[DecorId]
WHERE td.[TankId] = @TankId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTanks]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetTanks]
AS

SET NOCOUNT ON;

SELECT
    t.[TankId], t.[WaterTemp], t.[Name], t.[Heigth], t.[Length], t.[PhId], t.[WaterPumpId], t.[Width], t.[CreatedDate], t.[ModifiedDate], w.[Name] WaterPumpName
FROM [dbo].[Tank] t
    INNER JOIN [dbo].[WaterPump] w ON w.[WaterPumpId] = t.[WaterPumpId]

SELECT tf.[FishId], tf.[TankId], tf.[Cant], f.[Name]
FROM [dbo].[TankFish] tf
    INNER JOIN [dbo].[Fish] f ON f.[FishId] = tf.[FishId]

SELECT td.[DecorId], td.[TankId], d.[Name]
FROM [dbo].[TankDecor] td
    INNER JOIN [dbo].[Decor] d ON d.[DecorId] = td.[DecorId]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetUser]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetUser]
    (
    @UserId            INT
)
AS

SET NOCOUNT ON;

SELECT
    u.[UserId], u.[Hash], u.[IsLocked], u.[IsDeleted], u.[Name], u.[LastName], u.[Password], u.[Username], u.[Email], u.[LoginAttempts], u.[UserPreferenceId], u.[TempPassword], u.[CreatedDate], u.[ModifiedDate]
FROM [dbo].[User] u
WHERE u.[UserId] = @UserId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetUserPreference]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetUserPreference]
    (
    @UserPreferenceId            INT
)
AS

SET NOCOUNT ON;

SELECT up.[UserPreferenceId], up.[IsDefault], up.[DateFormat], up.[Name], up.[TimeZone], up.[CreatedDate], up.[ModifiedDate]
FROM [dbo].[UserPreference] up
WHERE up.[UserPreferenceId] = @UserPreferenceId

SELECT pr.[UserPreferenceId], r.[ResourceId], r.[Key], pr.[Value], r.[CreatedDate], r.[ModifiedDate]
FROM dbo.[PreferenceResource] pr
    INNER JOIN dbo.[Resource] r on r.[ResourceId] = pr.[ResourceId]
WHERE pr.[UserPreferenceId] = @UserPreferenceId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetUserPreferences]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetUserPreferences]
AS

SET NOCOUNT ON;

SELECT up.[UserPreferenceId], up.[IsDefault], up.[DateFormat], up.[Name], up.[TimeZone], up.[CreatedDate], up.[ModifiedDate]
FROM [dbo].[UserPreference] up
GO
/****** Object:  StoredProcedure [dbo].[USP_GetUsers]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetUsers]
AS

SET NOCOUNT ON;

SELECT
    u.[UserId], u.[Hash], u.[IsLocked], u.[IsDeleted], u.[Name], u.[LastName], u.[Password], u.[Username], u.[Email], u.[LoginAttempts], u.[UserPreferenceId], u.[TempPassword], u.[CreatedDate], u.[ModifiedDate]
FROM [dbo].[User] u
GO
/****** Object:  StoredProcedure [dbo].[USP_GetWaterPump]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetWaterPump]
    (
    @WaterPumpId             INT
)
AS

SET NOCOUNT ON;

SELECT
    w.[WaterPumpId], w.[FlowRate], w.[Name], w.[Power], w.[Volume], w.[CreatedDate], w.[ModifiedDate]
FROM [dbo].[WaterPump] w
WHERE w.[WaterPumpId] = @WaterPumpId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetWaterPumps]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetWaterPumps]
AS

SET NOCOUNT ON;

SELECT
    w.[WaterPumpId], w.[FlowRate], w.[Name], w.[Power], w.[Volume], w.[CreatedDate], w.[ModifiedDate]
FROM [dbo].[WaterPump] w
GO
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_Login]
    (
    @Username           NVARCHAR(MAX)
)
AS

SET NOCOUNT ON;

SELECT
    u.[UserId], u.[Hash], u.[IsLocked], u.[IsDeleted], u.[Name], u.[LastName], u.[Password], u.[Username], u.[Email], u.[LoginAttempts], u.[UserPreferenceId], u.[TempPassword], u.[CreatedDate], u.[ModifiedDate]
FROM [dbo].[User] u
WHERE u.[Username] = @Username AND u.[IsDeleted] = 0
GO
/****** Object:  StoredProcedure [dbo].[USP_RecoveryPassword]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_RecoveryPassword]
    (
    @UserId                     INT = 0,
    @Email                      NVARCHAR(MAX) = '',
    @TempPassword               NVARCHAR(MAX)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION

IF EXISTS 
(SELECT 1
FROM [dbo].[User] u
WHERE u.[UserId] = @UserId OR u.[Email] = @Email)
BEGIN
    /******************* Update *******************/
    UPDATE [dbo].[User]
    SET 
    [TempPassword] = @TempPassword
    WHERE [UserId] = @UserId OR [Email] = @Email
END
ELSE
BEGIN
    /******************* Not found *******************/
    ROLLBACK
    SELECT -2
    RETURN
END

IF @@ERROR <> 0
    BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT 1
GO
/****** Object:  StoredProcedure [dbo].[USP_RecoveryUser]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_RecoveryUser]
    (
    @UserId                 INT
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION

IF EXISTS 
(SELECT 1
FROM [dbo].[User] u
WHERE u.[UserId] = @UserId)
BEGIN
    /******************* Update *******************/
    UPDATE [dbo].[User]
    SET 
    [IsDeleted] = 0,
    [ModifiedDate] = GETDATE()
    WHERE [UserId] = @UserId
END
ELSE
BEGIN
    /******************* Not found *******************/
    ROLLBACK
    SELECT -2
    RETURN
END

IF @@ERROR <> 0
    BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @UserId
GO
/****** Object:  StoredProcedure [dbo].[USP_ResetPassword]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_ResetPassword]
    (
    @UserId                     INT = 0,
    @Password                   NVARCHAR(MAX)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION

IF EXISTS 
(SELECT 1
FROM [dbo].[User] u
WHERE u.[UserId] = @UserId)
BEGIN
    /******************* Update *******************/
    UPDATE [dbo].[User]
    SET 
    [Password] = @Password,
    [TempPassword] = ''
    WHERE [UserId] = @UserId
END
ELSE
BEGIN
    /******************* Not found *******************/
    ROLLBACK
    SELECT -2
    RETURN
END

IF @@ERROR <> 0
    BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @UserId
GO
/****** Object:  StoredProcedure [dbo].[USP_UnlockUser]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_UnlockUser]
    (
    @UserId                 INT
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION

IF EXISTS 
(SELECT 1
FROM [dbo].[User] u
WHERE u.[UserId] = @UserId)
BEGIN
    /******************* Update *******************/
    UPDATE [dbo].[User]
    SET 
    [IsLocked] = 0,
    [ModifiedDate] = GETDATE()
    WHERE [UserId] = @UserId
END
ELSE
BEGIN
    /******************* Not found *******************/
    ROLLBACK
    SELECT -2
    RETURN
END

IF @@ERROR <> 0
    BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @UserId
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateDecor]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_UpdateDecor]
    (
    @DecorId            INT,
    @Name               NVARCHAR(50),
    @ModifiedDate       DATETIME2(7),
    @Type               NVARCHAR(50),
    @Volume             DECIMAL(18, 2)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = d.[ModifiedDate]
FROM [dbo].[Decor] d
WHERE d.[DecorId] = @DecorId

IF (@CurrentModifiedDate IS NULL)
BEGIN
    /******************* Not found *******************/
    ROLLBACK
    SELECT -2
    RETURN
END
ELSE
BEGIN
    IF (@CurrentModifiedDate = @ModifiedDate)
    BEGIN
        /******************* Update *******************/
        UPDATE [dbo].[Decor]
        SET 
        [Name] = @Name, 
        [Type] = @Type, 
        [Volume] = @Volume, 
        [ModifiedDate] = GETDATE()
        WHERE [DecorId] = @DecorId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @DecorId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateFish]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_UpdateFish]
    (
    @FishId                    INT,
    @Name                      NVARCHAR(50),
    @ModifiedDate              DATETIME2(7),
    @IsLonely                  BIT,
    @PhId                      INT,
    @Size                      DECIMAL(18, 2),
    @Temp                      DECIMAL(18, 2),
    @WaterRequired             INT,
    @Predators                 [dbo].[TTListInt] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = f.[ModifiedDate]
FROM [dbo].[Fish] f
WHERE f.[FishId] = @FishId

IF (@CurrentModifiedDate IS NULL)
BEGIN
    /******************* Not found *******************/
    ROLLBACK
    SELECT -2
    RETURN
END
ELSE
BEGIN
    IF (@CurrentModifiedDate = @ModifiedDate)
    BEGIN
        /******************* Delete *******************/
        DELETE FROM [dbo].[Predator]
        WHERE [FishId] = @FishId

        /******************* Relate *******************/
        INSERT INTO [dbo].[Predator]
            ([PredatorId], [FishId])
        SELECT p.[CommonValue], @FishId
        FROM @Predators p

        /******************* Update *******************/
        UPDATE [dbo].[Fish]
        SET 
        [Name] = @Name, 
        [IsLonely] = @IsLonely, 
        [PhId] = @PhId, 
        [Size] = @Size, 
        [Temp] = @Temp, 
        [WaterRequired] = @WaterRequired, 
        [ModifiedDate] = GETDATE()
        WHERE [FishId] = @FishId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @FishId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateGroup]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_UpdateGroup]
    (
    @GroupId            INT,
    @Name               NVARCHAR(50),
    @ModifiedDate       DATETIME2(7),
    @Roles              [dbo].[TTListInt] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = r.[ModifiedDate]
FROM [dbo].[Role] r
WHERE r.[RoleId] = @GroupId

IF (@CurrentModifiedDate IS NULL)
BEGIN
    /******************* Not found *******************/
    ROLLBACK
    SELECT -2
    RETURN
END
ELSE
BEGIN
    IF (@CurrentModifiedDate = @ModifiedDate)
    BEGIN
        /******************* Delete *******************/
        DELETE FROM [dbo].[Group]
        WHERE [GroupId] = @GroupId

        /******************* Relate *******************/
        INSERT INTO [dbo].[Group]
            ([GroupId], [RoleId])
        SELECT @GroupId, r.[CommonValue]
        FROM @Roles r

        /******************* Update *******************/
        UPDATE [dbo].[Role]
        SET [Name] = @Name, [ModifiedDate] = GETDATE()
        WHERE [RoleId] = @GroupId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @GroupId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateLamp]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_UpdateLamp]
    (
    @LampId                 INT,
    @Name                   NVARCHAR(50),
    @ModifiedDate           DATETIME2(7),
    @Lumen                  INT,
    @Power                  INT,
    @SocketId               INT
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = l.[ModifiedDate]
FROM [dbo].[Lamp] l
WHERE l.[LampId] = @LampId

IF (@CurrentModifiedDate IS NULL)
BEGIN
    /******************* Not found *******************/
    ROLLBACK
    SELECT -2
    RETURN
END
ELSE
BEGIN
    IF (@CurrentModifiedDate = @ModifiedDate)
    BEGIN
        /******************* Update *******************/
        UPDATE [dbo].[Lamp]
        SET 
        [Name] = @Name, 
        [Lumen] = @Lumen, 
        [Power] = @Power, 
        [SocketId] = @SocketId, 
        [ModifiedDate] = GETDATE()
        WHERE [LampId] = @LampId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @LampId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateLoginAttempts]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_UpdateLoginAttempts]
    (
    @UserId                 INT,
    @IsLocked               NVARCHAR(MAX),
    @LoginAttempts          INT
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
UPDATE [dbo].[User]
SET 
    [LoginAttempts] = @LoginAttempts, 
    [IsLocked] = @IsLocked,
    [ModifiedDate] = GETDATE()
WHERE [UserId] = @UserId

IF @@ERROR <> 0
        BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @UserId
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdatePlant]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_UpdatePlant]
    (
    @PlantId                     INT,
    @Name                       NVARCHAR(50),
    @ModifiedDate               DATETIME2(7),
    @IsHydroponic               BIT,
    @IsLowLight                 BIT
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = p.[ModifiedDate]
FROM [dbo].[Plant] p
WHERE p.[PlantId] = @PlantId

IF (@CurrentModifiedDate IS NULL)
BEGIN
    /******************* Not found *******************/
    ROLLBACK
    SELECT -2
    RETURN
END
ELSE
BEGIN
    IF (@CurrentModifiedDate = @ModifiedDate)
    BEGIN
        /******************* Update *******************/
        UPDATE [dbo].[Plant]
        SET 
        [Name] = @Name, 
        [IsHydroponic] = @IsHydroponic, 
        [IsLowLight] = @IsLowLight, 
        [ModifiedDate] = GETDATE()
        WHERE [PlantId] = @PlantId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @PlantId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdatePot]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_UpdatePot]
    (
    @PotId                  INT,
    @ModifiedDate           DATETIME2(7),
    @Name                   NVARCHAR(50),
    @Rgb                    NVARCHAR(7),
    @Heigth                 DECIMAL(18, 2),
    @Length                 DECIMAL(18, 2),
    @Width                  DECIMAL(18, 2),
    @RockId                 INT,
    @Plants                 [dbo].[TTListInt] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = p.[ModifiedDate]
FROM [dbo].[Pot] p
WHERE p.[PotId] = @PotId

IF (@CurrentModifiedDate IS NULL)
BEGIN
    /******************* Not found *******************/
    ROLLBACK
    SELECT -2
    RETURN
END
ELSE
BEGIN
    IF (@CurrentModifiedDate = @ModifiedDate)
    BEGIN
        /******************* Delete *******************/
        DELETE FROM [dbo].[PotPlant]
        WHERE [PotId] = @PotId

        /******************* Relate *******************/
        INSERT INTO [dbo].[PotPlant]
            ([PlantId], [PotId])
        SELECT p.[CommonValue], @PotId
        FROM @Plants p

        /******************* Update *******************/
        UPDATE [dbo].[Pot]
        SET 
        [Name] = @Name, 
        [Heigth] = @Heigth, 
        [Length] = @Length, 
        [Rgb] = @Rgb, 
        [Width] = @Width, 
        [RockId] = @RockId, 
        [ModifiedDate] = GETDATE()
        WHERE [PotId] = @PotId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @PotId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateSpotLight]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_UpdateSpotLight]
    (
    @SpotLightId            INT,
    @ModifiedDate           DATETIME2(7),
    @Name                   NVARCHAR(50),
    @Slots                  NVARCHAR(7),
    @Heigth                 DECIMAL(18, 2),
    @Length                 DECIMAL(18, 2),
    @Width                  DECIMAL(18, 2),
    @SocketId               INT,
    @Lamps                  [dbo].[TTListInt] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = s.[ModifiedDate]
FROM [dbo].[SpotLight] s
WHERE s.[SpotLightId] = @SpotLightId

IF (@CurrentModifiedDate IS NULL)
BEGIN
    /******************* Not found *******************/
    ROLLBACK
    SELECT -2
    RETURN
END
ELSE
BEGIN
    IF (@CurrentModifiedDate = @ModifiedDate)
    BEGIN
        /******************* Delete *******************/
        DELETE FROM [dbo].[SpotLightLamp]
        WHERE [SpotLightId] = @SpotLightId

        /******************* Relate *******************/
        INSERT INTO [dbo].[SpotLightLamp]
            ([LampId], [SpotLightId])
        SELECT l.[CommonValue], @SpotLightId
        FROM @Lamps l

        /******************* Update *******************/
        UPDATE [dbo].[SpotLight]
        SET 
        [Name] = @Name, 
        [Slots] = @Slots,
        [Heigth] = @Heigth,
        [Length] = @Length,
        [Width] = @Width,
        [SocketId] = @SocketId,
        [ModifiedDate] = GETDATE()
        WHERE [SpotLightId] = @SpotLightId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @SpotLightId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateTank]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_UpdateTank]
    (
    @FishId                    INT,
    @Name                      NVARCHAR(50),
    @ModifiedDate              DATETIME2(7),
    @IsLonely                  BIT,
    @PhId                      INT,
    @Size                      DECIMAL(18, 2),
    @Temp                      DECIMAL(18, 2),
    @WaterRequired             INT,
    @Predators                 [dbo].[TTListInt] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = f.[ModifiedDate]
FROM [dbo].[Fish] f
WHERE f.[FishId] = @FishId

IF (@CurrentModifiedDate IS NULL)
BEGIN
    /******************* Not found *******************/
    ROLLBACK
    SELECT -2
    RETURN
END
ELSE
BEGIN
    IF (@CurrentModifiedDate = @ModifiedDate)
    BEGIN
        /******************* Delete *******************/
        DELETE FROM [dbo].[Predator]
        WHERE [FishId] = @FishId

        /******************* Relate *******************/
        INSERT INTO [dbo].[Predator]
            ([PredatorId], [FishId])
        SELECT p.[CommonValue], @FishId
        FROM @Predators p

        /******************* Update *******************/
        UPDATE [dbo].[Fish]
        SET 
        [Name] = @Name, 
        [IsLonely] = @IsLonely, 
        [PhId] = @PhId, 
        [Size] = @Size, 
        [Temp] = @Temp, 
        [WaterRequired] = @WaterRequired, 
        [ModifiedDate] = GETDATE()
        WHERE [FishId] = @FishId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @FishId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateUser]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_UpdateUser]
    (
    @UserId                 INT,
    @Name                   NVARCHAR(MAX),
    @LastName               NVARCHAR(MAX),
    @UserPreferenceId       INT,
    @ModifiedDate           DATETIME2(7),
    @Roles                  [dbo].[TTListInt] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = u.[ModifiedDate]
FROM [dbo].[User] u
WHERE u.[UserId] = @UserId

IF (@CurrentModifiedDate IS NULL)
BEGIN
    /******************* Not found *******************/
    ROLLBACK
    SELECT -2
    RETURN
END
ELSE
BEGIN
    IF (@CurrentModifiedDate = @ModifiedDate)
    BEGIN
        /******************* Delete *******************/
        DELETE FROM [dbo].[UserRole]
        WHERE [UserId] = @UserId

        /******************* Relate *******************/
        INSERT INTO [dbo].[UserRole]
            ([UserId], [RoleId])
        SELECT @UserId, r.[CommonValue]
        FROM @Roles r

        /******************* Update *******************/
        UPDATE [dbo].[User]
        SET 
        [Name] = @Name, 
        [LastName] = @LastName,
        [UserPreferenceId] = @UserPreferenceId,
        [ModifiedDate] = GETDATE()
        WHERE [UserId] = @UserId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @UserId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateUserPreference]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_UpdateUserPreference]
    (
    @UserPreferenceId           INT,
    @Name                       NVARCHAR(MAX),
    @DateFormat                 NVARCHAR(MAX),
    @TimeZone                   NVARCHAR(MAX),
    @ModifiedDate               DATETIME2(7),
    @Resources                  [dbo].[TTDictionary] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = u.[ModifiedDate]
FROM [dbo].[UserPreference] u
WHERE u.[UserPreferenceId] = @UserPreferenceId

IF (@CurrentModifiedDate IS NULL)
BEGIN
    /******************* Not found *******************/
    ROLLBACK
    SELECT -2
    RETURN
END
ELSE
BEGIN
    IF (@CurrentModifiedDate = @ModifiedDate)
    BEGIN
        /******************* Update *******************/
        UPDATE [dbo].[UserPreference]
        SET [DateFormat] = @DateFormat, [Name] = @Name, [TimeZone] = @TimeZone, [ModifiedDate] = GETDATE()
        WHERE [UserPreferenceId] = @UserPreferenceId

        /******************* Update relations *******************/
        UPDATE [dbo].[PreferenceResource]
        SET [Value] = r.[Value]
        FROM @Resources r
            JOIN [dbo].[PreferenceResource] p ON p.[ResourceId] = r.[Key] AND p.[UserPreferenceId] = @UserPreferenceId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @UserPreferenceId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateWaterPump]    Script Date: 11/12/2020 8:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_UpdateWaterPump]
    (
    @WaterPumpId                 INT,
    @Name                   NVARCHAR(50),
    @ModifiedDate           DATETIME2(7),
    @FlowRate               INT,
    @Power                  INT,
    @Volume                 DECIMAL(18, 2)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = w.[ModifiedDate]
FROM [dbo].[WaterPump] w
WHERE w.[WaterPumpId] = @WaterPumpId

IF (@CurrentModifiedDate IS NULL)
BEGIN
    /******************* Not found *******************/
    ROLLBACK
    SELECT -2
    RETURN
END
ELSE
BEGIN
    IF (@CurrentModifiedDate = @ModifiedDate)
    BEGIN
        /******************* Update *******************/
        UPDATE [dbo].[WaterPump]
        SET 
        [Name] = @Name, 
        [FlowRate] = @FlowRate, 
        [Power] = @Power, 
        [Volume] = @Volume, 
        [ModifiedDate] = GETDATE()
        WHERE [WaterPumpId] = @WaterPumpId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @WaterPumpId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END
GO
USE [master]
GO
ALTER DATABASE [SmartAquaponic] SET  READ_WRITE 
GO
