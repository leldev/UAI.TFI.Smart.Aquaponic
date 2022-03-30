USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetProducts]
GO

CREATE PROCEDURE [dbo].[USP_GetProducts]
AS

SET NOCOUNT ON;

SELECT
    p.[ProductId], p.[TankId], p.[Name], p.[PotId], p.[SpotLightId], p.[CreatedDate], p.[ModifiedDate],
    t.[Name] TankName, po.[Name] PotName, s.[Name] SpotLightName
FROM [dbo].[Product] p
    INNER JOIN [dbo].[Tank] t ON t.[TankId] = p.[TankId]
    INNER JOIN [dbo].[Pot] po ON po.[PotId] = p.[PotId]
    LEFT JOIN [dbo].[SpotLight] s ON s.[SpotLightId] = p.[SpotLightId]