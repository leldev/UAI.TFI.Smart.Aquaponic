USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_RecoveryPassword]
GO

CREATE PROCEDURE [dbo].[USP_RecoveryPassword]
    (
    @UserId                     INT = 0,
    @Email                      NVARCHAR(MAX) = '',
    @TempPassword               NVARCHAR(MAX)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION

IF EXISTS 
(SELECT 1
FROM [dbo].[User] u
WHERE u.[UserId] = @UserId OR u.[Email] = @Email)
BEGIN
    /******************* Update *******************/
    UPDATE [dbo].[User]
    SET 
    [TempPassword] = @TempPassword
    WHERE [UserId] = @UserId OR [Email] = @Email
END
ELSE
BEGIN
    /******************* Not found *******************/
    ROLLBACK
    SELECT -2
    RETURN
END

IF @@ERROR <> 0
    BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT 1