USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetWaterPumps]
GO

CREATE PROCEDURE [dbo].[USP_GetWaterPumps]
AS

SET NOCOUNT ON;

SELECT
    w.[WaterPumpId], w.[FlowRate], w.[Name], w.[Power], w.[Volume], w.[CreatedDate], w.[ModifiedDate]
FROM [dbo].[WaterPump] w
