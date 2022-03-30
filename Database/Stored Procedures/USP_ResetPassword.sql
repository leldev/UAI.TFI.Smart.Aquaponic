USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_ResetPassword]
GO

CREATE PROCEDURE [dbo].[USP_ResetPassword]
    (
    @UserId                     INT = 0,
    @Password                   NVARCHAR(MAX)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION

IF EXISTS 
(SELECT 1
FROM [dbo].[User] u
WHERE u.[UserId] = @UserId)
BEGIN
    /******************* Update *******************/
    UPDATE [dbo].[User]
    SET 
    [Password] = @Password,
    [TempPassword] = ''
    WHERE [UserId] = @UserId
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

SELECT @UserId