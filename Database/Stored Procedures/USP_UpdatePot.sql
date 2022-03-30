USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_UpdatePot]
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