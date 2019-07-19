--[1] SP연습용 DB 생성
Use Master
GO

CREATE DATABASE StudyStoredProcedure
GO

sp_helpdb StudyStoredProcedure

Use StudyStoredProcedure
GO

--[2] SP연습용 Table 생성
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

--[3] Products테이블에 있는 모든 필드를 가져오는 프로시져 생성
CREATE PROC ProductList
AS
	SELECT * FROM Products
GO

--프로시져 수행
EXECUTE ProductList
EXEC ProductList
ProductList

--[4] UnitCost가 얼마 이상인 값만 조회하고자 할 때의 프로시져 생성
CREATE PROC ProductsByUnitCost 
	@UnitCost int
AS
	SELECT * FROM Products 
	WHERE UnitCost > @UnitCost
GO

--프로시져 수행
EXEC ProductsByUnitCost 50
EXEC ProductsByUnitCost 200

--[5] 문자열 데이터를 처리하는 프로시저 생성
CREATE PROC ProductsByModelNumber
	@ModelNumber VarChar(50)
AS
	SELECT * FROM Products 
	WHERE ModelNumber = @ModelNumber
Go

--프로시저 수행
EXEC ProductsByModelNumber 'test1'
EXEC ProductsByModelNumber 'test2'

--[6] 다중 매개변수 처리 : Products테이블에 값을 입력하는 저장 프로시저
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
	
	Select @@Identity --방금 전에 입력된 Identity 값을 반환
Go

--프로시저 수행
ProductsAdd 1, 'test4', 'test', 'test', 155, 'test'

--Select * From Products Where ModelNumber = 'test4'

--[7] 문자열 연결 방식으로 매개변수 사용 : 동적 SQL문
--SELECT * FROM Products 
--WHERE modelNumber = 'test1'
CREATE PROC SearchList
	@tblName VarChar(20),
	@modelNumber VarChar(50)
AS
	DECLARE @strSql VarChar(200)
	SET @strSql = 
		'SELECT * FROM ' + @tblName 
		+ ' WHERE modelNumber = ''' --작은따옴표 3개
		+ @modelNumber + '''' --작은따옴표 4개
	Print @strSql
	EXEC(@strSql)
GO

--프로시저 수행
EXEC SearchList 'Products', 'test1'
EXEC SearchList 'Products', 'test2'

--[8] TOP구문시 주의사항 : int형 사용하지 말 것.
--Select Top 4 * From Products
CREATE PROC productsTopN
	@TopN VarChar(3) --Top n 이라해도 가변길이문자열로 처리할 것.
AS
	DECLARE @strSql VarChar(150)
	SET @strSql = 
		'SELECT Top ' + @TopN 
		+ ' * FROM Products'
	Print @strSql
	EXEC(@strSql)
Go

--프로시저 수행
EXEC productsTopN '2'

--[9] 검색 기능 구현시(Like문 사용) : 동적 SQL문
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

--프로시저 수행
EXEC SearchProducts 'test'
EXEC SearchProducts 'test3'

--[10] 연습용 DB 삭제
--Use Master
--Go

--Drop DataBase StudyStoredProcedure
--GO
