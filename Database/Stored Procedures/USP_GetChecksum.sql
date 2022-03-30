USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetChecksum]
GO

CREATE PROCEDURE [dbo].[USP_GetChecksum]
AS

SET NOCOUNT ON;

SELECT
    c.[ChecksumId], c.[CreatedDate], c.[Hash], c.[ModifiedDate], c.[Table]
FROM [dbo].[Checksum] c