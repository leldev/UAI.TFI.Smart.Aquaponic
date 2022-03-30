USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_UpdateSpotLight]
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