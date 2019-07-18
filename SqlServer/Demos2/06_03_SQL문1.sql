------------------------------------------------------------------------------------------
--[1] 쿼리편집기 사용하기
-- '--'(Double-hyphen)은 주석문으로 처리... /* ~ */ 도 주석으로 처리
-- SQL 구문 실행은 해당 구문을 블럭을 씌운 후 F5이나 실행버튼을 누른다.
-- ※ SQL문에서 문자열은 반드시 작은따옴표(')로 묶는다.
-- SQL을 연습하실때는 항상 SQL 2008 온라인 설명서(도움말)를 적극활용한다. 

--연습용 테이블 생성(관리도구로 만들어도 됨)
CREATE TABLE dbo.Memos
(
	Num Int IDENTITY(1, 1) NOT NULL Primary Key,	-- 번호
	[Name] VarChar(25) Not Null,			-- 이름
	Email VarChar(50) NULL,				-- 이메일
	Title VarChar(150) NULL,						-- 한줄메모(제목)
	PostDate DateTime NULL Default(GetDate())		-- 작성일
)
Go 

-- Memos 테이블에 대한 속성을 보여주는 명령어
Exec sp_help Memos
Go
Execute sp_help Memos
Go
sp_help Memos
Go

--[2] 1. INSERT(삽입) 문
--정의) Insert TableName(FieldNameList,...) Values(FileldValueList,...)

--[3] Memos에 데이터 삽입.
Insert Memos(Name, Email, Title, PostDate) 
Values('홍길동','hong@hong.com','하늘',GetDate())
Go
   -- 부연 설명 : 위 구문에서 날짜함수인 GetDate() 사용 : 현재 시스템의 날짜 시간을 반환.
   -- 2001-08-19 01:07:20.070식으로 출력.

Select GetDate()   -- 현재 시간을 검색. : .NET에서의 DateTime.Now와 같은 역할
Go
Select Year(GetDate()), Month(GetDate()), Day(GetDate())	-- 오늘의 날짜(년/월/일)
Go
Select DateDiff(DD, GetDate(), '2010-12-25')   -- 2010년 크리스마스가 얼마나 남았는지 계산(DD는 일수)
Go

--(퀴즈) 내가 지금까지 몇 일 살아왔는지? 
Select DateDiff(dd, '1982-02-05', GetDate())
Go

--검색결과를 표 형태로 보고 싶으면 [메뉴]-[쿼리]-[표 형태로 결과 표시(Ctrl+D)]를 선택한다.

Insert Memos(Name, Email, Title, PostDate) 
Values('백두산','hong@hong.com','백두산',GetDate())
Go

Insert Into Memos(Name, Email, Title, PostDate) 
Values('한라산','hong@hong.com','하늘',GetDate())
Go

Insert Memos(Email, Name, PostDate, Title)
Values('nimda@nimda.com', '임꺽정', GetDate(), '님 걱정')
Go

--해당 필드이름은 생략가능하다. 단, 필드이름 순서대로 데이터를 삽입해야한다.
Insert Memos Values('박용준','redplus@redplus.net','서울',GetDate())
Go

--[4] Title 영역에 '(작은따옴표) 삽입
-- 작은따옴표 두개를 연속으로 붙여쓰면 SQL에서는 '(작은따옴표) 인식한다.
Insert Memos(Name, Email, Title, PostDate) 
Values('홍길동','hong@hong.com','하''늘',GetDate())
--Select * From Memos
Select '하''늘'   -- 하'늘 출력
Select '하'''   -- 하' 출력

--[5] Memos테이블에 1000건의 레코드 기록(참고:Declare부터~End까지 실행시켜야 함.)
--Declare : 변수 선언
--Set : 값 할당
DECLARE @i Int		--변수선언	
SET @i = 1		--변수 값 할당
WHILE @i <= 200
BEGIN
	Insert Memos(Name, Email, Title, PostDate) Values('백두산','hong@hong.com','백록담',GetDate())
	Insert Memos(Name, Email, Title, PostDate) Values('한라산','hong@hong.com','제주도',GetDate())
	Insert Memos(Name, Email, Title, PostDate) Values('지리산','hong@hong.com','지루함',GetDate())
	Insert Memos(Name, Email, Title, PostDate) Values('계룡산','hong@hong.com','계룡대',GetDate())
	Insert Memos(Name, Email, Title, PostDate) Values('홍길동','hong@hong.com','홍길순',GetDate())
	SET @i = @i + 1
END
GO


Select Count(*) From Memos;

Select * 
From Memos
Order By Num Desc
OffSet 5 Rows Fetch Next 3 Rows Only;

