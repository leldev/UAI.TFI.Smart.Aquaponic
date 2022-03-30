USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetPlant]
GO

CREATE PROCEDURE [dbo].[USP_GetPlant]
    (
    @PlantId             INT
)
AS

SET NOCOUNT ON;

SELECT
    p.[PlantId], p.[IsHydroponic], p.[IsLowLight], p.[Name], p.[CreatedDate], p.[ModifiedDate]
FROM [dbo].[Plant] p
WHERE p.[PlantId] = @PlantId