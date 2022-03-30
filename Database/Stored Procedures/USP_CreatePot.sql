USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_CreatePot]
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