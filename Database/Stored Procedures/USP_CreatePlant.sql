USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_CreatePlant]
GO

CREATE PROCEDURE [dbo].[USP_CreatePlant]
    (
    @Name                       NVARCHAR(50),
    @IsHydroponic               BIT,
    @IsLowLight                 BIT
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[Plant] p
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
    INSERT INTO [dbo].[Plant]
        ([Name], [IsHydroponic], [IsLowLight], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, @IsHydroponic, @IsLowLight, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT
    
    SELECT @NewId
END