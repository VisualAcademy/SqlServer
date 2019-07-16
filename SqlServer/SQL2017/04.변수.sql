--[0] 예제용 테이블 생성
use tempdb
go

Create Table Memos
(
	Num Int Identity(1,1) Primary Key Not Null,
	[Name] VarChar(10) Null,
	Email VarChar(50) Null,
	Title VarChar(200) Null,
	PostDate DateTime Default(GetDate())
)
Go

-- 샘플 데이터 입력
Insert Memos values('홍길동','hong@kil.dong','홍길동입니다.',GetDate())
Go

-- 로컬 변수 : 선언에서부터 출력까지 블럭씌우고 실행(F5)
--[1]~[4]까지 블럭씌우고 실행
--[1] 숫자형 변수 선언
Declare	@intSu TinyInt
--[2] 변수를 10으로 초기화
Set @intSu = 10
--[3] 변수 값 사용 
Set @intSu = @intSu + 5
--[4] 변수 값 출력
Select @intSu
Go

--[5]~[8]까지 블럭씌우고 실행
--[5] 여러개의 변수 선언
Declare @Name VarChar(25), @Email VarChar(50), @Title VarChar(150)
--[6] 변수 초기화
Set @Name = ''
Set @Email = ''
Set @Title = ''
--[7] Memos 테이블 필드값을 변수에 저장
Select @Name = Name, @Email = Email, @Title = Title
From Memos
Where Num = 1
--[8] 변수 값 출력
Select	@Name, @Email, @Title
Go

-- 변수(Variable) : 변수선언부터 변수출력가지 블럭 씌우고 실행(F5)

-- 변수선언
Declare @Num Int
-- 변수초기화
Set @Num = 1234
-- 변수 사용
Set @Num = @Num * 10
-- 변수 출력
Select @Num 

-- 샘플 테이블 생성 및 변수를 사용해서 데이터 입력
Create Table Products
(
	ModelName VarChar(100) Not Null,
	UnitPrice Int Not Null
) 

Declare @ModelName VarChar(100)
Declare @UnitPrice Int

Set @ModelName = '쉽게 배우는 SQL Server'
Set @UnitPrice = 20000

Insert Into Products Values(@ModelName, @UnitPrice)

Select * From Products

-- SQL 문장을 변수에 담아놓고, 동적으로 실행(동적 쿼리문)
Declare @sql VarChar(255)
Set @sql = 'Select * From Products'
Exec(@sql)












