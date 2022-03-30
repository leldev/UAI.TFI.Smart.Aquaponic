USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_CreateGroup]
GO

CREATE PROCEDURE [dbo].[USP_CreateGroup]
    (
    @Name               NVARCHAR(50),
    @Roles              [dbo].[TTListInt] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[Role] r
WHERE r.[Name] = @Name)
BEGIN
    /******************* Already exist *******************/
    ROLLBACK
    SELECT -4
    RETURN
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[Role]
        ([Name], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    /******************* Relate *******************/
    INSERT INTO [dbo].[Group]
        ([GroupId], [RoleId])
    SELECT @NewId, r.[CommonValue]
    FROM @Roles r

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT
    SELECT @NewId
END