CREATE DATABASE Gwen
Use Gwen
GO

DROP TABLE IF EXISTS Order_Detail
GO
DROP TABLE IF EXISTS Report
GO
DROP TABLE IF EXISTS Distributor_work_list
GO
DROP TABLE IF EXISTS Customer
GO
DROP TABLE IF EXISTS Product
GO
DROP TABLE IF EXISTS Manager
GO
DROP TABLE IF EXISTS Employee
GO
DROP table if exists Quality_Control
GO


CREATE TABLE Order_List
(
    id INT IDENTITY (1, 1) PRIMARY KEY,
    customer_id INT,
    prod_id INT,
    descriptions ntext,
    receiving_date date,
    delivery_date date,
    status_id INT,
    foreign key (customer_id) references Customer (id),
    foreign key (prod_id) references Product (id),
)

CREATE TABLE Customer
(
    id INT IDENTITY (1, 1) PRIMARY KEY,
    f_name nvarchar(200),
    address nvarchar(200),
    phone char(10),
    email varchar(50)
)

CREATE TABLE Order_Detail
(
    ord_id INT,
    prod_id INT,
    amount INT,
    foreign key (ord_id) references Order_List (id),
    foreign key (prod_id) references Product (id)
)

CREATE TABLE Product
(
    id INT IDENTITY (1, 1) PRIMARY KEY,
    prod_name nvarchar(200),
    prod_type nvarchar(200),
    prod_price money,
    prod_image text,
    prod_description nvarchar(200)
)

CREATE TABLE Manager
(
    id INT IDENTITY (1, 1) PRIMARY KEY,
    f_name nvarchar(200),
    address nvarchar(200),
    phone char(10),
    email varchar(50)
)

CREATE TABLE Employee
(
    id INT IDENTITY (1, 1) PRIMARY KEY,
    f_name nvarchar(200),
    address nvarchar(200),
    phone char(10),
    email varchar(50)
)

CREATE TABLE Distributor_work_list
(
    manager_id INT,
    employee_id INT,
    ord_id INT,
    detail_work text,
    foreign key (manager_id) references Manager (id),
    foreign key (employee_id) references Employee (id),
    foreign key (ord_id) references Order_List (id)
)

CREATE TABLE Quality_Control
(
    id INT IDENTITY (1, 1) PRIMARY KEY,
    f_name nvarchar(200),
    address nvarchar(200),
    phone char(10),
    email varchar(50)
)

CREATE TABLE Report
(
    ord_id INT,
    qc_id INT,
    result bit,
    comment text,
    foreign key (ord_id) references Order_List (id),
    foreign key (qc_id) references Quality_Control (id)
)
CREATE SCHEMA [Customer_View]
GO

CREATE [Customer_View].VIEW show_product_pants AS
SELECT prod_name,prod_image,prod_type,prod_price,prod_description FROM Product
WHERE prod_type = 'pants'

CREATE [Customer_View].VIEW show_product_shirt AS
SELECT prod_name,prod_image,prod_type,prod_price,prod_description FROM Product
WHERE prod_type = 'shirt'

CREATE [Customer_View].VIEW show_product_outerwear AS
SELECT prod_name,prod_image,prod_type,prod_price,prod_description FROM Product
WHERE prod_type = 'outerwear'




