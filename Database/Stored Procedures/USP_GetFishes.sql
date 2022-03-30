USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetFishes]
GO

CREATE PROCEDURE [dbo].[USP_GetFishes]
AS

SET NOCOUNT ON;

SELECT
    f.[FishId], f.[IsLonely], f.[Name], f.[PhId], f.[Size], f.[Temp], f.[WaterRequired], f.[CreatedDate], f.[ModifiedDate], fp.[FishId] as PredatorId, fp.[Name] as PredatorName
FROM [dbo].[Fish] f
    LEFT JOIN [dbo].[Predator] p ON p.FishId = f.FishId
    LEFT JOIN [dbo].[Fish] fp ON fp.FishId = p.PredatorId
