--[1] SP������ DB ����
Use Master
GO

CREATE DATABASE StudyStoredProcedure
GO

sp_helpdb StudyStoredProcedure

Use StudyStoredProcedure
GO

--[2] SP������ Table ����
Create Table [dbo].[Products]
(
	[ProductID] int identity (1, 1) PRIMARY KEY NOT NULL ,
	[CategoryID] int NOT NULL ,
	[ModelNumber] VarChar (50) ,
	[ModelName] VarChar (50) ,
	[ProductImage] VarChar (50) ,
	[UnitCost] money NOT NULL ,
	[Description] VarChar (3800)
)
GO

Insert Products 
Values(1,'test1','test','test',55,'test')
Insert Products 
Values(2,'test2','test','test',155,'test')
Insert Products 
Values(3,'test3','test','test',255,'test')

--[3] Products���̺� �ִ� ��� �ʵ带 �������� ���ν��� ����
CREATE PROC ProductList
AS
	SELECT * FROM Products
GO

--���ν��� ����
EXECUTE ProductList
EXEC ProductList
ProductList

--[4] UnitCost�� �� �̻��� ���� ��ȸ�ϰ��� �� ���� ���ν��� ����
CREATE PROC ProductsByUnitCost 
	@UnitCost int
AS
	SELECT * FROM Products 
	WHERE UnitCost > @UnitCost
GO

--���ν��� ����
EXEC ProductsByUnitCost 50
EXEC ProductsByUnitCost 200

--[5] ���ڿ� �����͸� ó���ϴ� ���ν��� ����
CREATE PROC ProductsByModelNumber
	@ModelNumber VarChar(50)
AS
	SELECT * FROM Products 
	WHERE ModelNumber = @ModelNumber
Go

--���ν��� ����
EXEC ProductsByModelNumber 'test1'
EXEC ProductsByModelNumber 'test2'

--[6] ���� �Ű����� ó�� : Products���̺� ���� �Է��ϴ� ���� ���ν���
Create Proc ProductsAdd
(
	@CategoryID int,
	@ModelNumber VarChar(50),
	@ModelName VarChar(50),
	@ProductImage VarChar(50),
	@UnitCost money,
	@Description VarChar(3800)
)
AS
	Insert Into Products 
	Values
	(
		@CategoryID, 
		@ModelNumber, 
		@ModelName, 
		@ProductImage, 
		@UnitCost, 
		@Description
	)
	
	Select @@Identity --��� ���� �Էµ� Identity ���� ��ȯ
Go

--���ν��� ����
ProductsAdd 1, 'test4', 'test', 'test', 155, 'test'

--Select * From Products Where ModelNumber = 'test4'

--[7] ���ڿ� ���� ������� �Ű����� ��� : ���� SQL��
--SELECT * FROM Products 
--WHERE modelNumber = 'test1'
CREATE PROC SearchList
	@tblName VarChar(20),
	@modelNumber VarChar(50)
AS
	DECLARE @strSql VarChar(200)
	SET @strSql = 
		'SELECT * FROM ' + @tblName 
		+ ' WHERE modelNumber = ''' --��������ǥ 3��
		+ @modelNumber + '''' --��������ǥ 4��
	Print @strSql
	EXEC(@strSql)
GO

--���ν��� ����
EXEC SearchList 'Products', 'test1'
EXEC SearchList 'Products', 'test2'

--[8] TOP������ ���ǻ��� : int�� ������� �� ��.
--Select Top 4 * From Products
CREATE PROC productsTopN
	@TopN VarChar(3) --Top n �̶��ص� �������̹��ڿ��� ó���� ��.
AS
	DECLARE @strSql VarChar(150)
	SET @strSql = 
		'SELECT Top ' + @TopN 
		+ ' * FROM Products'
	Print @strSql
	EXEC(@strSql)
Go

--���ν��� ����
EXEC productsTopN '2'

--[9] �˻� ��� ������(Like�� ���) : ���� SQL��
--Select * From Products 
--Where ModelNumber Like '%test%'
CREATE PROC SearchProducts
	@modelNumber VarChar(50)
AS
	DECLARE @strSql VarChar(150)
	SET @strSql = 
		'SELECT * FROM Products' 
		+ ' WHERE ModelNumber 
		like ''%' + @modelNumber + '%'''
	Print @strSql
	EXEC (@strSql)
Go

--���ν��� ����
EXEC SearchProducts 'test'
EXEC SearchProducts 'test3'

--[10] ������ DB ����
--Use Master
--Go

--Drop DataBase StudyStoredProcedure
--GO
