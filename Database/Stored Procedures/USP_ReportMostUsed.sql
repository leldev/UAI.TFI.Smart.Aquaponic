USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_ReportMostUsed]
GO

CREATE PROCEDURE [dbo].[USP_ReportMostUsed]
AS

SET NOCOUNT ON;

SELECT
    x.[DecorId] [Id], x.[Name], 'Decor' [Type], COUNT(*) [Cant]
FROM [dbo].[Decor] x
    INNER JOIN [dbo].[TankDecor] y ON y.[DecorId] = x.[DecorId]
GROUP BY  x.[DecorId], x.[Name]

SELECT
    x.[FishId] [Id], x.[Name], 'Fish' [Type], COUNT(*) [Cant]
FROM [dbo].[Fish] x
    INNER JOIN [dbo].[TankFish] y ON y.[FishId] = x.[FishId]
GROUP BY  x.[FishId], x.[Name]

SELECT
    x.[WaterPumpId] [Id], x.[Name], 'Water pump' [Type], COUNT(*) [Cant]
FROM [dbo].[WaterPump] x
    INNER JOIN [dbo].[Tank] y ON y.[WaterPumpId] = x.[WaterPumpId]
GROUP BY  x.[WaterPumpId], x.[Name]

SELECT
    x.[PlantId] [Id], x.[Name], 'Plant' [Type], COUNT(*) [Cant]
FROM [dbo].[Plant] x
    INNER JOIN [dbo].[PotPlant] y ON y.[PlantId] = x.[PlantId]
GROUP BY  x.[PlantId], x.[Name]

SELECT
    x.[LampId] [Id], x.[Name], 'Lamp' [Type], COUNT(*) [Cant]
FROM [dbo].[Lamp] x
    INNER JOIN [dbo].[SpotLightLamp] y ON y.[LampId] = x.[LampId]
GROUP BY  x.[LampId], x.[Name]

SELECT
    x.[TankId] [Id], x.[Name], 'Tank' [Type], COUNT(*) [Cant]
FROM [dbo].[Tank] x
    INNER JOIN [dbo].[Product] y ON y.[TankId] = x.[TankId]
GROUP BY  x.[TankId], x.[Name]

SELECT
    x.[PotId] [Id], x.[Name], 'Pot' [Type], COUNT(*) [Cant]
FROM [dbo].[Pot] x
    INNER JOIN [dbo].[Product] y ON y.[PotId] = x.[PotId]
GROUP BY  x.[PotId], x.[Name]

SELECT
    x.[SpotLightId] [Id], x.[Name], 'SpotLight' [Type], COUNT(*) [Cant]
FROM [dbo].[SpotLight] x
    INNER JOIN [dbo].[Product] y ON y.[SpotLightId] = x.[SpotLightId]
GROUP BY  x.[SpotLightId], x.[Name]