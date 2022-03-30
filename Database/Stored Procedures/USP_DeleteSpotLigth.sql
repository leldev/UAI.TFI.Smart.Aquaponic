USE [SmartAquaponic]
GO

DROP PROCEDURE IF EXISTS [dbo].[USP_DeleteSpotLight]
GO

CREATE PROCEDURE [dbo].[USP_DeleteSpotLight]
    (
    @SpotLightId            INT
)
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

DELETE FROM [dbo].[SpotLightLamp]
    WHERE [SpotLightId] =  @SpotLightId

DELETE FROM [dbo].[SpotLight]
    WHERE [SpotLightId] = @SpotLightId

IF @@ERROR <> 0
BEGIN
    ROLLBACK
    RETURN
END

COMMIT

SELECT @SpotLightId