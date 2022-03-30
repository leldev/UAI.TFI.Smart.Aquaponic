USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_CreateFish]
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