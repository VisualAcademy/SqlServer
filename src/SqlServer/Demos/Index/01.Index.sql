Use tempdb
Go
--[0] 테스트용 임시테이블 작성
--Drop Table FrontBoard1
CREATE TABLE dbo.FrontBoard1  -- 웹사이트 전광판 기능 구현할 테이블
(
	ItemID Int IDENTITY(1,1),--PRIMARY KEY 및 NOT NULL -- 넌클러스터드 인덱스
	Title varchar(150) NULL,	-- 클러스터드 인덱스
	Url varchar(50) NULL,
	Target varchar(10) NULL,
	CreatedDate datetime default(getdate())
)
Go
CREATE TABLE dbo.FrontBoard2  -- 웹사이트 전광판 기능 구현할 테이블
(
	ItemID Int IDENTITY(1,1),--PRIMARY KEY 및 NOT NULL
	Title varchar(150) NULL,
	Url varchar(50) NULL,
	Target varchar(10) NULL,
	CreatedDate datetime default(getdate())
)
Go
--[!] 실행속도 비교
Select * From FrontBoard1 Where Title Like '제목%'
Select * From FrontBoard2 Where Title Like '제목%'
--[!] 데이터 입력
Declare @i Int
Set @i = 1
While @i <= 100000
Begin
	Insert FrontBoard1 Values('제목' + Cast(@i As VarChar), 'URL', 'Target', GetDate())
	Insert FrontBoard2 Values('제목' + Cast(@i As VarChar), 'URL', 'Target', GetDate())
	Set @i = @i + 1
End
Go
--[1] FrontBoard의 ItemID필드에 idxFrontBoard란 넌클러스터 인덱스 생성
CREATE INDEX idxFrontBoard
ON FrontBoard1(ItemID)
Go
--[2] sp_helpindex 시스템 저장 프로시저를 이용해서 인덱스 정보 확인
EXEC sp_helpindex FrontBoard
Go
--[3] 인덱스 지우기
DROP INDEX FrontBoard1.idxFrontBoard
Go
--[4] Title필드에 유니크한 클러스터 인덱스 생성
CREATE UNIQUE CLUSTERED INDEX idxFrontBoard1
ON FrontBoard1(Title)
go
--[5] sp_helpindex 시스템 저장 프로시저를 이용해서 인덱스 정보 확인
EXEC sp_helpindex FrontBoard1
--[6] 인덱스 지우기
DROP INDEX FrontBoard.idxFrontBoard  --인덱스 지우기
go
