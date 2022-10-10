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

USE Gwen
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
    [phone] VARCHAR(10) NOT NULL,
    [email] VARCHAR(50) NOT NULL,
    [password] VARCHAR(30) NOT NULL
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
    [phone] VARCHAR(10) NOT NULL,
    [email] VARCHAR(50) NOT NULL,
    [note] NVARCHAR(100) NOT NULL,
    [date_created] DATETIME DEFAULT CURRENT_TIMESTAMP 
    -- Specify more columns here
    FOREIGN key (user_id) REFERENCES [dbo].[user] (Id)
);
GO

-- Create a new table called '[product]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[product]', 'U') IS NOT NULL
DROP TABLE [dbo].[product]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[product]
(
    [Id] INT IDENTITY(0,1) PRIMARY KEY, -- primary key column
    [name] NVARCHAR(50) NOT NULL,
    [description] NVARCHAR(50) NOT NULL,
    [type] NVARCHAR(10) NOT NULL,
    [price] FLOAT NOT NULL,
    [quantity] INT NOT NULL,
    [date_created] DATETIME DEFAULT CURRENT_TIMESTAMP,
    -- specify more columns here
);
GO

-- Create a new table called '[order]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[order]', 'U') IS NOT NULL
DROP TABLE [dbo].[order]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[order]
(
    [Id] INT IDENTITY(0,1) PRIMARY KEY, -- primary key column
    [customer_id] INT NOT NULL,
    [user_id] INT NOT NULL,
    [date_created] DATETIME DEFAULT CURRENT_TIMESTAMP,
    [note] NVARCHAR(100) NOT NULL,
    -- specify more columns here
    FOREIGN key (customer_id) REFERENCES [dbo].[customer] (Id),
    FOREIGN key (user_id) REFERENCES [dbo].[user] (Id)
);
GO

-- Create a new table called '[order_detail]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[order_detail]', 'U') IS NOT NULL
DROP TABLE [dbo].[order_detail]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[order_detail]
(
    [Id] INT , -- primary key column
    [order_id] INT NOT NULL,
    [product_id] INT NOT NULL,
    [quantity] INT NOT NULL,
    -- specify more columns here
    FOREIGN key (order_id) REFERENCES [dbo].[order] (Id),
    FOREIGN key (product_id) REFERENCES [dbo].[product] (Id)
);
GO



