USE [SmartAquaponic]
GO

DROP TYPE IF EXISTS [dbo].[TTListInt]
GO

CREATE TYPE [dbo].[TTListInt] AS TABLE
(
    CommonValue INT NOT NULL,
    PRIMARY KEY CLUSTERED 
    (CommonValue ASC) WITH (IGNORE_DUP_KEY = OFF)
)
GO