USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_UpdateLamp]
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