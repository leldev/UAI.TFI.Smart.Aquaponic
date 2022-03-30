USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_UpdateLoginAttempts]
GO

CREATE PROCEDURE [dbo].[USP_UpdateLoginAttempts]
    (
    @UserId                 INT,
    @IsLocked               NVARCHAR(MAX),
    @LoginAttempts          INT
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
UPDATE [dbo].[User]
SET 
    [LoginAttempts] = @LoginAttempts, 
    [IsLocked] = @IsLocked,
    [ModifiedDate] = GETDATE()
WHERE [UserId] = @UserId

IF @@ERROR <> 0
        BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @UserId