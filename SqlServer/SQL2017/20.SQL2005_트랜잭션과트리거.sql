--[1] 트랜잭션 관련 샘플 테이블
Create Table dbo.TranTest
(
	Num Int Identity(1, 1) Not Null Primary Key,
	Name VarChar(25) Not Null,
	PostDate SmallDateTime Default(GetDate())
)
Go
--[2] 샘플 데이터 입력
Insert Into TranTest(Name) Values('홍길동')
Go
Insert Into TranTest(Name) Values('한라산')
Go
Insert Into TranTest(Name) Values('백두산')
Go
--[3] 출력
Select * From TranTest
Go
--[4] 트랜잭션 테스트(롤백) : Begin Tran ~ RollBack Tran
--[a] 트랜잭션 시작
Begin Tran
--[b] SQL 구문 실행
Delete TranTest Where Num = 2
--[c] 트랜잭션 롤백 : 트랜잭션 이전으로 상태 돌리기(구문 취소...)
RollBack Tran

--[5] 트랜잭션 처리 : Begin Tran ~ Commit Tran
Begin Tran
Delete TranTest Where Num = 2
Commit Tran

--[6] 트랜잭션에 별칭 부여
Begin Tran DeleteData
	Delete TranTest Where Num = 3
	Select * From TranTest
RollBack Tran DeleteData

--[7] 다중 트랜잭션 처리
Begin Tran 
	Delete TranTest Where Num = 6
	Begin Tran 
		Delete TranTest Where Num = 7
		Select @@TranCount -- 2개
RollBack Tran -- 전체 트랜잭션을 되돌린다.
Commit Tran 

Select * From TranTest

--[8] 트랜잭션 단계 확인
Begin Tran 
	Update TranTest Set Name = '트랜잭션1' Where Num = 8
	Begin Tran 
	Update TranTest Set Name = '트랜잭션2' Where Num = 9
		Select @@TranCount -- 2개
RollBack Tran -- 전체 트랜잭션을 되돌린다.
Commit Tran 

--[9] 트랜잭션의 주요 사용
Begin Tran

	Insert Into TranTest(Name) Values('홍길동')

	Update TranTest Set Name = '트랜잭션1' Where Num = 14

	Insert Into TranTest(Name) Values('홍길동')

	If @@Error > 0		-- 명시적으로 트랜잭션 되돌리기
	Begin
		RollBack Tran
	End

Commit Tran

Select * From TranTest
--[10] 한번 처리에 여러개의 구문 처리시 트랜잭션을 반드시 적용
Begin Tran
	Insert문
	Update문
	Delete문
Commit Tran




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

--[2] 구매가 한번 이루어지면 자동으로 재고테이블에서 감소시키는 트리거 작성
CREATE TRIGGER [자동재고감소]
ON [구매테이블] 
FOR INSERT --구매 테이블에 데이터가 입력되는 순간
AS
	UPDATE [재고테이블] 
	SET Quantity = Quantity - 1

	PRINT '재고테이블에서 1개 감소했습니다.'
Go

--[3] 구매테이블에 INSERT문을 실행시켜본다.
INSERT [구매테이블] VALUES(1, 1, 1)

--[4] 트리거에의해 재고테이블의 모든 필드값이 자동으로 감소됨을 알 수 있다.
SELECT * FROM [재고테이블]

--[5] 트리거를 수정해보자: 구매개수만큼 줄이도록 수정
ALTER TRIGGER [자동재고감소]
ON [구매테이블]
FOR INSERT
AS
	DECLARE @ProductID int
	Declare @Quantity int

	SET @ProductID = 0
	SET @Quantity = 0

	--Select * From [구매테이블]

	SELECT 
		@ProductID = ProductID, 
		@Quantity = Quantity 
	FROM INSERTED  --INSERTED에 의해서 입력된 데이터 받아옴

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

--[!] [자동재고감소]와 동일한 기능을 하는 입력 저장프로시저
Create Procedure dbo.[자동재고감소프로시저]
	@CustomerID 	Int,
	@ProductID   	Int,
	@Quantity  	Int
As
Begin Tran
	Insert [구매테이블]
	Values
	(
		@CustomerID,
		@ProductID,
		@Quantity
	)

	UPDATE [재고테이블] 
	SET Quantity = Quantity - @Quantity
	WHERE ProductID = @ProductID

	Select * From [재고테이블]
Commit Tran
Go
Exec [자동재고감소프로시저] 1, 2, 3
Go










