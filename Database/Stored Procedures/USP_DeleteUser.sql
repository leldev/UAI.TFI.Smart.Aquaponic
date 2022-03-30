USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_DeleteUser]
GO

CREATE PROCEDURE [dbo].[USP_DeleteUser]
    (
    @UserId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[UserRole]
    WHERE [UserId] = @UserId

UPDATE [dbo].[User]
SET [IsDeleted] = 1
WHERE [UserId] = @UserId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @UserId