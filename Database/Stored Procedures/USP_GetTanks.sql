USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetTanks]
GO

CREATE PROCEDURE [dbo].[USP_GetTanks]
AS

SET NOCOUNT ON;

SELECT
    t.[TankId], t.[WaterTemp], t.[Name], t.[Heigth], t.[Length], t.[PhId], t.[WaterPumpId], t.[Width], t.[CreatedDate], t.[ModifiedDate], w.[Name] WaterPumpName
FROM [dbo].[Tank] t
    INNER JOIN [dbo].[WaterPump] w ON w.[WaterPumpId] = t.[WaterPumpId]

SELECT tf.[FishId], tf.[TankId], tf.[Cant], f.[Name]
FROM [dbo].[TankFish] tf
    INNER JOIN [dbo].[Fish] f ON f.[FishId] = tf.[FishId]

SELECT td.[DecorId], td.[TankId], d.[Name]
FROM [dbo].[TankDecor] td
    INNER JOIN [dbo].[Decor] d ON d.[DecorId] = td.[DecorId]