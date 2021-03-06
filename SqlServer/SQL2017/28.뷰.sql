--카테고리(상품 카테고리) 응용 프로그램 설계

--[0] 테이블 설계
CREATE TABLE dbo.Categories
(
    CategoryID Int IDENTITY(1, 1) NOT NULL Primary Key,  --카테고리번호
    CategoryName VarChar(50),                            --카테고리명
    --
    SuperCategory Int Null,                              --부모카테고리번호(확장용)
    Align SmallInt Default(0)                            --카테고리보여지는순서(확장용)
)
Go

--[1] 입력 : Add / Write
Insert Categories Values('컴퓨터', NULL, Default)
Insert Categories Values('노트북', 1, 1)
Insert Categories Values('핸드폰', NULL, 2)
Insert Categories Values('신규', 3, 3)

--[2] 출력 : Get / List
Select CategoryName From Categories Order By Align Asc

--[3] 상세 : View / Get
Select * From Categories Where CategoryID = 1

--[4] 수정 : Modify / Edit
Update Categories 
Set
	CategoryName = '콤퓨타'
Where CategoryID = 1

--[5] 삭제 : Delete
Delete Categories Where CategoryID = 2

--[6] 검색 : Search / Find
Select * From Categories
Where 
	CategoryName Like '%퓨%'
	And 
	SuperCategory is NULL --널(NULL)값 비교

--[!] 테이블 삭제
Drop Table dbo.Categories
Go

--[7] 뷰(View) 생성 : Select문 전용
--[a] 대분류 데이터를 출력하는 구문을 줄여서 출력
Select CategoryID, CategoryName 
From Categories 
Where SuperCategory Is NULL
--Order By CategoryName Asc

--[b] 위 구문을 줄여주는 뷰(View) 생성
Create View dbo.GetTopCategory
As
	Select CategoryID, CategoryName 
	From Categories 
	Where SuperCategory Is NULL
--	Order By CategoryName Asc
Go

--[c] 뷰(가상 테이블) 사용 : 약간 줄어들죠???
Select * From GetTopCategory
Order By CategoryName Asc

--[d] 뷰(가상 테이블) 수정 : 암호화
sp_helptext GetTopCategory --뷰 구문 보기

--[!] 뷰 구문 수정 : 암호화 처리
Alter View dbo.GetTopCategory
With Encryption -- 개체 암호화 옵션
As
	Select CategoryID, CategoryName 
	From Categories 
	Where SuperCategory Is NULL
--	Order By CategoryName Asc
Go

sp_helptext GetTopCategory --안 보임

--[!] 뷰 구문 수정 : 스키마 바인딩 적용
Alter View dbo.GetTopCategory
With SchemaBinding -- Categories 테이블 변경 불가능
As
	Select CategoryID, CategoryName 
	From dbo.Categories 
	Where SuperCategory Is NULL
Go

-- 위 뷰가 만들어져 있는 상태에서 
-- 아래 구문과 같이 테이블의 내용이 변경되면 에러 발생
Alter Table dbo.Categories
Alter Column CategoryName VarChar(100)
Go

--[!] 뷰 구문 수정 : 체크 옵션???
Alter View dbo.GetTopCategory
As
	Select *
	From dbo.Categories 
	Where SuperCategory Is NULL -- 조건절(대분류만 입력가능)

	With Check Option -- 조건절에 해당하는 데이터만 입력/수정 가능
Go

Insert Categories Values('가전', NULL, Default)
Insert Categories Values('냉장고', 1, 1)

Set Identity_Insert Categories On

Insert Into GetTopCategory Values('가전', NULL, 0) -- 에러
Insert GetTopCategory Values(10, '냉장고', 1, 1) -- 에러
Insert GetTopCategory(CategoryName) Values('오디오') -- 에러
Insert GetTopCategory(CategoryID, CategoryName) Values(10, '오디오') -- 실행
Insert GetTopCategory(CategoryID, CategoryName, SuperCategory) Values(11, '비디오', NULL) -- 실행

--[e] 뷰 삭제
Drop View dbo.GetTopCategory
Go














