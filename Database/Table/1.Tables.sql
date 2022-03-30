USE [master]
GO

CREATE DATABASE [SmartAquaponic]
 CONTAINMENT = NONE
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

USE [SmartAquaponic]
GO

/****** Object:  Table [dbo].[Checksum]     ******/
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
/****** Object:  Table [dbo].[Communication]     ******/
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
/****** Object:  Table [dbo].[Decor]     ******/
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
/****** Object:  Table [dbo].[Event]     ******/
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
/****** Object:  Table [dbo].[Fish]     ******/
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
/****** Object:  Table [dbo].[Group]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupId] [int] NOT NULL,
	[RoleId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lamp]     ******/
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
/****** Object:  Table [dbo].[Log]     ******/
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
/****** Object:  Table [dbo].[Ph]     ******/
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
/****** Object:  Table [dbo].[Plant]     ******/
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
/****** Object:  Table [dbo].[Pot]     ******/
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
/****** Object:  Table [dbo].[PotPlant]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PotPlant](
	[PlantId] [int] NOT NULL,
	[PotId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Predator]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Predator](
	[PredatorId] [int] NOT NULL,
	[FishId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreferenceResource]     ******/
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
/****** Object:  Table [dbo].[Resource]     ******/
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
/****** Object:  Table [dbo].[Rock]     ******/
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
/****** Object:  Table [dbo].[Role]     ******/
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
/****** Object:  Table [dbo].[Socket]     ******/
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
/****** Object:  Table [dbo].[SpotLight]     ******/
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
/****** Object:  Table [dbo].[SpotLightLamp]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpotLightLamp](
	[SpotLightId] [int] NOT NULL,
	[LampId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tank]     ******/
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
/****** Object:  Table [dbo].[TankDecor]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TankDecor](
	[TankId] [int] NOT NULL,
	[DecorId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TankFish]     ******/
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
/****** Object:  Table [dbo].[User]     ******/
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
/****** Object:  Table [dbo].[UserPreference]     ******/
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
/****** Object:  Table [dbo].[UserRole]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WaterPump]     ******/
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
/****** Object:  Table [dbo].[Product]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[SpotLightId] [int] NULL,
	[TankId] [int] NOT NULL,
	[PotId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO