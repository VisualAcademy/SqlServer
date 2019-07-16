--[0]가상 쇼핑몰 데이터베이스 생성
Use Master
Create DataBase Store
--[1]카테고리
CREATE TABLE [dbo].[Categories] (
    [CategoryID] [int] IDENTITY (1, 1) NOT NULL ,
    [CategoryName] [varchar] (50)
) ON [PRIMARY]
GO
--[2]고객
CREATE TABLE [dbo].[Customers] (
    [CustomerID] [int] IDENTITY (1, 1) NOT NULL ,
    [FullName] [varchar] (50) ,
    [EmailAddress] [varchar] (50) ,
    [Password] [varchar] (50) 
) ON [PRIMARY]
GO
--[3]주문상세
CREATE TABLE [dbo].[OrderDetails] (
    [OrderID] [int] NOT NULL ,
    [ProductID] [int] NOT NULL ,
    [Quantity] [int] NOT NULL ,
    [UnitCost] [money] NOT NULL 
) ON [PRIMARY]
GO
--[4]주문
CREATE TABLE [dbo].[Orders] (
    [OrderID] [int] IDENTITY (1, 1) NOT NULL ,
    [CustomerID] [int] NOT NULL ,
    [OrderDate] [datetime] NOT NULL ,
    [ShipDate] [datetime] NOT NULL 
) ON [PRIMARY]
GO
--[5]상품
CREATE TABLE [dbo].[Products] (
    [ProductID] [int] IDENTITY (1, 1) NOT NULL ,
    [CategoryID] [int] NOT NULL ,
    [ModelNumber] [varchar] (50) ,
    [ModelName] [varchar] (50) ,
    [ProductImage] [varchar] (50) ,
    [UnitCost] [money] NOT NULL ,
    [Description] [varchar] (3800) 
) ON [PRIMARY]
GO
--[6]비평
CREATE TABLE [dbo].[Reviews] (
    [ReviewID] [int] IDENTITY (1, 1) NOT NULL ,
    [ProductID] [int] NOT NULL ,
    [CustomerName] [varchar] (50) ,
    [CustomerEmail] [varchar] (50) ,
    [Rating] [int] NOT NULL ,
    [Comments] [varchar] (3850) ,
) ON [PRIMARY]
GO
--[7]장바구니
CREATE TABLE [dbo].[ShoppingCart] (
    [RecordID] [int] IDENTITY (1, 1) NOT NULL ,
    [CartID] [varchar] (50) ,
    [Quantity] [int] NOT NULL ,
    [ProductID] [int] NOT NULL ,
    [DateCreated] [datetime] NOT NULL 
) ON [PRIMARY]
GO
