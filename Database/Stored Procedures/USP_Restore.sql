USE [master]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_Restore]
GO

CREATE PROCEDURE [dbo].[USP_Restore]
    (
    @Disk           NVARCHAR(MAX) = ''
)
AS

SET NOCOUNT ON;

DECLARE @Command NVARCHAR(MAX)

PRINT @Disk

SET @Command= 'USE [master] ALTER DATABASE [SmartAquaponic] SET SINGLE_USER WITH ROLLBACK IMMEDIATE RESTORE DATABASE [SmartAquaponic] FROM ' + @Disk + ' WITH REPLACE'

PRINT @Command

EXEC (@Command)

SELECT 102