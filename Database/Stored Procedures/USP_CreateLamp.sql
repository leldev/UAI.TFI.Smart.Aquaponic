USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_CreateLamp]
GO

CREATE PROCEDURE [dbo].[USP_CreateLamp]
    (
    @Name                   NVARCHAR(50),
    @Lumen                  INT,
    @Power                  INT,
    @SocketId               INT
)
AS

SET NOCOUNT ON;
BEGIN TRANSACTION
DECLARE @NewId INT;

IF EXISTS 
(SELECT 1
FROM [dbo].[Lamp] l
WHERE l.[Name] = @Name)
BEGIN
    /******************* Already exist *******************/
    ROLLBACK
    SELECT -4
    RETURN
END
ELSE
BEGIN
    /******************* Create *******************/
    INSERT INTO [dbo].[Lamp]
        ([Name], [Lumen], [Power], [SocketId], [CreatedDate], [ModifiedDate])
    VALUES
        (@Name, @Lumen, @Power, @SocketId, GETDATE(), GETDATE())
    SET @NewId = SCOPE_IDENTITY();

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK
        RETURN
    END

    COMMIT
    
    SELECT @NewId
END