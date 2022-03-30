USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_DeleteGroup]
GO

CREATE PROCEDURE [dbo].[USP_DeleteGroup]
    (
    @GroupId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[Group]
    WHERE [GroupId] = @GroupId

DELETE FROM [dbo].[Role]
    WHERE [RoleId] = @GroupId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @GroupId