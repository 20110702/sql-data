-- Create a new database called 'Gwen'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'Gwen'
)
CREATE DATABASE Gwen
GO


-- Create a new table called '[customer]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[customer]', 'U') IS NOT NULL
DROP TABLE [dbo].[customer]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[customer]
(
    [Id] INT IDENTITY(0,1) PRIMARY KEY, -- Primary Key column
    [f_name] NVARCHAR(50) NOT NULL,
    [address] NVARCHAR(100) NOT NULL,
    [phone] VARCHAR(10),
    [email] VARCHAR(50),
    [password] VARCHAR(30)
    -- Specify more columns here
);
GO

-- Create a new table called '[user]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[user]', 'U') IS NOT NULL
DROP TABLE [dbo].[user]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[user]
(
    [Id] INT IDENTITY(0,1) PRIMARY KEY, -- Primary Key column
    [password] VARCHAR(30) NOT NULL,
    [role] BIT NOT NULL -- 0: staff, 1: manager
    -- Specify more columns here
);
GO

-- Create a new table called '[contact]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[contact]', 'U') IS NOT NULL
DROP TABLE [dbo].[contact]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[contact]
(
    [user_id] INT,
    [f_name] NVARCHAR(50) NOT NULL,
    [phone] VARCHAR(10),
    [email] VARCHAR(50),
    [note] NVARCHAR(100),
    [date_created] DATETIME DEFAULT CURRENT_TIMESTAMP 
    -- Specify more columns here
    FOREIGN key (user_id) REFERENCES [dbo].[user] (Id)
);
GO



