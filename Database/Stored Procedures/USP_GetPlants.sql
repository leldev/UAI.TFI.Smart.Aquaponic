USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetPlants]
GO

CREATE PROCEDURE [dbo].[USP_GetPlants]
AS

SET NOCOUNT ON;

SELECT
    p.[PlantId], p.[IsHydroponic], p.[IsLowLight], p.[Name], p.[CreatedDate], p.[ModifiedDate]
FROM [dbo].[Plant] p
