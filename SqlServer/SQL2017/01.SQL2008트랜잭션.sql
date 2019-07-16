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
--Begin Tran
--	Insert문
--	Update문
--	Delete문
--Commit Tran







