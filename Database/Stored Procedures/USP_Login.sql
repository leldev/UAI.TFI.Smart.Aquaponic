USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_Login]
GO

CREATE PROCEDURE [dbo].[USP_Login]
    (
    @Username           NVARCHAR(MAX)
)
AS

SET NOCOUNT ON;

SELECT
    u.[UserId], u.[Hash], u.[IsLocked], u.[IsDeleted], u.[Name], u.[LastName], u.[Password], u.[Username], u.[Email], u.[LoginAttempts], u.[UserPreferenceId], u.[TempPassword], u.[CreatedDate], u.[ModifiedDate]
FROM [dbo].[User] u
WHERE u.[Username] = @Username AND u.[IsDeleted] = 0