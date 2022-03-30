USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_Backup]
GO

CREATE PROCEDURE [dbo].[USP_Backup]
    (
    @Disk           NVARCHAR(MAX)
)
AS

SET NOCOUNT ON;

DECLARE @Command NVARCHAR(MAX)

PRINT @Disk

SET @Command= 'BACKUP DATABASE [SmartAquaponic] TO ' + @Disk + ' WITH NOFORMAT, NOINIT, SKIP, NOREWIND, NOUNLOAD,  STATS = 10'

PRINT @Command

EXEC (@Command)

SELECT 101