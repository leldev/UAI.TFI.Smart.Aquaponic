USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_UpdateCommunication]
GO

CREATE PROCEDURE [dbo].[USP_UpdateCommunication]
    (
    @CommunicationId            INT,
    @Response                   NVARCHAR(MAX),
    @ModifiedDate               DATETIME2(7)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = c.[ModifiedDate]
FROM [dbo].[Communication] c
WHERE c.[CommunicationId] = @CommunicationId

IF (@CurrentModifiedDate IS NULL)
BEGIN
    /******************* Not found *******************/
    ROLLBACK
    SELECT -2
    RETURN
END
ELSE
BEGIN
    IF (@CurrentModifiedDate = @ModifiedDate)
    BEGIN
        /******************* Update *******************/
        UPDATE [dbo].[Communication]
        SET 
        [Response] = @Response, 
        [IsAnswered] = 1, 
        [ModifiedDate] = GETDATE()
        WHERE [CommunicationId] = @CommunicationId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @CommunicationId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END