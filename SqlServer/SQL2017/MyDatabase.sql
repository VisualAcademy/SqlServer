-- 테이블 생성
Create Table MyTable1
(
	Num Int Identity(1, 1) Primary Key,
	Name VarChar(25) Not Null
)
Go

-- 데이터입력
Declare @i Int
Set @i = 1
While @i <= 10000
Begin
	Insert Into MyTable1 Values('홍길동')
	Set @i = @i + 1
End

-- 테이블 생성
Create Table MyTable2
(
	Num Int Identity(1, 1) Primary Key,
	Name VarChar(25) Not Null
)
Go

-- 데이터입력
Declare @i Int
Set @i = 1
While @i <= 10000
Begin
	Insert Into MyTable2 Values('홍길동')
	Set @i = @i + 1
End



