USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetLamps]
GO

CREATE PROCEDURE [dbo].[USP_GetLamps]
AS

SET NOCOUNT ON;

SELECT
    l.[LampId], l.[Lumen], l.[Name], l.[Power], l.[SocketId], l.[CreatedDate], l.[ModifiedDate]
FROM [dbo].[Lamp] l
