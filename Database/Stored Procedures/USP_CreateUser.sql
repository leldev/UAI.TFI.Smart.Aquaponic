USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_CreateUser]
GO

CREATE PROCEDURE [dbo].[USP_CreateUser]
    (
    @Name               NVARCHAR(255),
    @LastName           NVARCHAR(255),
    @Username           NVARCHAR(MAX),
    @Email              NVARCHAR(255),
    @Password           NVARCHAR(MAX),
    @UserPreferenceId   INT,
    @Roles              [dbo].[TTListInt] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[User] u
WHERE u.[Username] = @Username OR u.[Email] = @Email)
BEGIN
    /******************* Already exist *******************/
    ROLLBACK
    SELECT -4
    RETURN
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[User]
        ([Name], [Hash], [LastName], [Password], [Username], [Email], [IsDeleted], [IsLocked], [UserPreferenceId], [LoginAttempts], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, 0, @LastName, @Password, @Username, @Email, 0, 0, @UserPreferenceId, 0, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    /******************* Relate *******************/
    INSERT INTO [dbo].[UserRole]
        ([UserId], [RoleId])
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