USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_GetLogs]
GO

CREATE PROCEDURE [dbo].[USP_GetLogs]
AS

SET NOCOUNT ON;

SELECT l.[LogId], l.[Hash], l.[UserId], l.[EventId], l.[Ip], l.[Message], l.[CreatedDate], l.[ModifiedDate], u.[Name], u.[LastName]
FROM [dbo].[Log] l
    LEFT JOIN dbo.[User] u on u.[UserId] = l.[UserId]