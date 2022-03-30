USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetCommunications]
GO

CREATE PROCEDURE [dbo].[USP_GetCommunications]
AS

SET NOCOUNT ON;

SELECT
    c.[CommunicationId], c.[Email], c.[IsAnswered], c.[Message], c.[Name], c.[Response], c.[CreatedDate], c.[ModifiedDate]
FROM [dbo].[Communication] c
