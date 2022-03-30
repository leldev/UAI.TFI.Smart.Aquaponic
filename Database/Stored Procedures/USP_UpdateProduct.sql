USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_UpdateProduct]
GO

CREATE PROCEDURE [dbo].[USP_UpdateProduct]
    (
    @ProductId               INT,
    @ModifiedDate              DATETIME2(7),
    @Name                      NVARCHAR(50),
    @TankId                    INT,
    @PotId                     INT,
    @SpotLightId               INT = NULL
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = p.[ModifiedDate]
FROM [dbo].[Product] p
WHERE p.[ProductId] = @ProductId

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
        UPDATE [dbo].[Product]
        SET 
        [Name] = @Name, 
        [PotId] = @PotId,
        [SpotLightId] = @SpotLightId,
        [TankId] = @TankId,
        [ModifiedDate] = GETDATE()
        WHERE [ProductId] = @ProductId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @ProductId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END