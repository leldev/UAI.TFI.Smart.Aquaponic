USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_DeleteFish]
GO

CREATE PROCEDURE [dbo].[USP_DeleteFish]
    (
    @FishId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[Predator]
    WHERE [PredatorId] = @FishId OR [FishId] = @FishId

DELETE FROM [dbo].[Fish]
    WHERE [FishId] = @FishId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @FishId