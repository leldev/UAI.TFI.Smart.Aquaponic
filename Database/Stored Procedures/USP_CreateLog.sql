USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_CreateLog]
GO

CREATE PROCEDURE [dbo].[USP_CreateLog]
    (
    @Message            NVARCHAR(MAX),
    @Ip                 NVARCHAR(MAX),
    @EventId            INT,
    @UserId             INT = NULL
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

INSERT INTO [dbo].[Log]
    ([Message], [Ip], [UserId], [Hash], [EventId], [CreatedDate], [ModifiedDate])
VALUES
    (@Message, @Ip, @UserId, 0, @EventId, GETDATE(), GETDATE())
SET @NewId = SCOPE_IDENTITY();

IF @@ERROR <> 0
    BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @NewId