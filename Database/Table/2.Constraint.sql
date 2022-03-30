USE [SmartAquaponic]
GO

ALTER TABLE [dbo].[Predator]  WITH CHECK ADD  CONSTRAINT [FK_Predator_Fish] FOREIGN KEY([PredatorId])
REFERENCES [dbo].[Fish] ([FishId])
GO
ALTER TABLE [dbo].[Predator] CHECK CONSTRAINT [FK_Predator_Fish]
GO
ALTER TABLE [dbo].[Predator]  WITH CHECK ADD  CONSTRAINT [FK_Predator_Pray] FOREIGN KEY([FishId])
REFERENCES [dbo].[Fish] ([FishId])
GO
ALTER TABLE [dbo].[Predator] CHECK CONSTRAINT [FK_Predator_Pray]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_RoleChild] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_RoleChild]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_RoleParent] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_RoleParent]
GO
ALTER TABLE [dbo].[Lamp]  WITH CHECK ADD  CONSTRAINT [FK_Lamp_Socket] FOREIGN KEY([SocketId])
REFERENCES [dbo].[Socket] ([SocketId])
GO
ALTER TABLE [dbo].[Lamp] CHECK CONSTRAINT [FK_Lamp_Socket]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([EventId])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_Event]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_User_UserId]
GO
ALTER TABLE [dbo].[Pot]  WITH CHECK ADD  CONSTRAINT [FK_Pot_Rock] FOREIGN KEY([RockId])
REFERENCES [dbo].[Rock] ([RockId])
GO
ALTER TABLE [dbo].[Pot] CHECK CONSTRAINT [FK_Pot_Rock]
GO
ALTER TABLE [dbo].[PotPlant]  WITH CHECK ADD  CONSTRAINT [FK_PotPlant_Plant] FOREIGN KEY([PlantId])
REFERENCES [dbo].[Plant] ([PlantId])
GO
ALTER TABLE [dbo].[PotPlant] CHECK CONSTRAINT [FK_PotPlant_Plant]
GO
ALTER TABLE [dbo].[PotPlant]  WITH CHECK ADD  CONSTRAINT [FK_PotPlant_Pot] FOREIGN KEY([PotId])
REFERENCES [dbo].[Pot] ([PotId])
GO
ALTER TABLE [dbo].[PotPlant] CHECK CONSTRAINT [FK_PotPlant_Pot]
GO
ALTER TABLE [dbo].[PreferenceResource]  WITH CHECK ADD  CONSTRAINT [FK_PreferenceResource_Resource] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([ResourceId])
GO
ALTER TABLE [dbo].[PreferenceResource] CHECK CONSTRAINT [FK_PreferenceResource_Resource]
GO
ALTER TABLE [dbo].[PreferenceResource]  WITH CHECK ADD  CONSTRAINT [FK_PreferenceResource_UserPreference] FOREIGN KEY([UserPreferenceId])
REFERENCES [dbo].[UserPreference] ([UserPreferenceId])
GO
ALTER TABLE [dbo].[PreferenceResource] CHECK CONSTRAINT [FK_PreferenceResource_UserPreference]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Pot] FOREIGN KEY([PotId])
REFERENCES [dbo].[Pot] ([PotId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Pot]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SpotLight] FOREIGN KEY([SpotLightId])
REFERENCES [dbo].[SpotLight] ([SpotLightId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SpotLight]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Tank] FOREIGN KEY([TankId])
REFERENCES [dbo].[Tank] ([TankId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Tank]
GO
ALTER TABLE [dbo].[SpotLight]  WITH CHECK ADD  CONSTRAINT [FK_SpotLight_Socket] FOREIGN KEY([SocketId])
REFERENCES [dbo].[Socket] ([SocketId])
GO
ALTER TABLE [dbo].[SpotLight] CHECK CONSTRAINT [FK_SpotLight_Socket]
GO
ALTER TABLE [dbo].[SpotLightLamp]  WITH CHECK ADD  CONSTRAINT [FK_SpotLightLamp_Lamp] FOREIGN KEY([LampId])
REFERENCES [dbo].[Lamp] ([LampId])
GO
ALTER TABLE [dbo].[SpotLightLamp] CHECK CONSTRAINT [FK_SpotLightLamp_Lamp]
GO
ALTER TABLE [dbo].[SpotLightLamp]  WITH CHECK ADD  CONSTRAINT [FK_SpotLightLamp_SpotLight] FOREIGN KEY([SpotLightId])
REFERENCES [dbo].[SpotLight] ([SpotLightId])
GO
ALTER TABLE [dbo].[SpotLightLamp] CHECK CONSTRAINT [FK_SpotLightLamp_SpotLight]
GO
ALTER TABLE [dbo].[Tank]  WITH CHECK ADD  CONSTRAINT [FK_Tank_Ph] FOREIGN KEY([PhId])
REFERENCES [dbo].[Ph] ([PhId])
GO
ALTER TABLE [dbo].[Tank] CHECK CONSTRAINT [FK_Tank_Ph]
GO
ALTER TABLE [dbo].[Tank]  WITH CHECK ADD  CONSTRAINT [FK_Tank_WaterPump] FOREIGN KEY([WaterPumpId])
REFERENCES [dbo].[WaterPump] ([WaterPumpId])
GO
ALTER TABLE [dbo].[Tank] CHECK CONSTRAINT [FK_Tank_WaterPump]
GO
ALTER TABLE [dbo].[TankDecor]  WITH CHECK ADD  CONSTRAINT [FK_TankDecor_Decor] FOREIGN KEY([DecorId])
REFERENCES [dbo].[Decor] ([DecorId])
GO
ALTER TABLE [dbo].[TankDecor] CHECK CONSTRAINT [FK_TankDecor_Decor]
GO
ALTER TABLE [dbo].[TankDecor]  WITH CHECK ADD  CONSTRAINT [FK_TankDecor_Tank] FOREIGN KEY([TankId])
REFERENCES [dbo].[Tank] ([TankId])
GO
ALTER TABLE [dbo].[TankDecor] CHECK CONSTRAINT [FK_TankDecor_Tank]
GO
ALTER TABLE [dbo].[TankFish]  WITH CHECK ADD  CONSTRAINT [FK_TankFish_Fish] FOREIGN KEY([FishId])
REFERENCES [dbo].[Fish] ([FishId])
GO
ALTER TABLE [dbo].[TankFish] CHECK CONSTRAINT [FK_TankFish_Fish]
GO
ALTER TABLE [dbo].[TankFish]  WITH CHECK ADD  CONSTRAINT [FK_TankFish_Tank] FOREIGN KEY([TankId])
REFERENCES [dbo].[Tank] ([TankId])
GO
ALTER TABLE [dbo].[TankFish] CHECK CONSTRAINT [FK_TankFish_Tank]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserPreference_PreferenceId] FOREIGN KEY([UserPreferenceId])
REFERENCES [dbo].[UserPreference] ([UserPreferenceId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserPreference_PreferenceId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
ALTER TABLE [dbo].[Fish]  WITH CHECK ADD  CONSTRAINT [FK_Fish_Ph] FOREIGN KEY([PhId])
REFERENCES [dbo].[Ph] ([PhId])
GO
ALTER TABLE [dbo].[Fish] CHECK CONSTRAINT [FK_Fish_Ph]
GO