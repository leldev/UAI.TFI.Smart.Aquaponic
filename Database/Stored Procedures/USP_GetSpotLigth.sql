USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetSpotLight]
GO

CREATE PROCEDURE [dbo].[USP_GetSpotLight]
    (
    @SpotLightId             INT
)
AS

SET NOCOUNT ON;

SELECT
    s.[SpotLightId], s.[Slots], s.[Name], s.[Heigth], s.[Length], s.[SocketId], s.[Width], s.[CreatedDate], s.[ModifiedDate], l.[LampId] as LampId, l.[Name] as LampName
FROM [dbo].[SpotLight] s
    INNER JOIN [dbo].[SpotLightLamp] sl ON sl.SpotLightId = s.SpotLightId
    INNER JOIN [dbo].[Lamp] l ON l.LampId = sl.LampId
WHERE s.[SpotLightId] = @SpotLightId