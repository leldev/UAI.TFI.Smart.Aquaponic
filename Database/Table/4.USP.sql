USE [SmartAquaponic]
GO
/****** Object:  UserDefinedTableType [dbo].[TTDictionary]    Script Date: 12/2/2020 10:22:13 PM ******/
CREATE TYPE [dbo].[TTDictionary] AS TABLE(
	[Key] [int] NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[TTListInt]    Script Date: 12/2/2020 10:22:13 PM ******/
CREATE TYPE [dbo].[TTListInt] AS TABLE(
	[CommonValue] [int] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[CommonValue] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  StoredProcedure [dbo].[USP_Backup]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_ChecksumLog]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_ChecksumUser]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_CreateCommunication]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_CreateDecor]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_CreateFish]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_CreateGroup]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_CreateLamp]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_CreateLog]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_CreatePlant]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_CreatePot]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_CreateProduct]    Script Date: 12/2/2020 10:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_CreateProduct]
    (
    @Name                      NVARCHAR(50),
    @TankId                    INT,
    @PotId                     INT,
    @SpotLightId               INT = NULL
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[Product] p
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
    INSERT INTO [dbo].[Product]
        ([Name], [PotId], [TankId], [SpotLightId], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, @PotId, @TankId, @SpotLightId, GETDATE(), GETDATE())
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
/****** Object:  StoredProcedure [dbo].[USP_CreateSpotLight]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_CreateTank]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_CreateUser]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_CreateUserPreference]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_CreateWaterPump]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_DeleteDecor]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_DeleteFish]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_DeleteGroup]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_DeleteLamp]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_DeletePlant]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_DeletePot]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_DeleteProduct]    Script Date: 12/2/2020 10:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_DeleteProduct]
    (
    @ProductId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[Product]
    WHERE [ProductId] =  @ProductId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @ProductId
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteSpotLight]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_DeleteTank]    Script Date: 12/2/2020 10:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_DeleteTank]
    (
    @TankId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[TankDecor]
    WHERE [TankId] =  @TankId

DELETE FROM [dbo].[TankFish]
    WHERE [TankId] =  @TankId

DELETE FROM [dbo].[Tank]
    WHERE [TankId] =  @TankId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @TankId
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteUser]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_DeleteUserPreference]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_DeleteWaterPump]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetChecksum]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetCommunication]    Script Date: 12/2/2020 10:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetCommunication]
    (
    @CommunicationId            INT
)
AS

SET NOCOUNT ON;

SELECT
    c.[CommunicationId], c.[Email], c.[IsAnswered], c.[Message], c.[Name], c.[Response], c.[CreatedDate], c.[ModifiedDate]
FROM [dbo].[Communication] c
WHERE c.[CommunicationId] = @CommunicationId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetCommunications]    Script Date: 12/2/2020 10:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetCommunications]
AS

SET NOCOUNT ON;

SELECT
    c.[CommunicationId], c.[Email], c.[IsAnswered], c.[Message], c.[Name], c.[Response], c.[CreatedDate], c.[ModifiedDate]
FROM [dbo].[Communication] c
GO
/****** Object:  StoredProcedure [dbo].[USP_GetDecor]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetDecors]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetFish]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetFishes]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetGroup]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetGroups]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetLamp]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetLamps]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetLogs]    Script Date: 12/2/2020 10:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_GetLogs]
AS

SET NOCOUNT ON;

SELECT l.[LogId], l.[Hash], l.[UserId], l.[EventId], l.[Ip], l.[Message], l.[CreatedDate], l.[ModifiedDate], u.[Name], u.[LastName]
FROM [dbo].[Log] l
    LEFT JOIN dbo.[User] u on u.[UserId] = l.[UserId]
ORDER BY l.[LogId] DESC
GO
/****** Object:  StoredProcedure [dbo].[USP_GetPlant]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetPlants]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetPot]    Script Date: 12/2/2020 10:22:13 PM ******/
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
    pl.[PlantId], pl.[Name] PlantName, pl.[IsHydroponic], pl.[IsLowLight]
FROM [dbo].[Pot] p
    LEFT JOIN [dbo].[PotPlant] pp ON pp.[PotId] = p.[PotId]
    LEFT JOIN [dbo].[Plant] pl ON pl.[PlantId] = pp.[PlantId]
WHERE p.[PotId] = @PotId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetPots]    Script Date: 12/2/2020 10:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetPots]
AS

SET NOCOUNT ON;

SELECT
    p.[Heigth], p.[Length], p.[Name], p.[PotId], p.[Rgb], p.[RockId], p.[Width], p.[CreatedDate], p.[ModifiedDate],
    pl.[PlantId], pl.[Name] PlantName, pl.[IsHydroponic], pl.[IsLowLight]
FROM [dbo].[Pot] p
    LEFT JOIN [dbo].[PotPlant] pp ON pp.[PotId] = p.[PotId]
    LEFT JOIN [dbo].[Plant] pl ON pl.[PlantId] = pp.[PlantId]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetProduct]    Script Date: 12/2/2020 10:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetProduct]
    (
    @ProductId             INT
)
AS

SET NOCOUNT ON;

SELECT
    p.[ProductId], p.[TankId], p.[Name], p.[PotId], p.[SpotLightId], p.[CreatedDate], p.[ModifiedDate],
    t.[Name] TankName, po.[Name] PotName, s.[Name] SpotLightName
FROM [dbo].[Product] p
    INNER JOIN [dbo].[Tank] t ON t.[TankId] = p.[TankId]
    INNER JOIN [dbo].[Pot] po ON po.[PotId] = p.[PotId]
    LEFT JOIN [dbo].[SpotLight] s ON s.[SpotLightId] = p.[SpotLightId]
WHERE p.[ProductId] = @ProductId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetProducts]    Script Date: 12/2/2020 10:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_GetProducts]
AS

SET NOCOUNT ON;

SELECT
    p.[ProductId], p.[TankId], p.[Name], p.[PotId], p.[SpotLightId], p.[CreatedDate], p.[ModifiedDate],
    t.[Name] TankName, po.[Name] PotName, s.[Name] SpotLightName
FROM [dbo].[Product] p
    INNER JOIN [dbo].[Tank] t ON t.[TankId] = p.[TankId]
    INNER JOIN [dbo].[Pot] po ON po.[PotId] = p.[PotId]
    LEFT JOIN [dbo].[SpotLight] s ON s.[SpotLightId] = p.[SpotLightId]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetRoles]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetSpotLight]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetSpotLights]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetTank]    Script Date: 12/2/2020 10:22:13 PM ******/
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

SELECT tf.[FishId], tf.[TankId], tf.[Cant], f.[Name]
FROM [dbo].[TankFish] tf
    INNER JOIN [dbo].[Fish] f ON f.[FishId] = tf.[FishId]
WHERE tf.[TankId] = @TankId
    
SELECT td.[DecorId], td.[TankId], d.[Name]
FROM [dbo].[TankDecor] td
    INNER JOIN [dbo].[Decor] d ON d.[DecorId] = td.[DecorId]
WHERE td.[TankId] = @TankId
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTanks]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetUser]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetUserPreference]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetUserPreferences]    Script Date: 12/2/2020 10:22:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetUsers]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetWaterPump]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetWaterPumps]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_RecoveryPassword]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_RecoveryUser]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_ReportMostUsed]    Script Date: 12/2/2020 10:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ReportMostUsed]
AS

SET NOCOUNT ON;

SELECT
    x.[DecorId] [Id], x.[Name], 'Decor' [Type], COUNT(*) [Cant]
FROM [dbo].[Decor] x
    INNER JOIN [dbo].[TankDecor] y ON y.[DecorId] = x.[DecorId]
GROUP BY  x.[DecorId], x.[Name]

SELECT
    x.[FishId] [Id], x.[Name], 'Fish' [Type], COUNT(*) [Cant]
FROM [dbo].[Fish] x
    INNER JOIN [dbo].[TankFish] y ON y.[FishId] = x.[FishId]
GROUP BY  x.[FishId], x.[Name]

SELECT
    x.[WaterPumpId] [Id], x.[Name], 'Water pump' [Type], COUNT(*) [Cant]
FROM [dbo].[WaterPump] x
    INNER JOIN [dbo].[Tank] y ON y.[WaterPumpId] = x.[WaterPumpId]
GROUP BY  x.[WaterPumpId], x.[Name]

SELECT
    x.[PlantId] [Id], x.[Name], 'Plant' [Type], COUNT(*) [Cant]
FROM [dbo].[Plant] x
    INNER JOIN [dbo].[PotPlant] y ON y.[PlantId] = x.[PlantId]
GROUP BY  x.[PlantId], x.[Name]

SELECT
    x.[LampId] [Id], x.[Name], 'Lamp' [Type], COUNT(*) [Cant]
FROM [dbo].[Lamp] x
    INNER JOIN [dbo].[SpotLightLamp] y ON y.[LampId] = x.[LampId]
GROUP BY  x.[LampId], x.[Name]

SELECT
    x.[TankId] [Id], x.[Name], 'Tank' [Type], COUNT(*) [Cant]
FROM [dbo].[Tank] x
    INNER JOIN [dbo].[Product] y ON y.[TankId] = x.[TankId]
GROUP BY  x.[TankId], x.[Name]

SELECT
    x.[PotId] [Id], x.[Name], 'Pot' [Type], COUNT(*) [Cant]
FROM [dbo].[Pot] x
    INNER JOIN [dbo].[Product] y ON y.[PotId] = x.[PotId]
GROUP BY  x.[PotId], x.[Name]

SELECT
    x.[SpotLightId] [Id], x.[Name], 'SpotLight' [Type], COUNT(*) [Cant]
FROM [dbo].[SpotLight] x
    INNER JOIN [dbo].[Product] y ON y.[SpotLightId] = x.[SpotLightId]
GROUP BY  x.[SpotLightId], x.[Name]
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportNotUsed]    Script Date: 12/2/2020 10:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ReportNotUsed]
AS

SET NOCOUNT ON;

SELECT
    x.[DecorId] [Id], x.[Name], 'Decor' [Type]
FROM [dbo].[Decor] x
    LEFT JOIN [dbo].[TankDecor] y ON y.[DecorId] = x.[DecorId]
WHERE y.[TankId] IS NULL

SELECT
    x.[FishId] [Id], x.[Name], 'Fish' [Type]
FROM [dbo].[Fish] x
    LEFT JOIN [dbo].[TankFish] y ON y.[FishId] = x.[FishId]
WHERE y.[FishId] IS NULL

SELECT
    x.[WaterPumpId] [Id], x.[Name], 'Water pump' [Type]
FROM [dbo].[WaterPump] x
    LEFT JOIN [dbo].[Tank] y ON y.[WaterPumpId] = x.[WaterPumpId]
WHERE y.[WaterPumpId] IS NULL

SELECT
    x.[PlantId] [Id], x.[Name], 'Plant' [Type]
FROM [dbo].[Plant] x
    LEFT JOIN [dbo].[PotPlant] y ON y.[PlantId] = x.[PlantId]
WHERE y.[PlantId] IS NULL

SELECT
    x.[LampId] [Id], x.[Name], 'Lamp' [Type]
FROM [dbo].[Lamp] x
    LEFT JOIN [dbo].[SpotLightLamp] y ON y.[LampId] = x.[LampId]
WHERE y.[LampId] IS NULL

SELECT
    x.[TankId] [Id], x.[Name], 'Tank' [Type]
FROM [dbo].[Tank] x
    LEFT JOIN [dbo].[Product] y ON y.[TankId] = x.[TankId]
WHERE y.[TankId] IS NULL

SELECT
    x.[PotId] [Id], x.[Name], 'Pot' [Type]
FROM [dbo].[Pot] x
    LEFT JOIN [dbo].[Product] y ON y.[PotId] = x.[PotId]
WHERE y.[PotId] IS NULL

SELECT
    x.[SpotLightId] [Id], x.[Name], 'SpotLight' [Type]
FROM [dbo].[SpotLight] x
    LEFT JOIN [dbo].[Product] y ON y.[SpotLightId] = x.[SpotLightId]
WHERE y.[SpotLightId] IS NULL
GO
/****** Object:  StoredProcedure [dbo].[USP_ResetPassword]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UnlockUser]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UpdateCommunication]    Script Date: 12/2/2020 10:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_UpdateCommunication]
    (
    @CommunicationId            INT,
    @Response                   NVARCHAR(MAX),
    @ModifiedDate               DATETIME2(7)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = c.[ModifiedDate]
FROM [dbo].[Communication] c
WHERE c.[CommunicationId] = @CommunicationId

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
        UPDATE [dbo].[Communication]
        SET 
        [Response] = @Response, 
        [IsAnswered] = 1, 
        [ModifiedDate] = GETDATE()
        WHERE [CommunicationId] = @CommunicationId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @CommunicationId
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
/****** Object:  StoredProcedure [dbo].[USP_UpdateDecor]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UpdateFish]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UpdateGroup]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UpdateLamp]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UpdateLoginAttempts]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UpdatePlant]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UpdatePot]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UpdateProduct]    Script Date: 12/2/2020 10:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_UpdateProduct]
    (
    @ProductId               INT,
    @ModifiedDate              DATETIME2(7),
    @Name                      NVARCHAR(50),
    @TankId                    INT,
    @PotId                     INT,
    @SpotLightId               INT = NULL
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = p.[ModifiedDate]
FROM [dbo].[Product] p
WHERE p.[ProductId] = @ProductId

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
        UPDATE [dbo].[Product]
        SET 
        [Name] = @Name, 
        [PotId] = @PotId,
        [SpotLightId] = @SpotLightId,
        [TankId] = @TankId,
        [ModifiedDate] = GETDATE()
        WHERE [ProductId] = @ProductId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @ProductId
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
/****** Object:  StoredProcedure [dbo].[USP_UpdateSpotLight]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UpdateTank]    Script Date: 12/2/2020 10:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[USP_UpdateTank]
    (
    @TankId                    INT,
    @ModifiedDate              DATETIME2(7),
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
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = t.[ModifiedDate]
FROM [dbo].[Tank] t
WHERE t.[TankId] = @TankId

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
        DELETE FROM [dbo].[TankDecor]
            WHERE [TankId] =  @TankId

        DELETE FROM [dbo].[TankFish]
            WHERE [TankId] =  @TankId

        /******************* Relate *******************/
        INSERT INTO [dbo].[TankDecor]
            ([DecorId], [TankId])
        SELECT d.[CommonValue], @TankId
        FROM @Decors d

        INSERT INTO [dbo].[TankFish]
            ([FishId], [TankId], [Cant])
        SELECT f.[Key], @TankId, f.[Value] 
        FROM @Fishes f

        /******************* Update *******************/
        UPDATE [dbo].[Tank]
        SET 
        [Name] = @Name, 
        [WaterTemp] = @WaterTemp, 
        [PhId] = @PhId, 
        [Heigth] = @Heigth, 
        [Length] = @Length, 
        [Width] = @Width, 
        [WaterPumpId] = @WaterPumpId, 
        [ModifiedDate] = GETDATE()
        WHERE [TankId] = @TankId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @TankId
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
/****** Object:  StoredProcedure [dbo].[USP_UpdateUser]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UpdateUserPreference]    Script Date: 12/2/2020 10:22:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UpdateWaterPump]    Script Date: 12/2/2020 10:22:14 PM ******/
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
