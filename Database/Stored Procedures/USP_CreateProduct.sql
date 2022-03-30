USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_CreateProduct]
GO

CREATE PROCEDURE [dbo].[USP_CreateProduct]
    (
    @Name                      NVARCHAR(50),
    @TankId                    INT,
    @PotId                     INT,
    @SpotLightId               INT = NULL
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[Product] p
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
    INSERT INTO [dbo].[Product]
        ([Name], [PotId], [TankId], [SpotLightId], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, @PotId, @TankId, @SpotLightId, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT

    SELECT @NewId
END