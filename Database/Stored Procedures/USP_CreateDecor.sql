USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_CreateDecor]
GO

CREATE PROCEDURE [dbo].[USP_CreateDecor]
    (
    @Name               NVARCHAR(50),
    @Type               NVARCHAR(50),
    @Volume             DECIMAL(18, 2)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[Decor] d
WHERE d.[Name] = @Name)
BEGIN
    /******************* Already exist *******************/
    ROLLBACK
    SELECT -4
    RETURN
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[Decor]
        ([Name], [Type], [Volume], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, @Type, @Volume, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT
    
    SELECT @NewId
END