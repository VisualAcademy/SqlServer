-- OFFSET-FETCH 필터

--[0] 연습용 테이블 생성
CREATE TABLE dbo.Memos
(
	Num Int IDENTITY(1, 1) NOT NULL Primary Key,	-- 번호
	[Name] VarChar(25) Not Null,					-- 이름
	Email VarChar(50) NULL,							-- 이메일
	Title VarChar(150) NULL,						-- 한줄메모(제목)
	PostDate DateTime NULL Default(GetDate())		-- 작성일
)
Go 

--[0] Memos테이블에 1000건의 레코드 기록
DECLARE @i Int		--변수선언	
SET @i = 1			--변수 값 할당
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


--[1] 전체 레코드 조회
Select Count(*) From Memos;
-- Select * From Memos Order By Num Desc;


--[2] OFFSET-FETCH 필터를 사용한 페이징 처리: SQL Server 2012부터 지원
Select * 
From Memos
Order By Num Desc
OffSet 5 Rows Fetch Next 3 Rows Only; -- 5개 행 Skip 후 3개 행 Take

Select * 
From Memos
Order By Num Desc
OffSet 10 Rows Fetch Next 10 Rows Only; -- 10개 행 Skip 후 10개 행 Take

-- 단수형일 때에는 Rows 대신에 Row 사용해도 됨
Select * 
From Memos
Order By Num Desc
--OffSet 1 Rows Fetch Next 1 Rows Only; -- 1개 행 Skip 후 1개 행 Take
OffSet 1 Row Fetch Next 1 Row Only; -- 1개 행 Skip 후 1개 행 Take


-- 페이징 처리 [저장 프로시저] 또는 [함수]로 확장해서 사용
Select * 
From Memos
Order By Num Desc
OffSet  (2 - 1) * 10 Rows Fetch Next 10 Rows Only;




