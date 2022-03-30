USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_CreateTank]
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