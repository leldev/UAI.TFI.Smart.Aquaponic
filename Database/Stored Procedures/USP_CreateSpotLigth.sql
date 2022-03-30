USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_CreateSpotLight]
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