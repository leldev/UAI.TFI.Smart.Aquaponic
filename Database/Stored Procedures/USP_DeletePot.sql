USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_DeletePot]
GO

CREATE PROCEDURE [dbo].[USP_DeletePot]
    (
    @PotId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[PotPlant]
    WHERE [PotId] =  @PotId

DELETE FROM [dbo].[Pot]
    WHERE [PotId] = @PotId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @PotId