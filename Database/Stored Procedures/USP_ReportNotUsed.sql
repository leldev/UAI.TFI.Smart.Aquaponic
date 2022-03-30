USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_ReportNotUsed]
GO

CREATE PROCEDURE [dbo].[USP_ReportNotUsed]
AS

SET NOCOUNT ON;

SELECT
    x.[DecorId] [Id], x.[Name], 'Decor' [Type]
FROM [dbo].[Decor] x
    LEFT JOIN [dbo].[TankDecor] y ON y.[DecorId] = x.[DecorId]
WHERE y.[TankId] IS NULL

SELECT
    x.[FishId] [Id], x.[Name], 'Fish' [Type]
FROM [dbo].[Fish] x
    LEFT JOIN [dbo].[TankFish] y ON y.[FishId] = x.[FishId]
WHERE y.[FishId] IS NULL

SELECT
    x.[WaterPumpId] [Id], x.[Name], 'Water pump' [Type]
FROM [dbo].[WaterPump] x
    LEFT JOIN [dbo].[Tank] y ON y.[WaterPumpId] = x.[WaterPumpId]
WHERE y.[WaterPumpId] IS NULL

SELECT
    x.[PlantId] [Id], x.[Name], 'Plant' [Type]
FROM [dbo].[Plant] x
    LEFT JOIN [dbo].[PotPlant] y ON y.[PlantId] = x.[PlantId]
WHERE y.[PlantId] IS NULL

SELECT
    x.[LampId] [Id], x.[Name], 'Lamp' [Type]
FROM [dbo].[Lamp] x
    LEFT JOIN [dbo].[SpotLightLamp] y ON y.[LampId] = x.[LampId]
WHERE y.[LampId] IS NULL

SELECT
    x.[TankId] [Id], x.[Name], 'Tank' [Type]
FROM [dbo].[Tank] x
    LEFT JOIN [dbo].[Product] y ON y.[TankId] = x.[TankId]
WHERE y.[TankId] IS NULL

SELECT
    x.[PotId] [Id], x.[Name], 'Pot' [Type]
FROM [dbo].[Pot] x
    LEFT JOIN [dbo].[Product] y ON y.[PotId] = x.[PotId]
WHERE y.[PotId] IS NULL

SELECT
    x.[SpotLightId] [Id], x.[Name], 'SpotLight' [Type]
FROM [dbo].[SpotLight] x
    LEFT JOIN [dbo].[Product] y ON y.[SpotLightId] = x.[SpotLightId]
WHERE y.[SpotLightId] IS NULL