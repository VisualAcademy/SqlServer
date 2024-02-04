-- 첨부 파일 관리자
Create Table dbo.AttachFiles
(
    Id Int Not Null Primary Key Identity(1, 1),             -- 일련번호
    UserId Int Null,                                        -- 사용자 Id
    BoardId Int Not Null,                                   -- 게시판 테이블 일련번호
    ArticleId Int Not Null,                                 -- 게시글 Id(Num)
    FileName NVarChar(255) Null,                            -- 파일명
    FileSize Int Null,                                      -- 파일크기
    DownCount Int Default 0,                                -- 다운수
    TimeStamp DateTimeOffset(7) Default(GetDate()) Null     -- 업로드 시간
)
Go

-- 예시문
-- 입력
Insert Into AttachFiles 
    (UserId, BoardId, ArticleId, FileName, FileSize)
Values 
    (6, 4, 1, N'Photo.png', 1234)
Go

-- 출력
Select * From AttachFiles
Go

-- 상세
Select * From AttachFiles Where BoardId = 4 And ArticleId = 1 Order By FileName Asc
Go

-- 수정
Update AttachFiles 
Set 
    FileName = N'Photo2222.jpg',
    FileSize = 2345
Where 
    BoardId = 4 And ArticleId = 1 And Id = 2
Go

-- 삭제
Delete AttachFiles
Where Id = 2
Go

-- 검색
Select * From AttachFiles Where FileName Like '%to%' Order By FileName Asc
Go

-- T-SQL 구문을 사용하여 AttachFiles 테이블에 200건의 샘플 데이터 저장하기
-- Declare: 변수 선언
-- Set: 변수에 값을 할당
-- Begin, End: 하나의 실행문의 시작과 종료 구분
Declare @i Int                                                                  -- 변수 선언
Set @i = 1                                                                      -- 초기식
While @i <= 200                                                                 -- 조건식
Begin
    Insert Into AttachFiles (UserId, BoardId, ArticleId, FileName, FileSize)    -- 실행문
    Values (@i, @i, @i, N'Photo.png', 1234)
    Set @i = @i + 1                                                             -- 증감식
End
Go

-- AttachFiles 테이블에 데이터 입력 저장 프로시저
CREATE PROCEDURE [dbo].[AttachFilesAdd]
    @UserId      Int = 0,          
    @BoardId     Int = 0,          
    @ArticleId   Int = 0,          
    @FileName    NVarChar(255) = '',
    @FileSize    Int = 0              
AS
    Insert Into AttachFiles 
        (UserId, BoardId, ArticleId, FileName, FileSize)
    Values 
        (@UserId, @BoardId, @ArticleId, @FileName, @FileSize)
Go

-- AttachFiles 테이블에 데이터 조회(페이징 처리) 저장 프로시저
CREATE PROCEDURE [dbo].[AttachFilesGetAll]
    @PageNumber Int = 1,
    @PageSize Int = 10
AS
    Select * From AttachFiles Order By Id Desc
    Offset ((@PageNumber - 1) * @PageSize) Rows Fetch Next @PageSize Rows Only;
Go

CREATE PROCEDURE [dbo].[AttachFilesGetByBoardAndArticle]
    @BoardId Int = 0,
    @ArticleId Int = 0
AS
    Select * From AttachFiles 
    Where BoardId = @BoardId And ArticleId = @ArticleId  
    Order By FileName Asc
Go

Exec AttachFilesGetByBoardAndArticle 4, 2
Go

-- 첨부 파일 테이블의 Id 값 단일 레코드 조회
CREATE PROCEDURE [dbo].[AttachFilesGetById]
    @Id Int = 0
AS
    Select * From AttachFiles Where Id = @Id
Go

Exec AttachFilesGetById 80
Go

-- 특정 첨부 파일(Id)의 파일명과 파일크기 수정
CREATE PROCEDURE [dbo].[AttachFilesUpdate]
    @FileName    NVarChar(255) = '',
    @FileSize    Int = 0,        
    @Id Int = 0 
AS
    Update AttachFiles 
    Set 
        FileName = @FileName,
        FileSize = @FileSize
    Where 
        Id = @Id
Go

Exec AttachFilesUpdate 'Photo1234.gif', 2345, 79
Go

-- 첨부 파일 테이블의 특정 데이터(Id) 삭제
CREATE PROCEDURE [dbo].[AttachFilesRemoveById]
    @Id Int = 0
AS
    Delete AttachFiles Where Id = @Id
Go

Exec AttachFilesRemoveById 80
Go


Alter PROCEDURE [dbo].[AttachFilesGetByFileName]
    @FileName    NVarChar(255) = ''
AS
    Declare @sql NVarChar(Max) 
    Set @sql = '
        Select * From AttachFiles Where 
        FileName Like ''%' + @FileName + '%'' Order By FileName Asc
    '
    -- Print @sql 
    Exec(@sql)
Go

Exec AttachFilesGetByFileName 'gif'
Go
