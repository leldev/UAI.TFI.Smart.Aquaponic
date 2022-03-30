USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_DeleteWaterPump]
GO

CREATE PROCEDURE [dbo].[USP_DeleteWaterPump]
    (
    @WaterPumpId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[WaterPump]
    WHERE [WaterPumpId] = @WaterPumpId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @WaterPumpId