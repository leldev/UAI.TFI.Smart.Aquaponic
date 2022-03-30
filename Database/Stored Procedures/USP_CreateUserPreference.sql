USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_CreateUserPreference]
GO

CREATE PROCEDURE [dbo].[USP_CreateUserPreference]
    (
    @Name               NVARCHAR(MAX),
    @DateFormat         NVARCHAR(MAX),
    @TimeZone           NVARCHAR(MAX)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[UserPreference] u
WHERE u.[Name] = @Name)
BEGIN
    /******************* Already exist *******************/
    ROLLBACK
    SELECT -4
    RETURN
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[UserPreference]
        ([Name], [DateFormat], [TimeZone], [IsDefault], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, @DateFormat, @TimeZone, 0, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    /******************* Relate *******************/
    INSERT INTO [dbo].[PreferenceResource]
        ([UserPreferenceId], [ResourceId], [Value])
    SELECT @NewId, pr.[ResourceId], pr.[Value]
    FROM [dbo].[PreferenceResource] pr
    WHERE pr.[UserPreferenceId] = 1

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT
    SELECT @NewId
END