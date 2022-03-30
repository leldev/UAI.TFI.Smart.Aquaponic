USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_UpdateGroup]
GO

CREATE PROCEDURE [dbo].[USP_UpdateGroup]
    (
    @GroupId            INT,
    @Name               NVARCHAR(50),
    @ModifiedDate       DATETIME2(7),
    @Roles              [dbo].[TTListInt] READONLY
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @CurrentModifiedDate DATETIME2(7);

/******************* Get data *******************/
SELECT @CurrentModifiedDate = r.[ModifiedDate]
FROM [dbo].[Role] r
WHERE r.[RoleId] = @GroupId

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
        /******************* Delete *******************/
        DELETE FROM [dbo].[Group]
        WHERE [GroupId] = @GroupId

        /******************* Relate *******************/
        INSERT INTO [dbo].[Group]
            ([GroupId], [RoleId])
        SELECT @GroupId, r.[CommonValue]
        FROM @Roles r

        /******************* Update *******************/
        UPDATE [dbo].[Role]
        SET [Name] = @Name, [ModifiedDate] = GETDATE()
        WHERE [RoleId] = @GroupId

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK
            RETURN
        END

        COMMIT
        SELECT @GroupId
    END
    ELSE
    BEGIN
        /******************* Concurrency *******************/
        ROLLBACK
        SELECT -3
        RETURN
    END
END