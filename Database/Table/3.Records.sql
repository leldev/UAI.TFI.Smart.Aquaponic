USE [SmartAquaponic]
GO

/****** Checksum ******/

SET IDENTITY_INSERT [dbo].[Checksum] ON 
GO
INSERT [dbo].[Checksum] ([ChecksumId], [CreatedDate], [ModifiedDate], [Hash], [Table]) VALUES (1, CAST(N'2020-09-13T00:36:20.9266667' AS DateTime2), CAST(N'2020-09-27T22:59:28.6800000' AS DateTime2), 0, N'Log')
GO
INSERT [dbo].[Checksum] ([ChecksumId], [CreatedDate], [ModifiedDate], [Hash], [Table]) VALUES (2, CAST(N'2020-09-13T18:43:16.0133333' AS DateTime2), CAST(N'2020-09-27T22:59:28.6200000' AS DateTime2), 265, N'User')
GO
SET IDENTITY_INSERT [dbo].[Checksum] OFF
GO

/****** Decor ******/

SET IDENTITY_INSERT [dbo].[Decor] ON 
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (1, N'Jellyfish', N'Plastic', CAST(281.25 AS Decimal(18, 2)), CAST(N'2020-11-07T20:06:20.5766667' AS DateTime2), CAST(N'2020-11-07T20:06:20.5766667' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (2, N'Plant Green', N'Plastic', CAST(500.00 AS Decimal(18, 2)), CAST(N'2020-11-07T20:06:44.9166667' AS DateTime2), CAST(N'2020-11-07T20:06:44.9166667' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (3, N'Plant Large', N'Plastic', CAST(368.66 AS Decimal(18, 2)), CAST(N'2020-11-07T20:07:02.3800000' AS DateTime2), CAST(N'2020-11-07T20:07:02.3800000' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (4, N'Stone Toten', N'Stone', CAST(487.50 AS Decimal(18, 2)), CAST(N'2020-11-07T20:07:27.5233333' AS DateTime2), CAST(N'2020-11-07T20:07:27.5233333' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (5, N'Fish House', N'Plastic', CAST(1583.90 AS Decimal(18, 2)), CAST(N'2020-11-07T20:07:48.1900000' AS DateTime2), CAST(N'2020-11-07T20:07:48.1900000' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (6, N'Castle', N'Plastic', CAST(2690.00 AS Decimal(18, 2)), CAST(N'2020-11-07T20:08:17.0766667' AS DateTime2), CAST(N'2020-11-07T20:08:17.0766667' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (7, N'Fish Nemo', N'Plastic', CAST(189.00 AS Decimal(18, 2)), CAST(N'2020-11-07T20:08:34.6933333' AS DateTime2), CAST(N'2020-11-07T20:08:34.6933333' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (8, N'Air Stone Bubble', N'LED', CAST(500.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:05:21.0100000' AS DateTime2), CAST(N'2020-11-08T22:05:21.0100000' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (9, N'Gravel ', N'Stone', CAST(250.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:05:52.1700000' AS DateTime2), CAST(N'2020-11-08T22:05:52.1700000' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (10, N'Polished Gravel', N'Stone', CAST(400.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:06:07.8100000' AS DateTime2), CAST(N'2020-11-08T22:06:07.8100000' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (11, N'Gravel River Rock', N'Stone', CAST(1000.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:06:24.7400000' AS DateTime2), CAST(N'2020-11-08T22:06:24.7400000' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (12, N'Aquarium Bubble LED Lights', N'LED', CAST(500.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:06:42.5300000' AS DateTime2), CAST(N'2020-11-08T22:06:42.5300000' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (13, N'Oxygen Pump', N'LED', CAST(600.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:07:04.7200000' AS DateTime2), CAST(N'2020-11-08T22:07:04.7200000' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (14, N'Granite', N'Stone', CAST(300.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:07:26.7100000' AS DateTime2), CAST(N'2020-11-08T22:07:26.7100000' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (15, N'GloFish Accent Gravel', N'Stone', CAST(250.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:07:41.1466667' AS DateTime2), CAST(N'2020-11-08T22:07:41.1466667' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (16, N'Broken Barrel', N'Plastic', CAST(300.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:08:03.5733333' AS DateTime2), CAST(N'2020-11-08T22:08:03.5733333' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (17, N'Tree trunk', N'Plastic', CAST(300.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:08:25.7466667' AS DateTime2), CAST(N'2020-11-08T22:08:25.7466667' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (18, N'Starfishes', N'Plastic', CAST(250.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:08:43.0500000' AS DateTime2), CAST(N'2020-11-08T22:08:43.0500000' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (19, N'Resin Cave', N'Plastic', CAST(350.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:09:02.0733333' AS DateTime2), CAST(N'2020-11-08T22:09:02.0733333' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (20, N'Cave', N'Plastic', CAST(600.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:09:21.4966667' AS DateTime2), CAST(N'2020-11-08T22:09:21.4966667' AS DateTime2))
GO
INSERT [dbo].[Decor] ([DecorId], [Name], [Type], [Volume], [CreatedDate], [ModifiedDate]) VALUES (21, N'Glowing Artificial Mushroom', N'Plastic', CAST(600.00 AS Decimal(18, 2)), CAST(N'2020-11-08T22:09:43.3800000' AS DateTime2), CAST(N'2020-11-08T22:09:43.3800000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Decor] OFF
GO

/****** Event ******/

SET IDENTITY_INSERT [dbo].[Event] ON 
GO
INSERT [dbo].[Event] ([EventId], [Name]) VALUES (1, N'Error')
GO
INSERT [dbo].[Event] ([EventId], [Name]) VALUES (2, N'Info')
GO
INSERT [dbo].[Event] ([EventId], [Name]) VALUES (3, N'Verbose')
GO
INSERT [dbo].[Event] ([EventId], [Name]) VALUES (4, N'Warning')
GO
SET IDENTITY_INSERT [dbo].[Event] OFF
GO

/****** Ph ******/

SET IDENTITY_INSERT [dbo].[Ph] ON 
GO
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (1, N'Beige')
GO
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (2, N'Blue')
GO
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (3, N'DarkBlue')
GO
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (4, N'DarkGreen')
GO
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (5, N'Green')
GO
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (6, N'LimeGreen')
GO
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (7, N'Orange')
GO
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (8, N'PaleBlue')
GO
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (9, N'Pink')
GO
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (10, N'Purple')
GO
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (11, N'Red')
GO
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (12, N'Tarquoise')
GO
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (13, N'Violet')
GO
INSERT [dbo].[Ph] ([PhId], [Name]) VALUES (14, N'Yellow')
GO
SET IDENTITY_INSERT [dbo].[Ph] OFF
GO

/****** Fish ******/

SET IDENTITY_INSERT [dbo].[Fish] ON 
GO
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (1, CAST(N'2020-11-07T16:42:01.1566667' AS DateTime2), CAST(N'2020-11-07T17:23:43.5833333' AS DateTime2), 0, CAST(12000.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(21.00 AS Numeric(18, 2)), 7, N'Goldfish')
GO
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (2, CAST(N'2020-11-07T16:45:42.1333333' AS DateTime2), CAST(N'2020-11-07T17:23:47.2300000' AS DateTime2), 1, CAST(6000.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(25.00 AS Numeric(18, 2)), 7, N'Betta')
GO
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (3, CAST(N'2020-11-07T16:49:00.2966667' AS DateTime2), CAST(N'2020-11-07T17:23:39.9133333' AS DateTime2), 0, CAST(22000.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), CAST(24.00 AS Numeric(18, 2)), 6, N'Piranha')
GO
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (4, CAST(N'2020-11-07T22:53:12.5000000' AS DateTime2), CAST(N'2020-11-07T22:53:12.5000000' AS DateTime2), 0, CAST(2000.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(26.00 AS Numeric(18, 2)), 7, N'Guppy')
GO
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (5, CAST(N'2020-11-08T21:08:16.8400000' AS DateTime2), CAST(N'2020-11-08T21:09:24.8200000' AS DateTime2), 0, CAST(50000.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(20.00 AS Numeric(18, 2)), 5, N'Snakehead ')
GO
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (6, CAST(N'2020-11-08T21:10:30.1766667' AS DateTime2), CAST(N'2020-11-08T21:13:22.9300000' AS DateTime2), 0, CAST(12000.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(23.00 AS Numeric(18, 2)), 4, N'Catfish')
GO
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (7, CAST(N'2020-11-08T21:12:27.8200000' AS DateTime2), CAST(N'2020-11-08T21:13:31.4066667' AS DateTime2), 0, CAST(3000.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(22.00 AS Numeric(18, 2)), 8, N'Comet (goldfish)')
GO
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (8, CAST(N'2020-11-08T21:13:09.5866667' AS DateTime2), CAST(N'2020-11-08T21:13:09.5866667' AS DateTime2), 1, CAST(5000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(22.00 AS Numeric(18, 2)), 7, N'Bubble Eye')
GO
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (9, CAST(N'2020-11-08T21:14:06.1966667' AS DateTime2), CAST(N'2020-11-08T21:14:06.1966667' AS DateTime2), 0, CAST(4000.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(19.00 AS Numeric(18, 2)), 9, N'Telescope (goldfish)')
GO
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (10, CAST(N'2020-11-08T21:14:46.6000000' AS DateTime2), CAST(N'2020-11-08T21:14:46.6000000' AS DateTime2), 1, CAST(3500.00 AS Decimal(18, 2)), CAST(3.50 AS Decimal(18, 2)), CAST(23.00 AS Numeric(18, 2)), 7, N'Shubunkin')
GO
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (11, CAST(N'2020-11-08T21:16:32.2433333' AS DateTime2), CAST(N'2020-11-08T21:16:32.2433333' AS DateTime2), 0, CAST(24000.00 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)), CAST(25.00 AS Numeric(18, 2)), 7, N'Parachromis dovii')
GO
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (12, CAST(N'2020-11-08T21:18:34.7366667' AS DateTime2), CAST(N'2020-11-08T21:18:34.7366667' AS DateTime2), 0, CAST(5000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(23.00 AS Numeric(18, 2)), 6, N'Lionhead (goldfish)')
GO
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (13, CAST(N'2020-11-08T22:11:53.1366667' AS DateTime2), CAST(N'2020-11-08T22:11:53.1366667' AS DateTime2), 0, CAST(15000.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(23.00 AS Numeric(18, 2)), 7, N'Cichlid')
GO
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (14, CAST(N'2020-11-08T22:13:23.4033333' AS DateTime2), CAST(N'2020-11-08T22:13:23.4033333' AS DateTime2), 0, CAST(7500.00 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), CAST(25.00 AS Numeric(18, 2)), 7, N'Clownfish')
GO
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (15, CAST(N'2020-11-08T22:14:40.6366667' AS DateTime2), CAST(N'2020-11-08T22:14:40.6366667' AS DateTime2), 0, CAST(20000.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(20.00 AS Numeric(18, 2)), 7, N'Koi')
GO
INSERT [dbo].[Fish] ([FishId], [CreatedDate], [ModifiedDate], [IsLonely], [WaterRequired], [Size], [Temp], [PhId], [Name]) VALUES (16, CAST(N'2020-11-08T22:16:24.2200000' AS DateTime2), CAST(N'2020-11-08T22:16:24.2200000' AS DateTime2), 0, CAST(23000.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(16.00 AS Numeric(18, 2)), 11, N'Axolotl')
GO
SET IDENTITY_INSERT [dbo].[Fish] OFF
GO

/****** Predator ******/
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (3, 1)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (11, 1)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (3, 2)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (11, 2)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (3, 4)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (3, 6)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (3, 7)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (5, 7)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (3, 8)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (5, 8)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (6, 8)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (6, 9)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (3, 10)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (5, 10)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (6, 10)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (3, 12)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (5, 12)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (6, 12)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (11, 12)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (11, 13)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (11, 14)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (13, 14)
GO
INSERT [dbo].[Predator] ([PredatorId], [FishId]) VALUES (11, 15)
GO

/****** Role ******/

SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (1, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Login')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (2, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Read user')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (3, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Create user')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (4, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Update user')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (5, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Delete user')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (6, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Generate password')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (7, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Recovery user')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (8, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Log')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (9, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Read permission')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (10, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Create permission')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (11, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Update permission')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (12, CAST(N'2020-08-17T13:33:19.6800000' AS DateTime2), CAST(N'2020-08-17T13:33:19.6800000' AS DateTime2), N'Delete permission')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (13, CAST(N'2020-09-05T18:39:40.5000000' AS DateTime2), CAST(N'2020-09-15T21:29:23.6533333' AS DateTime2), N'Db integrity')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (14, CAST(N'2020-09-07T21:52:10.4333333' AS DateTime2), CAST(N'2020-09-07T21:52:10.4333333' AS DateTime2), N'Db reset integrity')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (15, CAST(N'2020-09-15T21:09:51.5800000' AS DateTime2), CAST(N'2020-09-15T21:09:51.5800000' AS DateTime2), N'Backup')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (16, CAST(N'2020-09-15T21:09:54.3366667' AS DateTime2), CAST(N'2020-09-15T21:09:54.3366667' AS DateTime2), N'Restore')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (17, CAST(N'2020-09-15T21:09:57.6800000' AS DateTime2), CAST(N'2020-09-15T21:09:57.6800000' AS DateTime2), N'Read language')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (18, CAST(N'2020-09-15T21:10:01.2233333' AS DateTime2), CAST(N'2020-09-15T21:10:01.2233333' AS DateTime2), N'Create language')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (19, CAST(N'2020-09-15T21:10:04.3900000' AS DateTime2), CAST(N'2020-09-15T21:10:04.3900000' AS DateTime2), N'Update language')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (20, CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), N'Delete language')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (21, CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), N'Tank management')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (22, CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), N'Fish management')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (23, CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), N'Decor management')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (24, CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), N'Water pump management')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (25, CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), N'Pot management')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (26, CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), N'Plant management')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (27, CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), N'Spotligth management')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (28, CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), N'Lamp management')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (29, CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), N'Product management')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (30, CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), N'Communication')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (31, CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), CAST(N'2020-09-15T21:10:08.0666667' AS DateTime2), N'Reports')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (101, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'All user')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (102, CAST(N'2020-11-28T23:41:22.6733333' AS DateTime2), CAST(N'2020-11-28T23:41:22.6733333' AS DateTime2), N'Admin')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (103, CAST(N'2020-11-28T23:42:06.8600000' AS DateTime2), CAST(N'2020-11-28T23:42:06.8600000' AS DateTime2), N'Contributor')
GO
INSERT [dbo].[Role] ([RoleId], [CreatedDate], [ModifiedDate], [Name]) VALUES (104, CAST(N'2020-11-28T23:42:14.1100000' AS DateTime2), CAST(N'2020-11-28T23:42:14.1100000' AS DateTime2), N'Visitor')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO

/****** Group ******/

INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (101, 1)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 1)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 2)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 3)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 4)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 5)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 6)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 7)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 8)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 9)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 10)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 11)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 12)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 13)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 14)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 15)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 16)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 17)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 18)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 19)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (102, 20)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (103, 21)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (103, 22)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (103, 23)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (103, 24)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (103, 25)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (103, 26)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (103, 27)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (103, 28)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (103, 29)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (103, 30)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (103, 31)
GO
INSERT [dbo].[Group] ([GroupId], [RoleId]) VALUES (104, 1)
GO

/****** UserPreference ******/

SET IDENTITY_INSERT [dbo].[UserPreference] ON 
GO
INSERT [dbo].[UserPreference] ([UserPreferenceId], [CreatedDate], [ModifiedDate], [DateFormat], [IsDefault], [Name], [TimeZone]) VALUES (1, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-09-23T20:07:58.8033333' AS DateTime2), N'MM/dd/yyyy', 1, N'English', N'hh:mm:ss')
GO
INSERT [dbo].[UserPreference] ([UserPreferenceId], [CreatedDate], [ModifiedDate], [DateFormat], [IsDefault], [Name], [TimeZone]) VALUES (2, CAST(N'2020-09-11T21:27:14.9000000' AS DateTime2), CAST(N'2020-09-24T21:30:00.0266667' AS DateTime2), N'dd/MM/yyyy', 0, N'Spanish', N'hh:mm:ss')
GO
SET IDENTITY_INSERT [dbo].[UserPreference] OFF
GO

/****** User ******/

SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (1, CAST(N'2020-09-22T22:55:19.7800000' AS DateTime2), CAST(N'2020-11-14T20:34:12.3900000' AS DateTime2), 9, 0, N'Admin', N'Admin', N'7cb6bbb8de205df7a14365c5346f6bf6', N'VhhiD6mVRpMZtV0htt1UvQ==', 0, 1, NULL, 0, N'Tgo+3MKRaAOzPe4gEvWMXGV58nm+cOH/kFaYvd3yLrg=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (2, CAST(N'2020-10-01T22:38:54.2466667' AS DateTime2), CAST(N'2020-11-08T22:27:22.0066667' AS DateTime2), 2, 0, N'Lucas', N'Luna', N'7cb6bbb8de205df7a14365c5346f6bf6', N'lAoj7A7SjxQcVJz+XZ6wKA==', 0, 1, N'', 0, N'1ruUF264+YkxPc13zW2UcZ37IXBRboCIFSMTZiUHCoE=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (3, CAST(N'2020-11-08T18:48:33.4000000' AS DateTime2), CAST(N'2020-11-08T18:48:33.4000000' AS DateTime2), 8, 0, N'Tony', N'Stark', N'7cb6bbb8de205df7a14365c5346f6bf6', N'5w7e6N321AcU5mnot7EUbw==', 0, 1, NULL, 0, N'JNMNZsNAj3P+zAqd24MUT0nMPVpjx6frEieRmL3HKeU=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (4, CAST(N'2020-11-08T18:48:42.5433333' AS DateTime2), CAST(N'2020-11-08T18:48:42.5433333' AS DateTime2), 3, 0, N'Bruce', N'Wayne', N'7cb6bbb8de205df7a14365c5346f6bf6', N'pErqYJLp4v/K875kiK4R9w==', 0, 1, NULL, 0, N'k/Z/T0JAL0i46K1HKFQ1n+Gm+GNxB2R29tPYd77IP1c=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (5, CAST(N'2020-11-08T18:48:45.7000000' AS DateTime2), CAST(N'2020-11-08T18:48:45.7000000' AS DateTime2), 8, 0, N'Bruce', N'Banner', N'7cb6bbb8de205df7a14365c5346f6bf6', N'/41JicvZQa5kKjkCtxjn4g==', 0, 1, NULL, 0, N'EQQwhHV0a+RUXsIP71il3QzOPf6uaUNKasryeHT06jA=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (6, CAST(N'2020-11-08T18:48:48.4166667' AS DateTime2), CAST(N'2020-11-08T18:48:48.4166667' AS DateTime2), 8, 0, N'Peter', N'Parker', N'7cb6bbb8de205df7a14365c5346f6bf6', N'NV8bUZewNo5UbtUMmyEmJA==', 0, 1, NULL, 0, N'IvOEmefodxdKxyR4o8rfnREUyenTAbHwTx19U6Ng9A4=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (7, CAST(N'2020-11-08T18:48:51.6200000' AS DateTime2), CAST(N'2020-11-08T18:48:51.6200000' AS DateTime2), 9, 0, N'Barry', N'Allen', N'7cb6bbb8de205df7a14365c5346f6bf6', N'DXaK01QOjscMSTXwyfAmAg==', 0, 1, NULL, 0, N'pl/K8s6gbHx/1BEqUt+aC12UF+1MUCP/h3+I7mivkjA=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (8, CAST(N'2020-11-08T18:48:54.4733333' AS DateTime2), CAST(N'2020-11-08T18:48:54.4733333' AS DateTime2), 2, 0, N'Steve', N'Rogers', N'7cb6bbb8de205df7a14365c5346f6bf6', N'b2qjNY7Wp2SEVDNG5Owc/g==', 0, 1, NULL, 0, N'ecBKZp0ap+c8V8p20rjUVaCaPXgLTTlPSyh8Ilotov4=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (9, CAST(N'2020-11-08T18:48:57.1266667' AS DateTime2), CAST(N'2020-11-08T18:48:57.1266667' AS DateTime2), 6, 0, N'T''', N'Challa', N'7cb6bbb8de205df7a14365c5346f6bf6', N'sodKdiVB+jtbRkP8AM0OjQ==', 0, 1, NULL, 0, N'rnXO5N0Ry2r8FXmxaHcJul5Oo9Je53A7trQRc+rAqLo=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (10, CAST(N'2020-11-08T18:48:59.8666667' AS DateTime2), CAST(N'2020-11-08T18:48:59.8666667' AS DateTime2), 9, 0, N'Natasha', N'Romanoff', N'7cb6bbb8de205df7a14365c5346f6bf6', N'jSai3bLFVR4msZTtcUFKDQ==', 0, 1, NULL, 0, N'lzEK4KBTyP62jupC/3N/5cClbfF8qDKToZwIQQVkadk=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (11, CAST(N'2020-11-08T18:49:02.7233333' AS DateTime2), CAST(N'2020-11-08T18:49:02.7233333' AS DateTime2), 4, 0, N'Clark', N'Kent', N'7cb6bbb8de205df7a14365c5346f6bf6', N'y3VcUMXh6CsFcjX1QhODow==', 0, 1, NULL, 0, N'f/evqQtRjA1y1H4Y5iyzWuxYldaYPbHVh8DhqdSwUHU=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (12, CAST(N'2020-11-08T18:49:05.4300000' AS DateTime2), CAST(N'2020-11-08T18:49:05.4300000' AS DateTime2), 6, 0, N'Charles', N'Xavier', N'7cb6bbb8de205df7a14365c5346f6bf6', N'yiO/l28k4qx+RhRy2nxQ9w==', 0, 1, NULL, 0, N'oh6z1Fv2RPMS7Ge/e0vsggNZouAQZt2p0Q2HFfWIoDU=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (13, CAST(N'2020-11-08T18:49:08.0966667' AS DateTime2), CAST(N'2020-11-08T18:49:08.0966667' AS DateTime2), 5, 0, N'Diana', N'Prince', N'7cb6bbb8de205df7a14365c5346f6bf6', N'AjL4wnHPO6Eqay8uYUCd8Q==', 0, 1, NULL, 0, N'WYzOLLUXCz4p3NqNof93Y+Q59Ntwv4bNqyWowdgr9+A=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (14, CAST(N'2020-11-08T18:49:10.7466667' AS DateTime2), CAST(N'2020-11-08T18:49:10.7466667' AS DateTime2), 9, 0, N'Hal', N'Jordan', N'7cb6bbb8de205df7a14365c5346f6bf6', N'H3oGrWQU+5pkGm0Hpqc3cQ==', 0, 1, NULL, 0, N'gzD3QBRo8kpbQdNFOq+3HXy4zh538ksuvOubDXswXs0=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (15, CAST(N'2020-11-08T18:49:13.4300000' AS DateTime2), CAST(N'2020-11-08T18:49:13.4300000' AS DateTime2), 4, 0, N'Peter', N'Quill', N'7cb6bbb8de205df7a14365c5346f6bf6', N'4CvNKkPLmk4CXFKjEopqEA==', 0, 1, NULL, 0, N'7vi4tVWyLHkgKqdDpldX9R9Q9KTYcvMjPLwC87mWXCU=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (16, CAST(N'2020-11-08T18:49:16.1900000' AS DateTime2), CAST(N'2020-11-08T18:49:16.1900000' AS DateTime2), 18, 0, N'Kara', N'Danvers', N'7cb6bbb8de205df7a14365c5346f6bf6', N'Vg8eXVT05f8E/gfzoGqvOA==', 0, 1, NULL, 0, N'CzzgePcWXmaZNVqSbEMDks2MQFpuy1pOlh1QbS3VHdM=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (17, CAST(N'2020-11-08T18:49:18.8600000' AS DateTime2), CAST(N'2020-11-08T18:49:18.8600000' AS DateTime2), 6, 0, N'Clint', N'Barton', N'7cb6bbb8de205df7a14365c5346f6bf6', N'g6qpHhUrM+JUXiF1pl+18w==', 0, 1, NULL, 0, N'HHeBUL1zzkCipCZdr2fg000NOjf7sSN/PJIN9Br6jXs=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (18, CAST(N'2020-11-08T18:49:21.5766667' AS DateTime2), CAST(N'2020-11-08T18:49:21.5766667' AS DateTime2), 7, 0, N'Wade', N'Wilson', N'7cb6bbb8de205df7a14365c5346f6bf6', N'r4ubtLus2f0g7XJOL3tCAA==', 0, 1, NULL, 0, N'6bxiSJwZWNuDIyQ4iq/xagzFp30BL06AsIgV+sOIMhQ=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (19, CAST(N'2020-11-08T18:50:58.1033333' AS DateTime2), CAST(N'2020-11-08T18:50:58.1033333' AS DateTime2), 6, 0, N'Selina', N'Kyle', N'7cb6bbb8de205df7a14365c5346f6bf6', N'/LuMsO7IgoT6dgNmlhKucw==', 0, 1, NULL, 0, N'dVw/EVKMilLcBeHw0XJINZltLsx08BPoGSSpCH9Qxzs=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (20, CAST(N'2020-11-08T18:51:01.0833333' AS DateTime2), CAST(N'2020-11-08T18:51:01.0833333' AS DateTime2), 6, 0, N'Oliver', N'Queen', N'7cb6bbb8de205df7a14365c5346f6bf6', N'TJEBFDdLkhwKdVgTxybf+Q==', 0, 1, NULL, 0, N'CdD/cDMh2DbHp9Kfp4SY2ZjiI+5kp0Picz85jMmOOWc=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (21, CAST(N'2020-11-08T18:51:03.8266667' AS DateTime2), CAST(N'2020-11-08T18:51:03.8266667' AS DateTime2), 9, 0, N'Matthew', N'Murdock', N'7cb6bbb8de205df7a14365c5346f6bf6', N'xzpPYU1vyahkqtJSJeXbGQ==', 0, 1, NULL, 0, N'xRHSqF5g/998dYW+aQd1cHOQqQUUcr6k6KFSvJm4m9M=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (22, CAST(N'2020-11-08T18:51:06.4233333' AS DateTime2), CAST(N'2020-11-08T18:51:06.4233333' AS DateTime2), 1, 0, N'Hank', N'Pym', N'7cb6bbb8de205df7a14365c5346f6bf6', N'mgYEqEFPKRMBUrr+NwSX7A==', 0, 1, NULL, 0, N'HkpIK/zJOPk+yYW50Q2/hg1qxJY/mfk2oKCpD6qoyJQ=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (23, CAST(N'2020-11-08T18:51:09.1933333' AS DateTime2), CAST(N'2020-11-08T18:51:09.1933333' AS DateTime2), 8, 0, N'Barbara', N'Gordon', N'7cb6bbb8de205df7a14365c5346f6bf6', N'1CDN03H9YEZpRWVsQMCzmQ==', 0, 1, NULL, 0, N'OiwhK2gnZ0GPxLgAcYEX7NYkPdV80CCWxbfS9J+SH0k=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (24, CAST(N'2020-11-08T18:51:11.8933333' AS DateTime2), CAST(N'2020-11-08T18:51:11.8933333' AS DateTime2), 10, 0, N'Scott', N'Summers', N'7cb6bbb8de205df7a14365c5346f6bf6', N'dmOvCRJy6mL04yuR990j5A==', 0, 1, NULL, 0, N'LSvQQn5Q9Tjix92Kps+SqXtTBh+Bv8xqLZD0Xfno4hc=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (25, CAST(N'2020-11-08T18:51:15.2333333' AS DateTime2), CAST(N'2020-11-08T18:51:15.2333333' AS DateTime2), 6, 0, N'Arthur', N'Curry', N'7cb6bbb8de205df7a14365c5346f6bf6', N'JKIIcP6Uy/CFMBRlosHVDA==', 0, 1, NULL, 0, N'GPQNZcKpV+pe1/j8ab0N16R84S1zQDHb5IULt0HjsF8=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (26, CAST(N'2020-11-08T18:51:17.9366667' AS DateTime2), CAST(N'2020-11-08T18:51:17.9366667' AS DateTime2), 5, 0, N'Jean', N'Grey', N'7cb6bbb8de205df7a14365c5346f6bf6', N'i5iHl+/MKW+B0lfVA2s+sw==', 0, 1, NULL, 0, N'osxcAMc6eMXlh9SQSeE9+5UsplPwjeKcHnPClgSCcdU=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (27, CAST(N'2020-11-08T18:51:20.5666667' AS DateTime2), CAST(N'2020-11-08T18:51:20.5666667' AS DateTime2), 9, 0, N'Sam', N'Wilson', N'7cb6bbb8de205df7a14365c5346f6bf6', N'xRzv+tqFXOaKbTo9fjqT5g==', 0, 1, NULL, 0, N'z4uRWFf3YbpjIvFj70GFRIJ2SqRTkPZlrRqUqJAfZAc=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (28, CAST(N'2020-11-08T18:51:23.2700000' AS DateTime2), CAST(N'2020-11-08T18:51:23.2700000' AS DateTime2), 2, 0, N'Frank', N'Castle', N'7cb6bbb8de205df7a14365c5346f6bf6', N'42DYmuLCmvrwgT5POXHlXg==', 0, 1, NULL, 0, N'/yM/ybYVkZfC/cDbWDY2Ik38XLokBW7cVa9SOgdUgG4=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (29, CAST(N'2020-11-08T18:51:26.4333333' AS DateTime2), CAST(N'2020-11-08T18:51:26.4333333' AS DateTime2), 7, 0, N'Johnny', N'Blaze', N'7cb6bbb8de205df7a14365c5346f6bf6', N'qEhsRAAZ5pRhQ7MagKI6Pw==', 0, 1, NULL, 0, N'JOlchkOW49Sg3d1pTu2W97yh5oEA1ua3TEWGjxY5OnU=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (30, CAST(N'2020-11-08T18:51:29.1900000' AS DateTime2), CAST(N'2020-11-08T18:51:29.1900000' AS DateTime2), 7, 0, N'Damian', N'Wayne', N'7cb6bbb8de205df7a14365c5346f6bf6', N'tkJ+5WOkIsfjQWC7Uo794g==', 0, 1, NULL, 0, N'XU3/gAiTi4V+BeT2Ued3FXIYe+P8FL2pUd+pRlWUuaQ=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (31, CAST(N'2020-11-08T18:51:31.8800000' AS DateTime2), CAST(N'2020-11-08T18:51:31.8800000' AS DateTime2), 6, 0, N'James', N'Barnes', N'7cb6bbb8de205df7a14365c5346f6bf6', N'hLX80CF+KA7xkbg0aGj/fw==', 0, 1, NULL, 0, N'jZ3pwbnSDvXJSLRNo+3E1ZlD2j67xudxauQiixIKWXY=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (32, CAST(N'2020-11-08T18:51:35.0300000' AS DateTime2), CAST(N'2020-11-08T18:51:35.0300000' AS DateTime2), 7, 0, N'Jason', N'Todd', N'7cb6bbb8de205df7a14365c5346f6bf6', N'SRFme/UvIcnF6xxrGCSoJg==', 0, 1, NULL, 0, N'JeAlJ2sRAHqvRTwSGLnq9JRdRbZCdKEAzJi6dSJVPfk=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (33, CAST(N'2020-11-08T18:51:37.7000000' AS DateTime2), CAST(N'2020-11-08T18:51:37.7000000' AS DateTime2), 6, 0, N'James', N'Howlett', N'7cb6bbb8de205df7a14365c5346f6bf6', N'UazAMimYwZB/sJUiZbO8eQ==', 0, 1, NULL, 0, N'xpa1aZ6q9nriraHVQvywCvrEgGaKN12FwvxhF85jHDg=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (34, CAST(N'2020-11-08T18:51:40.5200000' AS DateTime2), CAST(N'2020-11-08T18:51:40.5200000' AS DateTime2), 19, 0, N'Billy', N'Batson', N'7cb6bbb8de205df7a14365c5346f6bf6', N'w3vgDassEJ1coLkJTe9H2A==', 0, 1, NULL, 0, N'0TTLTRVyNcXxlKkEeT0QDEazQA7sIYoosVUhEknuxDo=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (35, CAST(N'2020-11-08T18:51:43.3366667' AS DateTime2), CAST(N'2020-11-08T18:51:43.3366667' AS DateTime2), 1, 0, N'Dinah', N'Lance', N'7cb6bbb8de205df7a14365c5346f6bf6', N'ZPo6PQAlva73FUOGMdVZgw==', 0, 1, NULL, 0, N'FvehMy2lNpN14JEjAqe+2DRiByrP3WnBMO27qcw5LqY=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (36, CAST(N'2020-11-08T18:51:46.0633333' AS DateTime2), CAST(N'2020-11-08T18:51:46.0633333' AS DateTime2), 10, 0, N'Victor', N'Stone', N'7cb6bbb8de205df7a14365c5346f6bf6', N'dfcKaARbWLWCWOSz9QzJgg==', 0, 1, NULL, 0, N'CXT/tB+WGXjmv3lgtck/EQKBGf82FQ2eGovIRxPRC6M=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (37, CAST(N'2020-11-08T18:51:48.8233333' AS DateTime2), CAST(N'2020-11-08T18:51:48.8233333' AS DateTime2), 1, 0, N'Remy', N'LeBeau', N'7cb6bbb8de205df7a14365c5346f6bf6', N'hUJNub3+hrdTOZ+mOVCgAg==', 0, 1, NULL, 0, N'zENgvdlPlW3LFr1IEr3ST+IEMjy2sNN/LXnM5Cj8N4k=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (38, CAST(N'2020-11-08T18:51:51.5766667' AS DateTime2), CAST(N'2020-11-08T18:51:51.5766667' AS DateTime2), 9, 0, N'Piotr', N'Rasputin', N'7cb6bbb8de205df7a14365c5346f6bf6', N'JX5qzSSwE8lHXqpfwfb6BA==', 0, 1, NULL, 0, N'WcGMuD1UABSdi0jyvaIvuVlGcC362YtdxSttAbPigtM=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (39, CAST(N'2020-11-08T18:51:54.3100000' AS DateTime2), CAST(N'2020-11-08T18:51:54.3100000' AS DateTime2), 4, 0, N'Daniel', N'Rand', N'7cb6bbb8de205df7a14365c5346f6bf6', N'aLibe3pZmBA3QcTzQftZ8Q==', 0, 1, NULL, 0, N'mjqJ4Ri7nQQyo9I+CisOuDdck42YTikO2M1bV8BkcpI=')
GO
INSERT [dbo].[User] ([UserId], [CreatedDate], [ModifiedDate], [Hash], [IsLocked], [Name], [LastName], [Password], [Username], [LoginAttempts], [UserPreferenceId], [TempPassword], [IsDeleted], [Email]) VALUES (40, CAST(N'2020-11-08T18:51:56.9600000' AS DateTime2), CAST(N'2020-11-08T18:51:56.9600000' AS DateTime2), 3, 0, N'Rachel', N'Roth', N'7cb6bbb8de205df7a14365c5346f6bf6', N'FvOl6aoqW2HAgIVxVvz3jQ==', 0, 1, NULL, 0, N'aLABpc1CaaJ+1UzKZVqiQt08Ac07IHsX3Y9NAC60Zwc=')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO

/****** UserRole ******/

INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 2)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 3)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 4)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 5)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 6)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 7)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 8)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 9)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 10)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 11)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 12)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 13)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 14)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 15)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 16)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 17)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 18)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 19)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 20)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 21)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 22)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 23)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 24)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 25)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 26)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 27)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 28)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 29)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 30)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 31)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (2, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (3, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (4, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (5, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (6, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (7, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (8, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (9, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (10, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (11, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (12, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (13, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (14, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (15, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (16, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (17, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (18, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (19, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (20, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (21, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (22, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (23, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (24, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (25, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (26, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (27, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (28, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (29, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (30, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (31, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (32, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (33, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (34, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (35, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (36, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (37, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (38, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (39, 1)
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (40, 1)
GO

/****** Resource ******/
SET IDENTITY_INSERT [dbo].[Resource] ON
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (1, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-1')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (2, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-2')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (3, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-3')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (4, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-4')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (5, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-5')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (6, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-6')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (7, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-7')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (8, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-8')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (9, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-9')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (10, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-10')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (11, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'-11')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (12, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'102')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (13, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'103')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (14, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'101')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (15, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'104')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (16, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuLogout')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (17, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuLanguageManagemenet')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (18, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuBackOffice')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (19, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuDatabaseManagement')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (20, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuLogs')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (21, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuPermissionManager')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (22, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuUserManagement')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (23, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuInventory')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (24, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuTankManagement')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (25, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuFishManagement')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (26, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuDecorManagement')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (27, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuWaterPumpManagement')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (28, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuPotManagement')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (29, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuPlantManagement')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (30, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuSpotLightManagement')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (31, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuLampManagement')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (32, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuProduct')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (33, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuProductManagement')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (34, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'ClayPebble')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (35, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'ExpandedShale')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (36, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Growstone')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (37, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LavaRock')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (38, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Red')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (39, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Pink')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (40, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Orange')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (41, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Beige')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (42, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Yellow')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (43, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LimeGreen')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (44, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Green')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (45, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'DarkGreen')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (46, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Tarquoise')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (47, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'PaleBlue')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (48, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Blue')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (49, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'DarkBlue')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (50, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Violet')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (51, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Purple')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (52, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuLogin')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (53, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuContacUs')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (54, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuComunication')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (55, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuReports')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (56, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuReportsNotUsed')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (57, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'MenuReportsMostUsed')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (58, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlWhatsAquaponicTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (59, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlWhatsAquaponicFish')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (60, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlWhatsAquaponicWater')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (61, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlWhatsAquaponicPlant')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (62, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlWhatsAquaponicRecycle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (63, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTransformEnvironmentTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (64, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTransformEnvironmentDescription1')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (65, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTransformEnvironmentDescription2')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (66, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTransformEnvironmentNatural')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (67, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTransformEnvironmentNaturalDescription1')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (68, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTransformEnvironmentNaturalDescription2')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (69, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTransformEnvironmentBeatiful')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (70, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTransformEnvironmentBeatifulDescription1')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (71, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTransformEnvironmentBeatifulDescription2')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (72, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTransformEnvironmentEducationalTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (73, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTransformEnvironmentEducationalDescription1')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (74, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTransformEnvironmentEducationalDescription2')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (75, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTransformEnvironmentFunctionalTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (76, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTransformEnvironmentFunctionalDescription1')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (77, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTransformEnvironmentFunctionalDescription2')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (78, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'CreatedBy')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (79, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'CreatedDate')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (80, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'HeaderName')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (81, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'HeaderType')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (82, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'HeaderCant')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (83, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Pages')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (84, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'Cant')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (85, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnDelete')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (86, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnUpdate')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (87, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnGeneratePassowrd')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (88, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnUnlock')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (89, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnRecovery')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (90, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnBackup')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (91, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnVerify')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (92, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnGeneratePassword')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (93, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnRecoveryPassword')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (94, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnSend')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (95, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnRestore')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (96, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnSignIn')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (97, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnCreate')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (98, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'BtnTranslate')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (99, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPermisionTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (100, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreatePermissionTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (101, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblName')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (102, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblRequired')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (103, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblRoles')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (104, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeletePermissionTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (105, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblGroupName')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (106, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdatePermisionTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (107, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUserPreferenceTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (108, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdateUserPreferenceTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (109, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDateFormat')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (110, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblTimeZone')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (111, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblResources')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (112, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeleteUserPreferenceTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (113, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreateUserPreferenceTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (114, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUserTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (115, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreateUserTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (116, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeleteUserTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (117, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdateUserTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (118, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblProductTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (119, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreateProductTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (120, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeleteProductTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (121, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdateProductTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (122, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblLastName')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (123, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUsername')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (124, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPermission')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (125, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPassword')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (126, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblLoginTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (127, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblLanguage')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (128, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblLogsTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (129, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblEmail')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (130, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDatabaseTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (131, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblVolumes')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (132, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblBackup')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (133, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblRecoveryPasswordTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (134, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblEnterEmail')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (135, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblContactUsTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (136, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblMessage')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (137, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblTempPassword')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (138, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblNewPassword')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (139, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDecorTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (140, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreateDecorTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (141, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblType')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (142, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblVolume')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (143, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeleteDecorTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (144, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdateDecorTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (145, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblLampTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (146, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreateLampTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (147, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeleteLampTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (148, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdateLampTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (149, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblLumen')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (150, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPower')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (151, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblSocket')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (152, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPlantTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (153, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreatePlantTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (154, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeletePlantTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (155, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdatePlantTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (156, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblIsHydroponic')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (157, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblIsLowLight')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (158, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblWaterPumpTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (159, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreateWaterPumpTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (160, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeleteWaterPumpTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (161, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdateWaterPumpTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (162, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblFlowRate')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (163, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblFishTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (164, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreateFishTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (165, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeleteFishTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (166, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdateFishTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (167, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblSize')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (168, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblTemp')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (169, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPh')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (170, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblWaterRequired')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (171, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblIsLonely')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (172, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPlants')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (173, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPotTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (174, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreatePotTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (175, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeletePotTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (176, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdatePotTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (177, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblRgb')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (178, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblHeigth')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (179, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblLength')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (180, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblWidth')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (181, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblWeight')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (182, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblRock')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (183, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPredators')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (184, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblSpotLightTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (185, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreateSpotLightTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (186, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeleteSpotLightTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (187, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdateSpotLightTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (188, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblSlots')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (189, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblTankTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (190, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblCreateTankTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (191, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDeleteTankTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (192, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblUpdateTankTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (193, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblFishes')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (194, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblDecors')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (195, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblWaterPump')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (196, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblWaterTemp')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (197, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblGroups')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (198, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblLamp')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (199, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblRestore')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (200, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblVerifyIntegrity')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (201, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblTranslate')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (202, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblResponse')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (203, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblTank')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (204, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblPot')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (205, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LblSpotLight')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (206, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlName')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (207, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlRoleCount')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (208, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlCreateDate')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (209, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlModifiedDate')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (210, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlDateFormat')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (211, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTimeZone')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (212, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlIsDefault')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (213, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlKey')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (214, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlValue')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (215, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlLastName')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (216, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlUsername')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (217, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlIsLocked')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (218, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlIp')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (219, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlMessage')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (220, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlEvent')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (221, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlUser')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (222, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlEmail')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (223, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlVerify')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (224, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlBackup')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (225, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlRestore')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (226, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlType')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (227, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlVolume')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (228, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlLumen')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (229, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlPower')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (230, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlSocket')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (231, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlIsHydroponic')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (232, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlIsLowLight')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (233, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlFlowRate')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (234, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlSize')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (235, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTemp')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (236, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlPh')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (237, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlWaterRequired')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (238, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlIsLonely')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (239, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlPredators')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (240, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlPlants')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (241, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlRgb')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (242, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlHeigth')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (243, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlLength')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (244, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlWidth')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (245, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlWeight')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (246, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlRock')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (247, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlSlots')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (248, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlLamp')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (249, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlFishes')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (250, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlDecors')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (251, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlWaterPump')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (252, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlWaterTemp')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (253, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlCant')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (254, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlIsAnswered')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (255, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlResponse')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (256, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlTank')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (257, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlPot')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (258, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlSpotLight')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (259, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlHydroponicWarning')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (260, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlLightWarning')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (261, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlReportNotUsedTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (262, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'LtlReportMostUsedTitle')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (263, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'CbxIsHydroponic')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (264, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'CbxIsLowLight')
GO
INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES (265, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'CbxIsLonely')
GO
SET IDENTITY_INSERT [dbo].[Resource] OFF
GO
/****** English ******/
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 1, N'An unexpected error has occurred. Please try again later.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 2, N'No results found.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 3, N'The record was modified by another user. Please try again later')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 4, N'Item Already exist. Please try again later')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 5, N'Item cannot be deleted')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 6, N'The user or password is incorrect.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 7, N'Your user is corrupted. Please try again later')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 8, N'You are not allowed to sign in.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 9, N'Your user is blocked.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 10, N'Integrity error in the database')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 11, N'You do not have permiossion to access this page.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 12, N'Restore has been created successfully. You have been logged off.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 13, N'Integrity without error in the database')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 14, N'Backup has been created successfully')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 15, N'Your message was successfully sent.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 16, N'Logout')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 17, N'Language management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 18, N'Back office')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 19, N'Database management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 20, N'Logs')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 21, N'Permission management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 22, N'User management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 23, N'Inventory')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 24, N'Tank management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 25, N'Fish management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 26, N'Decor management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 27, N'Water pump management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 28, N'Pot management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 29, N'Plant management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 30, N'Spotligth management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 31, N'Lamp management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 32, N'Product')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 33, N'Product management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 34, N'Clay pebble')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 35, N'Expanded shale')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 36, N'Growstone')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 37, N'Lava rock')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 38, N'Red')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 39, N'Pink')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 40, N'Orange')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 41, N'Beige')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 42, N'Yellow')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 43, N'Lime green')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 44, N'Green')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 45, N'Dark green')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 46, N'Tarquoise')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 47, N'Pale blue')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 48, N'Blue')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 49, N'Dark blue')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 50, N'Violet')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 51, N'Purple')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 52, N'Login')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 53, N'Contact us')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 54, N'Comunication')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 55, N'Reports')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 56, N'Report: Not used')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 57, N'Report: Most used')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 58, N'WHAT IS AQUAPONIC?')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 59, N'Fish produce waste.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 60, N'Water and waste are pumped into the grow-bed above the aquarium hourly.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 61, N'Bacteria in the grow-bed convert the waste into nutrients for the plants.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 62, N'Clean water is cycled back into the aquarium after being filtered through the grow-bed.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 63, N'TRANSFORM YOUR ENVIRONMENT')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 64, N'Imagine having a living ecosystem to grow, learn, and discover — all in your own home. Our products encourage a new approach')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 65, N'to growing and the creation of self-sustaining ecosystems, using the beauty of aquaponics.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 66, N'NATURAL')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 67, N'The fish provide nutrients for the plants.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 68, N'The plants clean the water for the fish.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 69, N'BEAUTIFUL')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 70, N'Grow your favorite herbs and greens')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 71, N'anywhere, all-year-round.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 72, N'EDUCATIONAL')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 73, N'The perfect tool to explore how our')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 74, N'natural environment works.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 75, N'FUNCTIONAL')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 76, N'Thoroughly tested and consciously')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 77, N'designed with ease of use in mind.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 78, N'Created by')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 79, N'Created date')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 80, N'Name')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 81, N'Type')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 82, N'Cant')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 83, N'Pages')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 84, N'Cant')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 85, N'Delete')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 86, N'Update')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 87, N'Generate password')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 88, N'Unlock')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 89, N'Recovery')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 90, N'Backup')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 91, N'Verify')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 92, N'Generate password')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 93, N'Recovery password')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 94, N'Send')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 95, N'Restore')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 96, N'Sing in')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 97, N'Create')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 98, N'Translate')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 99, N'Permissions')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 100, N'Create Permission')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 101, N'Name')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 102, N'Required')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 103, N'Roles')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 104, N'Delete Permission')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 105, N'Name')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 106, N'Update Permision')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 107, N'User Preference')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 108, N'Update User Preference')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 109, N'Date format')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 110, N'Time zone')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 111, N'Resources')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 112, N'Delete User Preference')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 113, N'Create User Preference')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 114, N'Users')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 115, N'Create User')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 116, N'Delete User')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 117, N'Update User')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 118, N'Products')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 119, N'Create Product')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 120, N'Delete Product')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 121, N'Update Product')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 122, N'Last name')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 123, N'Username')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 124, N'Permission')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 125, N'Password')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 126, N'Login')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 127, N'Language')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 128, N'Logs')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 129, N'Email')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 130, N'Database management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 131, N'Volumes')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 132, N'Backup')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 133, N'Recovery password')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 134, N'Enter your email')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 135, N'Contact us')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 136, N'Message')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 137, N'Temp password')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 138, N'New password')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 139, N'Decors')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 140, N'Create decor')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 141, N'Type')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 142, N'Volume')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 143, N'Delete decor')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 144, N'Update decor')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 145, N'Lamps')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 146, N'Create lamp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 147, N'Delete lamp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 148, N'Update lamp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 149, N'Lumen')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 150, N'Power')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 151, N'Socket')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 152, N'Plants')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 153, N'Create plant')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 154, N'Delete plant')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 155, N'Update plant')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 156, N'Is hydroponic')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 157, N'Is low light')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 158, N'Water pumps')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 159, N'Create water pump')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 160, N'Delete water pump')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 161, N'Update water pump')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 162, N'Flow rate')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 163, N'Fishes')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 164, N'Create fish')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 165, N'Delete fish')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 166, N'Update fish')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 167, N'Size')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 168, N'Temp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 169, N'PH')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 170, N'Water required')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 171, N'Is lonely')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 172, N'Plants')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 173, N'Pots')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 174, N'Create pot')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 175, N'Delete pot')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 176, N'Update pot')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 177, N'RGB')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 178, N'Heigth')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 179, N'Length')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 180, N'Width')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 181, N'Weight')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 182, N'Rock')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 183, N'Predators')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 184, N'SpotLights')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 185, N'Create SpotLight')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 186, N'Delete SpotLight')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 187, N'Update SpotLight')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 188, N'Slots')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 189, N'Tanks')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 190, N'Create Tank')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 191, N'Delete Tank')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 192, N'Update Tank')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 193, N'Fishes')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 194, N'Decors')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 195, N'Water pump')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 196, N'Water temp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 197, N'Groups')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 198, N'Lamp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 199, N'Restore')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 200, N'Verify integrity')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 201, N'Translate')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 202, N'Response')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 203, N'Tank')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 204, N'Pot')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 205, N'SpotLight')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 206, N'Name')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 207, N'Role dount')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 208, N'Created date')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 209, N'Modified date')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 210, N'Date format')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 211, N'Time zone')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 212, N'Is default')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 213, N'Key')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 214, N'Value')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 215, N'Last name')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 216, N'Username')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 217, N'Is locked')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 218, N'Ip')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 219, N'Message')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 220, N'Event')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 221, N'User')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 222, N'Email')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 223, N'Verify')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 224, N'Backup')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 225, N'Restore')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 226, N'Type')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 227, N'Volume')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 228, N'Lumen')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 229, N'Power')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 230, N'Socket')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 231, N'Is hydroponic')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 232, N'Is low light')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 233, N'Flow rate')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 234, N'Size')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 235, N'Temp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 236, N'PH')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 237, N'Water required')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 238, N'Is lonely')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 239, N'Predators')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 240, N'Plants')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 241, N'RGB')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 242, N'Heigth')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 243, N'Length')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 244, N'Width')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 245, N'Weight')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 246, N'Rock')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 247, N'Slots')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 248, N'Lamp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 249, N'Fishes')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 250, N'Decors')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 251, N'Water pump')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 252, N'Water temp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 253, N'Cant')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 254, N'Is answered')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 255, N'Response')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 256, N'Tank')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 257, N'Pot')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 258, N'SpotLight')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 259, N'Some plants require little water. Do the circulation in intervals.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 260, N'There are plants that require constant light. Add a SpotLight')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 261, N'Report: Not used')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 262, N'Report: Most used')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 263, N'Is hydroponic')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 264, N'Is low light')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (1, 265, N'Is lonely')
GO
/****** Spanish ******/
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 1, N'An unexpected error has occurred. Please try again later.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 2, N'No results found.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 3, N'The record was modified by another user. Please try again later')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 4, N'Item Already exist. Please try again later')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 5, N'Item cannot be deleted')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 6, N'The user or password is incorrect.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 7, N'Your user is corrupted. Please try again later')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 8, N'You are not allowed to sign in.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 9, N'Your user is blocked.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 10, N'Integrity error in the database')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 11, N'You do not have permiossion to access this page.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 12, N'Restore has been created successfully. You have been logged off.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 13, N'Integrity without error in the database')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 14, N'Backup has been created successfully')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 15, N'Your message was successfully sent.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 16, N'Logout')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 17, N'Language management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 18, N'Back office')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 19, N'Database management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 20, N'Logs')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 21, N'Permission management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 22, N'User management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 23, N'Inventory')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 24, N'Tank management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 25, N'Fish management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 26, N'Decor management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 27, N'Water pump management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 28, N'Pot management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 29, N'Plant management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 30, N'Spotligth management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 31, N'Lamp management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 32, N'Product')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 33, N'Product management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 34, N'Clay pebble')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 35, N'Expanded shale')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 36, N'Growstone')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 37, N'Lava rock')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 38, N'Red')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 39, N'Pink')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 40, N'Orange')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 41, N'Beige')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 42, N'Yellow')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 43, N'Lime green')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 44, N'Green')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 45, N'Dark green')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 46, N'Tarquoise')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 47, N'Pale blue')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 48, N'Blue')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 49, N'Dark blue')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 50, N'Violet')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 51, N'Purple')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 52, N'Login')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 53, N'Contact us')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 54, N'Comunication')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 55, N'Reports')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 56, N'Report: Not used')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 57, N'Report: Most used')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 58, N'WHAT IS AQUAPONIC?')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 59, N'Fish produce waste.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 60, N'Water and waste are pumped into the grow-bed above the aquarium hourly.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 61, N'Bacteria in the grow-bed convert the waste into nutrients for the plants.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 62, N'Clean water is cycled back into the aquarium after being filtered through the grow-bed.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 63, N'TRANSFORM YOUR ENVIRONMENT')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 64, N'Imagine having a living ecosystem to grow, learn, and discover — all in your own home. Our products encourage a new approach')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 65, N'to growing and the creation of self-sustaining ecosystems, using the beauty of aquaponics.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 66, N'NATURAL')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 67, N'The fish provide nutrients for the plants.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 68, N'The plants clean the water for the fish.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 69, N'BEAUTIFUL')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 70, N'Grow your favorite herbs and greens')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 71, N'anywhere, all-year-round.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 72, N'EDUCATIONAL')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 73, N'The perfect tool to explore how our')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 74, N'natural environment works.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 75, N'FUNCTIONAL')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 76, N'Thoroughly tested and consciously')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 77, N'designed with ease of use in mind.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 78, N'Created by')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 79, N'Created date')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 80, N'Name')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 81, N'Type')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 82, N'Cant')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 83, N'Pages')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 84, N'Cant')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 85, N'Delete')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 86, N'Update')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 87, N'Generate password')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 88, N'Unlock')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 89, N'Recovery')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 90, N'Backup')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 91, N'Verify')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 92, N'Generate password')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 93, N'Recovery password')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 94, N'Send')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 95, N'Restore')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 96, N'Sing in')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 97, N'Create')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 98, N'Translate')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 99, N'Permissions')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 100, N'Create Permission')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 101, N'Name')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 102, N'Required')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 103, N'Roles')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 104, N'Delete Permission')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 105, N'Name')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 106, N'Update Permision')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 107, N'User Preference')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 108, N'Update User Preference')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 109, N'Date format')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 110, N'Time zone')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 111, N'Resources')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 112, N'Delete User Preference')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 113, N'Create User Preference')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 114, N'Users')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 115, N'Create User')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 116, N'Delete User')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 117, N'Update User')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 118, N'Products')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 119, N'Create Product')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 120, N'Delete Product')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 121, N'Update Product')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 122, N'Last name')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 123, N'Username')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 124, N'Permission')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 125, N'Password')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 126, N'Login')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 127, N'Language')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 128, N'Logs')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 129, N'Email')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 130, N'Database management')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 131, N'Volumes')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 132, N'Backup')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 133, N'Recovery password')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 134, N'Enter your email')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 135, N'Contact us')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 136, N'Message')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 137, N'Temp password')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 138, N'New password')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 139, N'Decors')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 140, N'Create decor')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 141, N'Type')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 142, N'Volume')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 143, N'Delete decor')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 144, N'Update decor')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 145, N'Lamps')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 146, N'Create lamp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 147, N'Delete lamp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 148, N'Update lamp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 149, N'Lumen')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 150, N'Power')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 151, N'Socket')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 152, N'Plants')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 153, N'Create plant')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 154, N'Delete plant')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 155, N'Update plant')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 156, N'Is hydroponic')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 157, N'Is low light')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 158, N'Water pumps')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 159, N'Create water pump')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 160, N'Delete water pump')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 161, N'Update water pump')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 162, N'Flow rate')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 163, N'Fishes')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 164, N'Create fish')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 165, N'Delete fish')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 166, N'Update fish')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 167, N'Size')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 168, N'Temp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 169, N'PH')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 170, N'Water required')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 171, N'Is lonely')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 172, N'Plants')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 173, N'Pots')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 174, N'Create pot')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 175, N'Delete pot')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 176, N'Update pot')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 177, N'RGB')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 178, N'Heigth')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 179, N'Length')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 180, N'Width')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 181, N'Weight')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 182, N'Rock')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 183, N'Predators')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 184, N'SpotLights')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 185, N'Create SpotLight')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 186, N'Delete SpotLight')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 187, N'Update SpotLight')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 188, N'Slots')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 189, N'Tanks')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 190, N'Create Tank')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 191, N'Delete Tank')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 192, N'Update Tank')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 193, N'Fishes')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 194, N'Decors')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 195, N'Water pump')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 196, N'Water temp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 197, N'Groups')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 198, N'Lamp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 199, N'Restore')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 200, N'Verify integrity')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 201, N'Translate')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 202, N'Response')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 203, N'Tank')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 204, N'Pot')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 205, N'SpotLight')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 206, N'Name')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 207, N'Role dount')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 208, N'Created date')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 209, N'Modified date')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 210, N'Date format')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 211, N'Time zone')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 212, N'Is default')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 213, N'Key')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 214, N'Value')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 215, N'Last name')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 216, N'Username')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 217, N'Is locked')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 218, N'Ip')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 219, N'Message')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 220, N'Event')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 221, N'User')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 222, N'Email')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 223, N'Verify')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 224, N'Backup')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 225, N'Restore')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 226, N'Type')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 227, N'Volume')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 228, N'Lumen')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 229, N'Power')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 230, N'Socket')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 231, N'Is hydroponic')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 232, N'Is low light')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 233, N'Flow rate')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 234, N'Size')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 235, N'Temp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 236, N'PH')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 237, N'Water required')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 238, N'Is lonely')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 239, N'Predators')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 240, N'Plants')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 241, N'RGB')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 242, N'Heigth')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 243, N'Length')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 244, N'Width')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 245, N'Weight')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 246, N'Rock')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 247, N'Slots')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 248, N'Lamp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 249, N'Fishes')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 250, N'Decors')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 251, N'Water pump')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 252, N'Water temp')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 253, N'Cant')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 254, N'Is answered')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 255, N'Response')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 256, N'Tank')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 257, N'Pot')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 258, N'SpotLight')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 259, N'Some plants require little water. Do the circulation in intervals.')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 260, N'There are plants that require constant light. Add a SpotLight')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 261, N'Report: Not used')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 262, N'Report: Most used')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 263, N'Is hydroponic')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 264, N'Is low light')
GO
INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES (2, 265, N'Is lonely')
GO

/****** WaterPump ******/

SET IDENTITY_INSERT [dbo].[WaterPump] ON 
GO
INSERT [dbo].[WaterPump] ([WaterPumpId], [CreatedDate], [ModifiedDate], [FlowRate], [Power], [Volume], [Name]) VALUES (1, CAST(N'2020-11-07T19:57:24.5233333' AS DateTime2), CAST(N'2020-11-07T19:57:24.5233333' AS DateTime2), 200, 2, CAST(64.00 AS Decimal(18, 2)), N'BL109')
GO
INSERT [dbo].[WaterPump] ([WaterPumpId], [CreatedDate], [ModifiedDate], [FlowRate], [Power], [Volume], [Name]) VALUES (2, CAST(N'2020-11-07T20:00:59.7466667' AS DateTime2), CAST(N'2020-11-07T20:00:59.7466667' AS DateTime2), 300, 3, CAST(60.75 AS Decimal(18, 2)), N'Atman 301')
GO
INSERT [dbo].[WaterPump] ([WaterPumpId], [CreatedDate], [ModifiedDate], [FlowRate], [Power], [Volume], [Name]) VALUES (3, CAST(N'2020-11-07T20:01:37.4133333' AS DateTime2), CAST(N'2020-11-07T20:01:37.4133333' AS DateTime2), 820, 18, CAST(537.60 AS Decimal(18, 2)), N'RS Electrical 932')
GO
SET IDENTITY_INSERT [dbo].[WaterPump] OFF
GO

/****** Tank ******/

SET IDENTITY_INSERT [dbo].[Tank] ON 
GO
INSERT [dbo].[Tank] ([TankId], [Name], [WaterTemp], [Heigth], [Length], [Width], [PhId], [CreatedDate], [WaterPumpId], [ModifiedDate]) VALUES (1, N'Betta Tank', CAST(25.00 AS Numeric(18, 2)), CAST(100.00 AS Numeric(18, 2)), CAST(100.00 AS Numeric(18, 2)), CAST(100.00 AS Numeric(18, 2)), 7, CAST(N'2020-11-25T22:44:16.1866667' AS DateTime2), 1, CAST(N'2020-11-25T22:44:16.1866667' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Tank] OFF
GO

/****** TankDecor ******/

INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 1)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 2)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 3)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 4)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 5)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 6)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 7)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 8)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 9)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 10)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 11)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 12)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 13)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 14)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 15)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 16)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 17)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 18)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 19)
GO
INSERT [dbo].[TankDecor] ([TankId], [DecorId]) VALUES (1, 21)
GO

/****** Rock ******/

SET IDENTITY_INSERT [dbo].[Rock] ON 
GO
INSERT [dbo].[Rock] ([RockId], [Name]) VALUES (1, N'ClayPebble')
GO
INSERT [dbo].[Rock] ([RockId], [Name]) VALUES (2, N'ExpandedShale')
GO
INSERT [dbo].[Rock] ([RockId], [Name]) VALUES (3, N'Growstone')
GO
INSERT [dbo].[Rock] ([RockId], [Name]) VALUES (4, N'LavaRock')
GO
SET IDENTITY_INSERT [dbo].[Rock] OFF
GO

/****** Socket ******/

SET IDENTITY_INSERT [dbo].[Socket] ON 
GO
INSERT [dbo].[Socket] ([SocketId], [Name]) VALUES (1, N'E14')
GO
INSERT [dbo].[Socket] ([SocketId], [Name]) VALUES (2, N'E26')
GO
INSERT [dbo].[Socket] ([SocketId], [Name]) VALUES (3, N'E27')
GO
INSERT [dbo].[Socket] ([SocketId], [Name]) VALUES (4, N'GU10')
GO
INSERT [dbo].[Socket] ([SocketId], [Name]) VALUES (5, N'GU53')
GO
SET IDENTITY_INSERT [dbo].[Socket] OFF

/****** Lamp ******/

SET IDENTITY_INSERT [dbo].[Lamp] ON 
GO
INSERT [dbo].[Lamp] ([LampId], [Lumen], [Power], [SocketId], [CreatedDate], [ModifiedDate], [Name]) VALUES (1, 750, 65, 3, CAST(N'2020-11-29T19:20:38.1166667' AS DateTime2), CAST(N'2020-11-29T19:20:38.1166667' AS DateTime2), N'Led Philips')
GO
INSERT [dbo].[Lamp] ([LampId], [Lumen], [Power], [SocketId], [CreatedDate], [ModifiedDate], [Name]) VALUES (2, 800, 12, 2, CAST(N'2020-11-29T19:21:28.5966667' AS DateTime2), CAST(N'2020-11-29T19:21:28.5966667' AS DateTime2), N'Led Osram')
GO
INSERT [dbo].[Lamp] ([LampId], [Lumen], [Power], [SocketId], [CreatedDate], [ModifiedDate], [Name]) VALUES (3, 1000, 20, 1, CAST(N'2020-11-29T19:22:15.8133333' AS DateTime2), CAST(N'2020-11-29T19:22:15.8133333' AS DateTime2), N'Led Sica')
GO
SET IDENTITY_INSERT [dbo].[Lamp] OFF
GO

/****** SpotLight ******/

SET IDENTITY_INSERT [dbo].[SpotLight] ON 
GO
INSERT [dbo].[SpotLight] ([SpotLightId], [Slots], [Name], [Heigth], [Length], [Width], [SocketId], [CreatedDate], [ModifiedDate]) VALUES (1, 2, N'Soporte Led Philips', CAST(15.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 3, CAST(N'2020-11-29T19:33:04.5366667' AS DateTime2), CAST(N'2020-11-29T19:33:04.5366667' AS DateTime2))
GO
INSERT [dbo].[SpotLight] ([SpotLightId], [Slots], [Name], [Heigth], [Length], [Width], [SocketId], [CreatedDate], [ModifiedDate]) VALUES (2, 4, N'Soporte Led Osram', CAST(15.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 2, CAST(N'2020-11-29T19:33:27.6066667' AS DateTime2), CAST(N'2020-11-29T19:33:27.6066667' AS DateTime2))
GO
INSERT [dbo].[SpotLight] ([SpotLightId], [Slots], [Name], [Heigth], [Length], [Width], [SocketId], [CreatedDate], [ModifiedDate]) VALUES (3, 4, N'Soporte Led Sica', CAST(15.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), 1, CAST(N'2020-11-29T19:33:55.5566667' AS DateTime2), CAST(N'2020-11-29T19:33:55.5566667' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[SpotLight] OFF
GO

/****** SpotLightLamp ******/

INSERT [dbo].[SpotLightLamp] ([SpotLightId], [LampId]) VALUES (1, 1)
GO
INSERT [dbo].[SpotLightLamp] ([SpotLightId], [LampId]) VALUES (2, 2)
GO
INSERT [dbo].[SpotLightLamp] ([SpotLightId], [LampId]) VALUES (3, 3)
GO

/****** Plant ******/

SET IDENTITY_INSERT [dbo].[Plant] ON 
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (1, CAST(N'2020-11-29T19:05:09.5866667' AS DateTime2), CAST(N'2020-11-29T19:05:09.5866667' AS DateTime2), 1, 1, N'Snake Plant')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (2, CAST(N'2020-11-29T19:05:18.5100000' AS DateTime2), CAST(N'2020-11-29T19:05:18.5100000' AS DateTime2), 1, 1, N'Monstera Deliciosa')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (3, CAST(N'2020-11-29T19:05:28.1766667' AS DateTime2), CAST(N'2020-11-29T19:05:28.1766667' AS DateTime2), 0, 1, N'Pothos')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (4, CAST(N'2020-11-29T19:05:34.5266667' AS DateTime2), CAST(N'2020-11-29T19:05:34.5266667' AS DateTime2), 1, 0, N'Dracaena')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (5, CAST(N'2020-11-29T19:05:38.8633333' AS DateTime2), CAST(N'2020-11-29T19:05:38.8633333' AS DateTime2), 0, 0, N'ZZ Plant')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (6, CAST(N'2020-11-29T19:05:48.6933333' AS DateTime2), CAST(N'2020-11-29T19:05:48.6933333' AS DateTime2), 1, 1, N'Spider Plant')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (7, CAST(N'2020-11-29T19:06:01.3500000' AS DateTime2), CAST(N'2020-11-29T19:06:01.3500000' AS DateTime2), 1, 0, N'Rubber Tree')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (8, CAST(N'2020-11-29T19:06:06.9766667' AS DateTime2), CAST(N'2020-11-29T19:06:06.9766667' AS DateTime2), 0, 1, N'Bird’s Nest Fern')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (9, CAST(N'2020-11-29T19:06:12.4633333' AS DateTime2), CAST(N'2020-11-29T19:06:12.4633333' AS DateTime2), 1, 0, N'Peace Lily')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (10, CAST(N'2020-11-29T19:06:17.3433333' AS DateTime2), CAST(N'2020-11-29T19:06:17.3433333' AS DateTime2), 0, 0, N'Philodendron Green')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (11, CAST(N'2020-11-29T19:06:24.5333333' AS DateTime2), CAST(N'2020-11-29T19:06:24.5333333' AS DateTime2), 1, 1, N'Aloe Vera')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (12, CAST(N'2020-11-29T19:06:54.4233333' AS DateTime2), CAST(N'2020-11-29T19:06:54.4233333' AS DateTime2), 1, 1, N'Ivy')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (13, CAST(N'2020-11-29T19:07:14.0500000' AS DateTime2), CAST(N'2020-11-29T19:07:14.0500000' AS DateTime2), 1, 1, N'Staghorn Fern')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (14, CAST(N'2020-11-29T19:07:37.8333333' AS DateTime2), CAST(N'2020-11-29T19:07:37.8333333' AS DateTime2), 0, 0, N'Maidenhair Fern')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (15, CAST(N'2020-11-29T19:07:45.0433333' AS DateTime2), CAST(N'2020-11-29T19:07:45.0433333' AS DateTime2), 1, 1, N'Dieffenbachia')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (16, CAST(N'2020-11-29T19:07:56.6933333' AS DateTime2), CAST(N'2020-11-29T19:07:56.6933333' AS DateTime2), 0, 0, N'Calathea')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (17, CAST(N'2020-11-29T19:08:04.8233333' AS DateTime2), CAST(N'2020-11-29T19:08:04.8233333' AS DateTime2), 0, 0, N'Anthurium')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (18, CAST(N'2020-11-29T19:08:10.9833333' AS DateTime2), CAST(N'2020-11-29T19:08:10.9833333' AS DateTime2), 1, 0, N'Rex Begonia')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (19, CAST(N'2020-11-29T19:08:18.2800000' AS DateTime2), CAST(N'2020-11-29T19:08:18.2800000' AS DateTime2), 1, 1, N'Lucky Bamboo')
GO
INSERT [dbo].[Plant] ([PlantId], [CreatedDate], [ModifiedDate], [IsHydroponic], [IsLowLight], [Name]) VALUES (20, CAST(N'2020-11-29T19:08:30.7600000' AS DateTime2), CAST(N'2020-11-29T19:08:30.7600000' AS DateTime2), 1, 1, N'Prayer Plant')
GO
SET IDENTITY_INSERT [dbo].[Plant] OFF
GO

/****** Pot ******/

SET IDENTITY_INSERT [dbo].[Pot] ON 
GO
INSERT [dbo].[Pot] ([PotId], [Name], [Rgb], [Heigth], [Length], [Width], [CreatedDate], [ModifiedDate], [RockId]) VALUES (1, N'Pothos Pot', N'#ff0000', CAST(15.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(N'2020-11-29T21:27:39.8733333' AS DateTime2), CAST(N'2020-11-29T21:27:39.8733333' AS DateTime2), 4)
GO
INSERT [dbo].[Pot] ([PotId], [Name], [Rgb], [Heigth], [Length], [Width], [CreatedDate], [ModifiedDate], [RockId]) VALUES (2, N'Aloe Vera Pot', N'#12bf46', CAST(15.00 AS Decimal(18, 2)), CAST(35.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(N'2020-11-29T21:28:04.9866667' AS DateTime2), CAST(N'2020-11-29T21:28:04.9866667' AS DateTime2), 3)
GO
INSERT [dbo].[Pot] ([PotId], [Name], [Rgb], [Heigth], [Length], [Width], [CreatedDate], [ModifiedDate], [RockId]) VALUES (3, N'Home Plants', N'#0a12ff', CAST(15.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(N'2020-11-29T21:28:36.0066667' AS DateTime2), CAST(N'2020-11-29T21:28:36.0066667' AS DateTime2), 1)
GO

/****** PotPlant ******/

INSERT [dbo].[PotPlant] ([PlantId], [PotId]) VALUES (3, 1)
GO
INSERT [dbo].[PotPlant] ([PlantId], [PotId]) VALUES (11, 2)
GO
INSERT [dbo].[PotPlant] ([PlantId], [PotId]) VALUES (4, 3)
GO
INSERT [dbo].[PotPlant] ([PlantId], [PotId]) VALUES (6, 3)
GO
INSERT [dbo].[PotPlant] ([PlantId], [PotId]) VALUES (9, 3)
GO
INSERT [dbo].[PotPlant] ([PlantId], [PotId]) VALUES (12, 3)
GO
INSERT [dbo].[PotPlant] ([PlantId], [PotId]) VALUES (17, 3)
GO