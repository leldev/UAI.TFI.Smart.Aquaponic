USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetUserPreference]
GO

CREATE PROCEDURE [dbo].[USP_GetUserPreference]
    (
    @UserPreferenceId            INT
)
AS

SET NOCOUNT ON;

SELECT up.[UserPreferenceId], up.[IsDefault], up.[DateFormat], up.[Name], up.[TimeZone], up.[CreatedDate], up.[ModifiedDate]
FROM [dbo].[UserPreference] up
WHERE up.[UserPreferenceId] = @UserPreferenceId

SELECT pr.[UserPreferenceId], r.[ResourceId], r.[Key], pr.[Value], r.[CreatedDate], r.[ModifiedDate]
FROM dbo.[PreferenceResource] pr
    INNER JOIN dbo.[Resource] r on r.[ResourceId] = pr.[ResourceId]
WHERE pr.[UserPreferenceId] = @UserPreferenceId