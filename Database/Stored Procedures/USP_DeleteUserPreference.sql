USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_DeleteUserPreference]
GO

CREATE PROCEDURE [dbo].[USP_DeleteUserPreference]
    (
    @UserPreferenceId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

IF (@UserPreferenceId > 1)
BEGIN
    DELETE FROM [dbo].[PreferenceResource]
    WHERE [UserPreferenceId] = @UserPreferenceId

    DELETE FROM [dbo].[UserPreference]
    WHERE [UserPreferenceId] = @UserPreferenceId

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
    ROLLBACK
    SELECT -5
    RETURN
END