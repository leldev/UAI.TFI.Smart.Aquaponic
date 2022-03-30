USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_ChecksumLog]
GO

CREATE PROCEDURE [dbo].[USP_ChecksumLog]
    (
    @LogId                  INT,
    @Hash                   INT,
    @Table                  NVARCHAR(MAX)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION

/******************* Update *******************/
UPDATE [dbo].[Log]
SET [Hash] = @Hash 
WHERE [LogId] = @LogId

IF EXISTS 
(SELECT 1
FROM [dbo].[Checksum] c
WHERE c.[Table] = @Table)
BEGIN
    /******************* Update *******************/
    UPDATE [dbo].[Checksum]
    SET 
    [Hash] = (SELECT SUM(l.[Hash]) FROM dbo.[Log] l),
    [ModifiedDate] = GETDATE()
    WHERE [Table] = @Table
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[Checksum]
        ([Table], [Hash], [CreatedDate], [ModifiedDate])
    VALUES
        (@Table, @Hash, GETDATE(), GETDATE())
END

IF @@ERROR <> 0
    BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @LogId