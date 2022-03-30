USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetDecor]
GO

CREATE PROCEDURE [dbo].[USP_GetDecor]
    (
    @DecorId            INT
)
AS

SET NOCOUNT ON;

SELECT
    d.[DecorId], d.[Name], d.[Type], d.[Volume], d.[CreatedDate], d.[ModifiedDate]
FROM [dbo].[Decor] d
WHERE d.[DecorId] = @DecorId