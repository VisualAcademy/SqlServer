--[1] ��ǰ�� ������ 2��� ������Ʈ�ϴ� ���� ���ν��� : ������Ʈ�� ���ڵ��� ������ ��ȯ
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

--���ν��� ����
DECLARE @Number int
EXEC UpdateUnitCost 'test2', @Number OUTPUT
SELECT @Number

--[2] Products���̺� �ִ� ���ڵ��� ������ ��ȯ
Create Proc dbo.GetProductsCount
As
	Select Count(*) 
	From Products
Go

--����
Exec GetProductsCount

--�� ���� ���ν��� ����� Output �Ű����� ������� ����

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

--���ν��� ����
DECLARE @Number int
EXEC ProductsCount @Number OUTPUT
SELECT @Number --1

--[3] RETURN�� ����� ���� ���ν���
Create PROC ReturnUpdateUnitCost
	@modelNumber varchar(50)
AS
	UPDATE Products 
	SET UnitCost = UnitCost / 2
	WHERE ModelNumber = @modelNumber

	RETURN @@ROWCOUNT --�� ��� ���ڵ尡 ����???
Go

--���ν��� ����
DECLARE @Number int
EXEC @Number = ReturnUpdateUnitCost 'test2'
SELECT @Number
--Select * From Products

--[4] ������ DB ����
Use Master
Go

Drop DataBase StudyStoredProcedure
GO
