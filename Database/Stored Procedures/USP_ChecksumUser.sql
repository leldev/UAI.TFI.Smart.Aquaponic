USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_ChecksumUser]
GO

CREATE PROCEDURE [dbo].[USP_ChecksumUser]
    (
    @UserId                 INT,
    @Hash                   INT,
    @Table                  NVARCHAR(MAX)
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION

/******************* Update *******************/
UPDATE [dbo].[User]
SET [Hash] = @Hash 
WHERE [UserId] = @UserId

IF EXISTS 
(SELECT 1
FROM [dbo].[Checksum] c
WHERE c.[Table] = @Table)
BEGIN
    /******************* Update *******************/
    UPDATE [dbo].[Checksum]
    SET 
    [Hash] = (SELECT SUM(l.[Hash]) FROM dbo.[User] l),
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

SELECT @UserId