USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_UpdatePlant]
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