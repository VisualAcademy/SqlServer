--ī�װ� ���̺� ����
Create Table dbo.Categories
(
	CategoryID Int Identity(1, 1) Not Null Primary Key, -- ī�װ���ȣ
	CategoryName VarChar(25) Not Null					-- ī�װ���
)
Go
Insert Categories Values('����')
Go
Insert Categories Values('��ǻ��')
Go
Insert Categories Values('����')
Go
--��ǰ ���̺� ����
Create Table dbo.Products
(
	ProductID Int Identity(1, 1) Not Null Primary Key,	-- ��ǰ ������ȣ
	ModelName VarChar(25) Not Null,						-- ��ǰ��
	SellPrice Int Null,									-- ����
	CategoryID Int Null									--ī�װ�(1,2,3)
)	
Go
-- ����, �����, 100
Insert Products Values('�����', 100, 1)
Go
-- ��ǻ��, ��Ʈ��, 200
Insert Products Values('��Ʈ��', 200, 2)
Go
Insert Products Values('����ũ��', 150, 2)
Go

Select * From Categories
Go
Select * From Products
Go
Select ModelName, SellPrice From Products
Go
--SQL Server ���� ����
Select ModelName, SellPrice, CategoryName
From Products, Categories
Where Products.CategoryID = Categories.CategoryID
Go
--SQL ���� ����
Select ModelName, SellPrice, CategoryName
From Products Join Categories 
On Products.CategoryID = Categories.CategoryID
Go
--[����] �� ���� ������ ���
SELECT     dbo.Products.ModelName, dbo.Products.SellPrice, dbo.Categories.CategoryName
FROM         dbo.Categories INNER JOIN
                      dbo.Products ON dbo.Categories.CategoryID = dbo.Products.CategoryID
Go
--���� ���� �� ǥ��
Select 
	Products.ModelName, 
	Products.SellPrice, 
	Categories.CategoryName,
	Categories.CategoryID As [ī�װ���ȣ]
From Products Inner Join Categories 
On Products.CategoryID = Categories.CategoryID
Go
--���� ���� ��� ǥ��
Select p.ModelName, p.SellPrice, c.CategoryName, c.CategoryID
From Products p Join Categories c
On p.CategoryID = c.CategoryID
Go
--���� ������ ����� ����
Select ModelName, SellPrice, CategoryID
From Products
Where CategoryID In (Select CategoryID From Categories)
Go