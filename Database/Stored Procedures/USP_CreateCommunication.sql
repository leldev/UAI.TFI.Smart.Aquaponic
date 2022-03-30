USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_CreateCommunication]
GO

CREATE PROCEDURE [dbo].[USP_CreateCommunication]
    (
    @Message                NVARCHAR(MAX),
    @Name                   NVARCHAR(MAX),
    @Email                  NVARCHAR(MAX)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

INSERT INTO [dbo].[Communication]
    ([Message], [Email], [IsAnswered], [Name], [CreatedDate], [ModifiedDate])
VALUES
    (@Message, @Email, 0, @Name, GETDATE(), GETDATE())
SET @NewId = SCOPE_IDENTITY();

IF @@ERROR <> 0
    BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @NewId