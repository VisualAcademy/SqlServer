--카테고리 테이블 설계
Create Table dbo.Categories
(
	CategoryID Int Identity(1, 1) Not Null Primary Key, -- 카테고리번호
	CategoryName VarChar(25) Not Null					-- 카테고리명
)
Go
Insert Categories Values('가전')
Go
Insert Categories Values('컴퓨터')
Go
Insert Categories Values('서적')
Go
--상품 테이블 설계
Create Table dbo.Products
(
	ProductID Int Identity(1, 1) Not Null Primary Key,	-- 상품 고유번호
	ModelName VarChar(25) Not Null,						-- 상품명
	SellPrice Int Null,									-- 가격
	CategoryID Int Null									--카테고리(1,2,3)
)	
Go
-- 가전, 냉장고, 100
Insert Products Values('냉장고', 100, 1)
Go
-- 컴퓨터, 노트북, 200
Insert Products Values('노트북', 200, 2)
Go
Insert Products Values('데스크톱', 150, 2)
Go

Select * From Categories
Go
Select * From Products
Go
Select ModelName, SellPrice From Products
Go
--SQL Server 조인 구문
Select ModelName, SellPrice, CategoryName
From Products, Categories
Where Products.CategoryID = Categories.CategoryID
Go
--SQL 조인 구문
Select ModelName, SellPrice, CategoryName
From Products Join Categories 
On Products.CategoryID = Categories.CategoryID
Go
--[데모] 뷰 생성 마법사 사용
SELECT     dbo.Products.ModelName, dbo.Products.SellPrice, dbo.Categories.CategoryName
FROM         dbo.Categories INNER JOIN
                      dbo.Products ON dbo.Categories.CategoryID = dbo.Products.CategoryID
Go
--조인 구문 상세 표현
Select 
	Products.ModelName, 
	Products.SellPrice, 
	Categories.CategoryName,
	Categories.CategoryID As [카테고리번호]
From Products Inner Join Categories 
On Products.CategoryID = Categories.CategoryID
Go
--조인 구문 축약 표현
Select p.ModelName, p.SellPrice, c.CategoryName, c.CategoryID
From Products p Join Categories c
On p.CategoryID = c.CategoryID
Go
--서브 쿼리를 사용한 조인
Select ModelName, SellPrice, CategoryID
From Products
Where CategoryID In (Select CategoryID From Categories)
Go