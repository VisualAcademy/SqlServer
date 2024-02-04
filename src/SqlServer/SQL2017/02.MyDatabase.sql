--[1] Create문
Create Table dbo.Memos
(
	Num Int Identity(1, 1) Not Null Primary Key, -- 번호
	Name VarChar(25) Not Null, -- 이름
	Email VarChar(50) Null, -- 이메일
	Title VarChar(150) Not Null, -- 제목(간단메모)
	PostDate DateTime Default(GetDate()), -- 작성일
	PostIP VarChar(15) Null -- IP주소 
)
Go
--[2] Drop문
Drop Table dbo.Memos
Go
--[3] 입력
Insert Memos(Name, Email, Title, PostDate, PostIP) 
Values('홍길동', 'h@h.com', '안녕하세요.', GetDate(), '127.0.0.1')
Go
--[4] 출력
Select * 
From Memos
Order By Num Desc
Go
--[5] 상세
Select Num, Name, Title, PostDate
From Memos
Where Num = 1
Go
--[6] 수정
Begin Tran
	Update Memos
	Set Name = '백두산', Email = 'b@b.com'
	Where Num = 1
Commit Tran
Go
--[7] 삭제
Delete Memos
Where Num = 1
Go
--[8] 검색
Select * 
From Memos
Where Name Like '%길%'
Go

--[!] 1부터 100까지 3의 배수 또는 4의 배수의 합을 구하는 프로그램을 
--    T-SQL로 구현하시오.
--[1] 변수 선언
Declare @sum Int
Declare @i Int
--[2] 변수 초기화
Set @sum = 0
--[3] 반복문
Set @i = 1					--[a] 초기식
While @i <= 100				--[b] 조건식
Begin
	If (@i % 3 = 0) Or (@i % 4 = 0)	--[!] 조건식
	Begin
		Set @sum = @sum + @i	--[!] 실행문
	End
	Set @i = @i + 1			--[c] 증감식
End
Select 
	'1부터 100까지 3의 배수 또는 4의 배수의 합 : ' 
	+ Cast(@sum As VarChar)
Go

--[*] 저장 프로시저 만들기
--[1] 입력
Create Proc dbo.AddMemo
(
	@Name VarChar(25),
	@Email VarChar(50),
	@Title VarChar(150),
	@PostIP VarChar(15)
)
As
	Insert Memos(Name, Email, Title, PostDate, PostIP) 
	Values(@Name, @Email, @Title, GetDate(), @PostIP)
Go
AddMemo '한라산', 'h@h.net', '한라산입니다.', '127.0.0.1'
Go
--[2] 출력
Create Proc dbo.GetMemos
As
	Select * 
	From Memos
	Order By Num Desc
Go
Exec GetMemos
Go
--[3] 상세
Create Proc dbo.GetMemo
	@Num Int
As
	Select Num, Name, Title, PostDate
	From Memos
	Where Num = @Num
Go
Execute GetMemo 6
Go
--[4] 수정
Create Proc dbo.EditMemo
(
	@Name VarChar(25),
	@Email VarChar(50),
	@Num Int
)
As
	Begin Tran
		Update Memos
		Set Name = @Name, Email = @Email
		Where Num = @Num
	Commit Tran
Go
Exec EditMemo '지리산', 'j@j.com', 5
Go
--[5] 삭제
Create Procedure dbo.DeleteMemo
	@Num Int
With Encryption
As
	Delete Memos
	Where Num = @Num
Go
Exec DeleteMemo 6
Go
--[6] 검색 : 저장 프로시저 -> 동적 쿼리문(SQL 인젝션 해킹 가능) -> 저장 프로시저
Create Proc dbo.FindMemos
	@SearchField VarChar(50),
	@SearchQuery VarChar(50)
As
	-- Name -> ' + 해당변수 + '
	Declare @strSql VarChar(255)
	Set @strSql = ' 
		Select * 
		From Memos
		Where ' + @SearchField + ' Like ''%' + @SearchQuery + '%''
		Order By Num Desc
	'
	Exec(@strSql)
Go
Exec FindMemos 'Name', '지'
Go
Exec FindMemos 'Email', 'j'
Go
Exec GetMemos
Go
Exec FindMemos ' 1 = 1; Delete Memos; -- ', '홍길동'
Go
--[7] 검색 : 정적 쿼리문(저장 프로시저)
Create Proc dbo.SearchMemos
	@SearchField VarChar(50),
	@SearchQuery VarChar(50)	
As
	Set @SearchQuery = '%' + @SearchQuery + '%' 
	Select * From Memos
	Where 
	(
		Case @SearchField
			When 'Name' Then Name
			When 'Title' Then Title
		Else
			@SearchQuery
		End
	)
		Like
		@SearchQuery
	Order By Num Desc
Go
Exec SearchMemos 'Name', '한라산'
Go
-- 아래 구문은 실행되지 않는다.
Exec SearchMemos ' 1 = 1; Delete Memos; -- ', '홍길동'
Go
