USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_UpdateUser]
GO

CREATE PROCEDURE [dbo].[USP_UpdateUser]
    (
    @UserId                 INT,
    @Name                   NVARCHAR(MAX),
    @LastName               NVARCHAR(MAX),
    @UserPreferenceId       INT,
    @ModifiedDate           DATETIME2(7),
    @Roles                  [dbo].[TTListInt] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = u.[ModifiedDate]
FROM [dbo].[User] u
WHERE u.[UserId] = @UserId

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
        DELETE FROM [dbo].[UserRole]
        WHERE [UserId] = @UserId

        /******************* Relate *******************/
        INSERT INTO [dbo].[UserRole]
            ([UserId], [RoleId])
        SELECT @UserId, r.[CommonValue]
        FROM @Roles r

        /******************* Update *******************/
        UPDATE [dbo].[User]
        SET 
        [Name] = @Name, 
        [LastName] = @LastName,
        [UserPreferenceId] = @UserPreferenceId,
        [ModifiedDate] = GETDATE()
        WHERE [UserId] = @UserId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @UserId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END