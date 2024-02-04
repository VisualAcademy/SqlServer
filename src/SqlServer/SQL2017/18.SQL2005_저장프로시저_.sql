-- 저장 프로시저(Stored Procedure) : SQL Server내에서의 프로그래밍 개체

--[1] 테이블 설계
Create Table dbo.AdminMemos
(
	Num Int Identity(1, 1) Not Null Primary Key,	-- 일련번호
	[Content] Text Not Null							-- 내용
)
Go

--[2] 입력 예시문 : 글쓰기, 회원가입
Insert AdminMemos Values('저장 프로시저 연습')
Go
--[3] 출력 예시문 : 리스트, 회원리스트, 상품리스트
Select * From AdminMemos Order By Num Desc
Go
--[4] 상세 예시문 : 회원상세보기, 주문상세내역, 게시물보기
Select Num, Content From AdminMemos Where Num = 1
Go
--[5] 수정 예시문 : 회원정보수정, 게시물수정
Begin Tran
	Update AdminMemos
	Set Content = '저장 프로시저 안습'
	Where Num = 1
	--RollBack Tran
Commit Tran
--[6] 삭제 예시문 : 회원탈퇴, 게시물삭제
Begin Tran
	Delete AdminMemos
	Where Num = 1
	--RollBack Tran
Commit Tran
--[7] 검색 예시문 : 회원검색, 상품검색
Select Num, Content
From AdminMemos
Where [Content] Like '%프로시저%'
Go

--[8] 1부터 100까지 짝수일 때에는 Content에 '안녕'을 입력,
--    홀수일 때에는 '방가'를 입력
Declare @i Int
Set @i = 1
While @i <= 100
Begin 
	If @i % 2 = 0 
	Begin
		Insert AdminMemos Values('안녕')
	End 
	Else
	Begin
		Insert Into AdminMemos Values('방가')
	End
	Set @i = @i + 1
End 
Go

--[9] 뷰 생성 : 전체 레코드를 조회
Create View dbo.GetAdminMemos
As
	Select Num, Content From AdminMemos
Go
Select * From GetAdminMemos Order By Num Desc
Go

--[10] 입력 예시문 -> 프로그래밍화(매개변수화) -> 입력 저장 프로시저
Create Procedure dbo.AddAdminMemo
As
	Insert AdminMemos Values('저장 프로시저 연습')
Go

--[11] 저장 프로시저 실행 : Execute, Exec, 저장프로시저명
Execute AddAdminMemo
Go
Exec AddAdminMemo
Go
AddAdminMemo
Go

--[12] 저장 프로시저 수정
Alter Procedure dbo.AddAdminMemo
	@Content VarChar(8000)
As
	Insert AdminMemos Values(@Content)
Go

--[13] 매개변수가 있는 저장 프로시저 실행
Exec AddAdminMemo '안녕'
Go
Exec AddAdminMemo '방가' 
Go

--[14] 긴 SQL문을 짧은 하나의 명령어(저장프로시저명)으로 변환
Create Procedure dbo.ListAdminMemos
As
	Select * From AdminMemos Order By Num Desc
Go

--[15] 매개변수가 없는 저장 프로시저 테스트
Exec ListAdminMemos
Go

--[16] 넘겨주는 값에 따른 결과 생성
Create Proc dbo.ViewAdminMemos
	@Num Int
As
	Select Num, Content From AdminMemos Where Num = @Num
Go

--[17] 매개변수가 있는 저장 프로시저 실행
Exec ViewAdminMemos 100
Go
Exec ViewAdminMemos 5
Go

--[18] 넘겨져 온 번호에 해당하는 내용을 넘겨져온 값으로 수정
Create Proc dbo.ModifyAdminMemos
	@Content VarChar(8000),
	@Num Int
As
	Begin Tran
		Update AdminMemos
		Set Content = @Content
		Where Num = @Num
		--RollBack Tran
	Commit Tran
Go
--[19] 위 저장 프로시저 실행 예시
Exec ModifyAdminMemos '반갑습니다.', 100
Go
Exec ViewAdminMemos 100
Go

--[20] 삭제 저장 프로시저 생성 
Create Proc dbo.DeleteAdminMemos
	@Num Int
As
	Begin Tran
		Delete AdminMemos
		Where Num = @Num
		--RollBack Tran
	Commit Tran

	--Select * From AdminMemos Where Num = @Num
Go
--[21] 실행
DeleteAdminMemos 100
Go

--[22] 검색 저장 프로시저 : 저장 프로시저보다는 동적 쿼리문이라고 부름.
Create Proc dbo.SearchAdminMemos
	@Content VarChar(50)
As
	Declare @strSql VarChar(255)
	Set @strSql = '
		Select Num, Content
		From AdminMemos
		Where [Content] Like ''%' + @Content + '%''
	'
	Exec(@strSql) -- 동적으로 만든 SQL문을 실행하는 명령어
Go

--[23] 동적쿼리문으로 검색
SearchAdminMemos '안녕'
Go
SearchAdminMemos '방가'
Go