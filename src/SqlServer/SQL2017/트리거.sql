-- 트리거(Trigger) : 방아쇠의 의미로, 하나의 동작이 실행되면 다른 동작을 자동으로 실행되도록
-- 누군가가 상품을 구매를하면 구매테이블에 데이터가 저장(Insert)되고, 그와 동시에
-- 재고테이블에서 구매한 수량만큼 해당 데이터를 감소시키고자 한다.

--[0] 트리거 연습용 테이블 생성
--DROP TABLE dbo.[구매테이블]
CREATE TABLE dbo.[구매테이블]
(
	CustomerID int, --고객번호
	ProductID int,	--상품번호
	Quantity int	--주문수량
)
GO

--DROP TABLE dbo.[재고테이블]
CREATE TABLE dbo.[재고테이블]
(
	ProductID int,	--상품번호
	Quantity int	--재고수량
)
GO

--[1] 재고테이블에 1번, 2번 제품을 10개 넣어놓음(가상)
INSERT [재고테이블] VALUES(1, 10)
INSERT [재고테이블] VALUES(2, 10)
SELECT * FROM [재고테이블]
Select * From [구매테이블]

--[2] 구매가 한번 이루어지면 자동으로 재고테이블에서 수량을 감소시키는 트리거 작성
CREATE TRIGGER [자동재고감소]
ON [구매테이블] 
FOR INSERT --구매 테이블에 데이터가 입력되는 순간
AS
	UPDATE [재고테이블] 
	SET Quantity = Quantity - 1 -- 수량을 1감소

	PRINT '재고테이블에서 수량이 1개 감소했습니다.'
Go

--[3] 구매테이블에 INSERT문을 실행시켜본다.
SELECT * FROM [재고테이블]
Select * From [구매테이블]

INSERT [구매테이블] VALUES(1, 1, 1) -- 의미 : 1번 고객이 1번 제품을 1개 구입

--[4] 트리거에의해 재고테이블의 모든 필드값이 자동으로 감소됨을 알 수 있다.
SELECT * FROM [재고테이블]
Select * From [구매테이블]

--[5] 트리거를 수정해보자: 구매개수만큼 재고수량을 줄이도록 수정
ALTER TRIGGER [자동재고감소]
ON [구매테이블]
FOR INSERT
AS
	DECLARE @ProductID Int
	Declare @Quantity Int

	SET @ProductID = 0
	SET @Quantity = 0

	--Select * From [구매테이블]

	SELECT 
		@ProductID = ProductID, 
		@Quantity = Quantity 
	FROM INSERTED  -- INSERTED(임시테이블)에 의해서 입력된 데이터 받아옴

	UPDATE [재고테이블] 
	SET Quantity = Quantity - @Quantity
	WHERE ProductID = @ProductID
GO

--[6] 1번 제품만을 1개 감소
INSERT [구매테이블] VALUES(1, 1, 1)
SELECT * FROM [재고테이블]

--[7] 2번 제품만을 3개 감소
INSERT [구매테이블] VALUES(1, 2, 3)
SELECT * FROM [재고테이블]

--[8] 트리거 삭제
DROP TRIGGER [자동재고감소]
Go

--[!] [자동재고감소]와 동일한 기능을 하는 입력 저장프로시저
Create Procedure dbo.[자동재고감소프로시저]
	@CustomerID 	Int,
	@ProductID   	Int,
	@Quantity  	Int
As
	Begin Tran
		-- 데이터가 저장되면,
		Insert [구매테이블]
		Values
		(
			@CustomerID,
			@ProductID,
			@Quantity
		)
		-- 그와 동시에 재고테이블에서 업데이트
		UPDATE [재고테이블] 
		SET Quantity = Quantity - @Quantity
		WHERE ProductID = @ProductID

		Select * From [재고테이블]
	Commit Tran
Go

Exec [자동재고감소프로시저] 1, 2, 3
Go