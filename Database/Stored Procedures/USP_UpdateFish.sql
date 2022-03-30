USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_UpdateFish]
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