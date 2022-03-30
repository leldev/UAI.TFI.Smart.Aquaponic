USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_UpdateWaterPump]
GO

CREATE PROCEDURE [dbo].[USP_UpdateWaterPump]
    (
    @WaterPumpId                 INT,
    @Name                   NVARCHAR(50),
    @ModifiedDate           DATETIME2(7),
    @FlowRate               INT,
    @Power                  INT,
    @Volume                 DECIMAL(18, 2)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = w.[ModifiedDate]
FROM [dbo].[WaterPump] w
WHERE w.[WaterPumpId] = @WaterPumpId

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
        UPDATE [dbo].[WaterPump]
        SET 
        [Name] = @Name, 
        [FlowRate] = @FlowRate, 
        [Power] = @Power, 
        [Volume] = @Volume, 
        [ModifiedDate] = GETDATE()
        WHERE [WaterPumpId] = @WaterPumpId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @WaterPumpId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END