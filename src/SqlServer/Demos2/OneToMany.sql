-- Boards 테이블
Create Table Boards
(
    Id Int Identity(1, 1) Primary Key,
    BoardAlias NVarChar(50) 
)
Go

Insert Into Boards Values ('Notice')
Go
Insert Into Boards Values ('Free')
Go
Select * From Boards
Go

-- BoardsCategories 테이블
Create Table BoardsCategories
(
    Id Int Identity(1, 1) Primary Key,
    BoardId Int Null,                   -- Boards 테이블의 Id 참조
    BoardAlias NVarChar(50) Null,       -- Boards 테이블의 BoardAlias 참조
    CategoryName NVarChar(50) Null,     -- 카테고리 이름(Text)
    CategoryCode NVarChar(10) Null,     -- 카테고리 코드(Value) => Articles.Category
)
Go

-- 공지사항 카테고리
Insert Into BoardsCategories (BoardId, BoardAlias, CategoryName, CategoryCode) Values (1, 'Notice', N'공지', 'NOTICE')
Go
Insert Into BoardsCategories (BoardId, BoardAlias, CategoryName, CategoryCode) Values (1, 'Notice', N'뉴스', 'NEWS')
Go
-- 자유게시판 카테고리
Insert Into BoardsCategories (BoardId, BoardAlias, CategoryName, CategoryCode) Values (2, 'Free', N'잡담', 'TALK')
Go
Insert Into BoardsCategories (BoardId, BoardAlias, CategoryName, CategoryCode) Values (2, 'Free', N'사진', 'PHOTO')
Go

Select * From BoardsCategories
Go

-- Articles
Create Table Articles
(
    Id Int Identity(1, 1) Primary Key,
    BoardName  NVarChar(50), 
    Name NVarChar(25) Null,
    Title NVarChar(140) Null,
    Category NVarChar(50) Null
)
Go

Insert Into Articles (BoardName, Name, Title, Category) Values ('Notice', N'홍길동', N'공지사항입니다.', 'NOTICE')
Go
Insert Into Articles (BoardName, Name, Title, Category) Values ('Free', N'백두산', N'여행 사진입니다.', 'PHOTO')
Go
Select * From Articles
Go


