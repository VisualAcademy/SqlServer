--[1] 카테고리
--Truncate Table dbo.Categories
CREATE TABLE dbo.Categories
(
    CategoryID Int IDENTITY(1, 1) NOT NULL Primary Key, --카테고리번호
    CategoryName VarChar(50),                           --카테고리명
    --
    SuperCategory Int Null,               --부모카테고리번호(확장용)
    Align SmallInt Default(0)             --카테고리보여지는순서(확장용)
)
GO
--[2] 입력 예시문
Insert Categories Values('컴퓨터', NULL, 0)
Go
Insert Categories Values('노트북', 1, 0)
Go
Insert Categories Values('데스크톱', 1, 1)
Go
Insert Categories Values('서적', NULL, 1)
Go
Insert Categories Values('ASP.NET', 4, 0)
Go
Insert Categories Values('C#', 4, 1)
Select @@Identity -- 마지막에 삽입된 데이터의 Identity값
Go
--[3] 출력 : 최상위 카테고리만 출력
Select CategoryID, CategoryName 
From Categories
Where SuperCategory Is Null
Order by Align Asc
Go
--[4] 상세 : 1번 카테고리의 하위 카테고리 출력
Select * From Categories Where SuperCategory = 1
Go
--[5] 수정 : 카테고리명 변경
Begin Tran
	Update Categories
	Set CategoryName = '컴퓨러'
	Where CategoryID = 1
	--여기 시점에서 에러가 발생하면 되돌린다.
	If @@Error > 0		-- 에러 개수를 반환
	Begin
		RollBack Tran
	End
Commit Tran
GO
--[6] 삭제
Begin Tran
	Delete Categories 
	Where CategoryID = 3

	Select @@RowCount -- 삭제된 데이터의 개수 : 1

	If @@Error > 0
	Begin 
		RollBack Tran
	End
Commit Tran
--[7] 검색
Select CategoryID, CategoryName
From Categories
Where CategoryName Like '%컴퓨%'
Go
--[8] 입력 저장 프로시저 : Add테이블명, Write테이블명
Create Proc dbo.AddCategory
(
	@CategoryName VarChar(50),
	@SuperCategory Int,
	@Align Int
)
As
	Insert Categories Values(@CategoryName, @SuperCategory, @Align)
	Select @@Identity -- 마지막에 삽입된 데이터의 Identity값
Go
Exec AddCategory 'SQL', 4, 2
Go
--[9] 출력 저장 프로시저 : Get테이블명, List테이블명
Create Proc dbo.GetCategories
With Encryption -- 저장 프로시저 구문 암호화
As
	Select CategoryID, CategoryName 
	From Categories
	Where SuperCategory Is Null
	Order by Align Asc
Go
Execute GetCategories
Go
--[10] 상세 저장 프로시저 : Get테이블명, View테이블명
Create Proc dbo.GetCategory
	@SuperCategory Int
As
	Select * From Categories Where SuperCategory = @SuperCategory
Go
Execute GetCategory 1
GO
Exec GetCategory 4
Go
--[11] 수정 저장 프로시저 : Edit테이블명, Modify테이블명
Create Procedure dbo.EditCategories
(
	@CategoryID Int,
	@CategoryName VarChar(50),
	@Align Int
)
As
	Begin Tran
		Update Categories
		Set CategoryName = @CategoryName, Align = @Align
		Where CategoryID = @CategoryID
		--여기 시점에서 에러가 발생하면 되돌린다.
		If @@Error > 0		-- 에러 개수를 반환
		Begin
			RollBack Tran
		End
	Commit Tran
Go
Exec EditCategories 1, '콤퓨타', 2
Go
--[12] 삭제 저장 프로시저 : Delete테이블명
Create Proc dbo.DeleteCategory
	@CategoryID Int
As
	Begin Tran
		Delete Categories 
		Where CategoryID = @CategoryID

		Select @@RowCount -- 삭제된 데이터의 개수 : 1

		If @@Error > 0
		Begin 
			RollBack Tran
		End
	Commit Tran
Go
Exec DeleteCategory 7
Go
--[13] 검색 저장 프로시저(동적쿼리문) : Search테이블명, Find테이블명 
Create Proc dbo.FindCategory
	@CategoryName VarChar(50)
As
	Declare @strSql VarChar(255)
	Set @strSql = '
		Select CategoryID, CategoryName 
		From Categories 
		Where CategoryName Like ''%' + @CategoryName + '%''
	'
	-- Print @strSql
	Exec(@strSql)
Go
--Declare @strSql VarChar(255)
--Set @strSql = 'Select * From Categories'
--Exec(@strSql)
Execute FindCategory 'ASP.NET'
Go