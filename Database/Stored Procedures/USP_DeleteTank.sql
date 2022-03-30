USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_DeleteTank]
GO

CREATE PROCEDURE [dbo].[USP_DeleteTank]
    (
    @TankId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[TankDecor]
    WHERE [TankId] =  @TankId

DELETE FROM [dbo].[TankFish]
    WHERE [TankId] =  @TankId

DELETE FROM [dbo].[Tank]
    WHERE [TankId] =  @TankId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @TankId