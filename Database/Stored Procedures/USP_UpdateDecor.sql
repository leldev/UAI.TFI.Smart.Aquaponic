USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_UpdateDecor]
GO

CREATE PROCEDURE [dbo].[USP_UpdateDecor]
    (
    @DecorId            INT,
    @Name               NVARCHAR(50),
    @ModifiedDate       DATETIME2(7),
    @Type               NVARCHAR(50),
    @Volume             DECIMAL(18, 2)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = d.[ModifiedDate]
FROM [dbo].[Decor] d
WHERE d.[DecorId] = @DecorId

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
        UPDATE [dbo].[Decor]
        SET 
        [Name] = @Name, 
        [Type] = @Type, 
        [Volume] = @Volume, 
        [ModifiedDate] = GETDATE()
        WHERE [DecorId] = @DecorId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @DecorId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END