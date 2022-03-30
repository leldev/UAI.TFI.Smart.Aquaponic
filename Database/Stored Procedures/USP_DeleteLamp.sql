USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_DeleteLamp]
GO

CREATE PROCEDURE [dbo].[USP_DeleteLamp]
    (
    @LampId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[Lamp]
    WHERE [LampId] = @LampId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @LampId