USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_DeleteProduct]
GO

CREATE PROCEDURE [dbo].[USP_DeleteProduct]
    (
    @ProductId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[Product]
    WHERE [ProductId] =  @ProductId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @ProductId