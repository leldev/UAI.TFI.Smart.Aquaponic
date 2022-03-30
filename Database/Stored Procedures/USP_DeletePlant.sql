USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_DeletePlant]
GO

CREATE PROCEDURE [dbo].[USP_DeletePlant]
    (
    @PlantId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[Plant]
    WHERE [PlantId] = @PlantId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @PlantId