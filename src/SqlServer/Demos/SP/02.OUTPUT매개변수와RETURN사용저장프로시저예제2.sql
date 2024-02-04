--[1] 상품의 가격을 2배로 업데이트하는 저장 프로시저 : 업데이트된 레코드의 갯수를 반환
CREATE PROC UpdateUnitCost
	@modelNumber varchar(50),
 	@output int OUTPUT
AS
	UPDATE Products 
	SET UnitCost = UnitCost * 2
	WHERE ModelNumber = @modelNumber

	SET @output = (SELECT @@ROWCOUNT)
Go

--Select * From Products
Exec UpdateUnitCost 'test1', 1

--프로시저 수행
DECLARE @Number int
EXEC UpdateUnitCost 'test2', @Number OUTPUT
SELECT @Number

--[2] Products테이블에 있는 레코드의 갯수를 반환
Create Proc dbo.GetProductsCount
As
	Select Count(*) 
	From Products
Go

--실행
Exec GetProductsCount

--위 저장 프로시저 방식을 Output 매개변수 방식으로 변경

CREATE Procedure ProductsCount
(
	@ItemCount int Out  
)
AS
	SELECT 
	    @ItemCount = Count(*)
	FROM 
	    Products
Go

--프로시저 수행
DECLARE @Number int
EXEC ProductsCount @Number OUTPUT
SELECT @Number --1

--[3] RETURN을 사용한 저장 프로시저
Create PROC ReturnUpdateUnitCost
	@modelNumber varchar(50)
AS
	UPDATE Products 
	SET UnitCost = UnitCost / 2
	WHERE ModelNumber = @modelNumber

	RETURN @@ROWCOUNT --총 몇개의 레코드가 변경???
Go

--프로시저 수행
DECLARE @Number int
EXEC @Number = ReturnUpdateUnitCost 'test2'
SELECT @Number
--Select * From Products

--[4] 연습용 DB 삭제
Use Master
Go

Drop DataBase StudyStoredProcedure
GO
