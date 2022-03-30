USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_UpdateTank]
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