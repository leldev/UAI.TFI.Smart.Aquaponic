USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetGroup]
GO

CREATE PROCEDURE [dbo].[USP_GetGroup]
    (
    @GroupId            INT
)
AS

SET NOCOUNT ON;

SELECT r.[RoleID] GroupId, r.[Name] GroupName, g.[RoleId] RoleId, ro.[Name] RoleName, r.[CreatedDate], r.[ModifiedDate]
FROM [dbo].[Role] r
    LEFT JOIN [dbo].[Group] g ON g.[GroupId] = r.[RoleId]
    LEFT JOIN [dbo].[Role] ro ON ro.[RoleId] = g.[RoleId]
WHERE r.[RoleId] = @GroupId