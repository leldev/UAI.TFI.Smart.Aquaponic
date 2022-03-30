USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetRoles]
GO

CREATE PROCEDURE [dbo].[USP_GetRoles]
    (
    @UserId            INT = NULL
)
AS

SET NOCOUNT ON;

IF (@UserId IS NULL)
BEGIN
    SELECT *
    FROM [dbo].[Role] r
    WHERE r.[RoleId] <= 100
    ORDER BY r.[RoleID]
END
ELSE
BEGIN
    SELECT *
    FROM [dbo].[Role] r
        LEFT JOIN dbo.[UserRole] ur ON ur.[RoleId] = r.[RoleId]
        LEFT JOIN dbo.[User] u ON u.[UserId] = ur.[UserId]
    WHERE r.[RoleId] <= 100 AND u.[UserId] = @UserId
    ORDER BY r.[RoleID]
END
