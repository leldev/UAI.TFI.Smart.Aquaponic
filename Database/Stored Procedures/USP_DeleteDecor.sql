USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_DeleteDecor]
GO

CREATE PROCEDURE [dbo].[USP_DeleteDecor]
    (
    @DecorId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[Decor]
    WHERE [DecorId] = @DecorId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @DecorId