USE [SmartAquaponic]
GO

DROP TYPE IF EXISTS [dbo].[TTDictionary]
GO

CREATE TYPE [dbo].[TTDictionary] AS TABLE
(
    [Key]           INT NOT NULL,
    [Value]         NVARCHAR(MAX) NOT NULL,
    PRIMARY KEY CLUSTERED 
    ([Key] ASC) WITH (IGNORE_DUP_KEY = OFF)
)
GO