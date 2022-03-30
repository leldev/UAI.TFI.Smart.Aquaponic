USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetGroups]
GO

CREATE PROCEDURE [dbo].[USP_GetGroups]
    (
    @UserId            INT = NULL
)
AS

SET NOCOUNT ON;

IF (@UserId IS NULL)
BEGIN
    SELECT r.[RoleID] GroupId, r.[Name] GroupName, g.[RoleId] RoleId, ro.[Name] RoleName, r.[CreatedDate], r.[ModifiedDate]
    FROM [dbo].[Role] r
        LEFT JOIN [dbo].[Group] g ON g.[GroupId] = r.[RoleId]
        LEFT JOIN [dbo].[Role] ro ON ro.[RoleId] = g.[RoleId]
    WHERE r.[RoleId] > 100
    ORDER BY r.[RoleID]
END
ELSE
BEGIN
    SELECT r.[RoleID] GroupId, r.[Name] GroupName, g.[RoleId] RoleId, ro.[Name] RoleName, r.[CreatedDate], r.[ModifiedDate]
    FROM [dbo].[Role] r
        LEFT JOIN [dbo].[Group] g ON g.[GroupId] = r.[RoleId]
        LEFT JOIN [dbo].[Role] ro ON ro.[RoleId] = g.[RoleId]
        LEFT JOIN dbo.[UserRole] ur ON ur.[RoleId] = r.[RoleId]
        LEFT JOIN dbo.[User] u ON u.[UserId] = ur.[UserId]
    WHERE r.[RoleId] > 100 AND u.[UserId] = @UserId
    ORDER BY r.[RoleID]
END