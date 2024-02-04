--[0] tempdb 사용
USE tempdb
GO

--[1] 실습용 테이블 생성 : 간단 공지사항(뉴스) 게시판
-- 글번호, 제목, 링크, 타겟, 작성일
CREATE TABLE dbo.FrontBoard
(
    ItemID Int
		IDENTITY(1, 1)		--[1] 자동증가 : 1부터 1씩 증가 
		NOT NULL			--[2] 널값제약 : NOT NULL(반드시 입력)
		PRIMARY KEY,		--[3] 기본키(단일) : 레코드 구분 필드
    Title VarChar(150)
		NOT NULL
		Unique,				--[4] 유일키 : 테이블에서 유일한 값  						
    Url VarChar(255) 
		NULL,				--[2] 널값제약 : NULL(널 허용) 
    Target VarChar(10)		 
		NULL 
		CHECK				--[5] 체크제약 : 주어진 데이터만 입력 허용
		(
			Target IN('_top','_blank','_parent','_self')
		),
    CreatedDate DateTime 
		DEFAULT(GETDATE())	--[6] 기본값 : 레코드 생성시 기본값 부여
)
GO

--[2] 자동증가 테스트
Insert FrontBoard
Values('제목1', 'http://www.hawaso.com/', '_blank', GetDate())
Go
Insert FrontBoard
Values('제목2', 'http://www.dotnetkorea.com/', '_blank', GetDate())
Go
Select * From FrontBoard Order By ItemID Desc
Go

--[3] 널값 체크
Insert FrontBoard(Title, Url, Target, CreatedDate) 
Values('제목3', 'http://www.live.com/', '_blank', GetDate())
Go
Insert FrontBoard(Url, Target, CreatedDate) 
Values('http://www.live.com/', '_blank', GetDate())
Go --에러발생

--[4] 유일키 제약 조건
Insert FrontBoard(Title, Url, Target, CreatedDate)
Values('제목1', 'http://www.microsoft.com/', '_blank', GetDate())
Go --에러발생

--[5] 체크 제약 조건
Insert FrontBoard(Title, Url, Target, CreatedDate)
Values('제목4', NULL, NULL, GetDate())
Go --정상실행
Insert FrontBoard(Title, Url, Target, CreatedDate)
Values('제목5', NULL, 'test', GetDate())
Go --에러발생

--[6] 기본(Default) 제약 조건
Insert FrontBoard(Title)
Values('제목5')
Go
Select * From FrontBoard
Go
Create Table DefaultTest(PostDate DateTime Default(GetDate())) 
Go
Insert DefaultTest Default Values
Go












