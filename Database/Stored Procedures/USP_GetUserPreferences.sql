USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetUserPreferences]
GO

CREATE PROCEDURE [dbo].[USP_GetUserPreferences]
AS

SET NOCOUNT ON;

SELECT up.[UserPreferenceId], up.[IsDefault], up.[DateFormat], up.[Name], up.[TimeZone], up.[CreatedDate], up.[ModifiedDate]
FROM [dbo].[UserPreference] up
