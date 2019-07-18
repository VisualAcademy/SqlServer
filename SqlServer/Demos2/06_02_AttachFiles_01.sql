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

