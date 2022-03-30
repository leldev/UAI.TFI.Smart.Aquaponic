USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetDecors]
GO

CREATE PROCEDURE [dbo].[USP_GetDecors]
AS

SET NOCOUNT ON;

SELECT
    d.[DecorId], d.[Name], d.[Type], d.[Volume], d.[CreatedDate], d.[ModifiedDate]
FROM [dbo].[Decor] d
