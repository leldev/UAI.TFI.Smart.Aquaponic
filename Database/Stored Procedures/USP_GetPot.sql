USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetPot]
GO

CREATE PROCEDURE [dbo].[USP_GetPot]
    (
    @PotId             INT
)
AS

SET NOCOUNT ON;

SELECT
    p.[Heigth], p.[Length], p.[Name], p.[PotId], p.[Rgb], p.[RockId], p.[Width], p.[CreatedDate], p.[ModifiedDate],
    pl.[PlantId], pl.[Name] PlantName, pl.[IsHydroponic], pl.[IsLowLight]
FROM [dbo].[Pot] p
    LEFT JOIN [dbo].[PotPlant] pp ON pp.[PotId] = p.[PotId]
    LEFT JOIN [dbo].[Plant] pl ON pl.[PlantId] = pp.[PlantId]
WHERE p.[PotId] = @PotId