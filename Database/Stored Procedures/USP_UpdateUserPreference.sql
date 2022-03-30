USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_UpdateUserPreference]
GO

CREATE PROCEDURE [dbo].[USP_UpdateUserPreference]
    (
    @UserPreferenceId           INT,
    @Name                       NVARCHAR(MAX),
    @DateFormat                 NVARCHAR(MAX),
    @TimeZone                   NVARCHAR(MAX),
    @ModifiedDate               DATETIME2(7),
    @Resources                  [dbo].[TTDictionary] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = u.[ModifiedDate]
FROM [dbo].[UserPreference] u
WHERE u.[UserPreferenceId] = @UserPreferenceId

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
        /******************* Update *******************/
        UPDATE [dbo].[UserPreference]
        SET [DateFormat] = @DateFormat, [Name] = @Name, [TimeZone] = @TimeZone, [ModifiedDate] = GETDATE()
        WHERE [UserPreferenceId] = @UserPreferenceId

        /******************* Update relations *******************/
        UPDATE [dbo].[PreferenceResource]
        SET [Value] = r.[Value]
        FROM @Resources r
            JOIN [dbo].[PreferenceResource] p ON p.[ResourceId] = r.[Key] AND p.[UserPreferenceId] = @UserPreferenceId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @UserPreferenceId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END