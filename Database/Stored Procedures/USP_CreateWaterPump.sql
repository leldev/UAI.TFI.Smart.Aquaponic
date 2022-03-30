USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_CreateWaterPump]
GO

CREATE PROCEDURE [dbo].[USP_CreateWaterPump]
    (
    @Name                   NVARCHAR(50),
    @FlowRate               INT,
    @Power                  INT,
    @Volume                 DECIMAL(18, 2)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[WaterPump] w
WHERE w.[Name] = @Name)
BEGIN
    /******************* Already exist *******************/
    ROLLBACK
    SELECT -4
    RETURN
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[WaterPump]
        ([Name], [FlowRate], [Power], [Volume], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, @FlowRate, @Power, @Volume, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT
    
    SELECT @NewId
END