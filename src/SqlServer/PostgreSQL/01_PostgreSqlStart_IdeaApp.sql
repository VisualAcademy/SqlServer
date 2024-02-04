-- 데이터베이스 생성
Create Database IdeaApp;

-- 테이블 생성
Create Table Ideas (
    Id Int Not Null Generated Always As IDENTITY Primary Key,
    Note Text Not Null
);

-- 데이터 입력
Insert Into Ideas (Note) Values('PostgreSQL');
Insert Into Ideas (Note) Values('SQL Server');

-- 데이터 출력
Select * From Ideas;

-- 데이터 수정
Update Ideas Set Note = 'Azure SQL Database' Where Id = 2;

-- 데이터 삭제
DELETE FROM Ideas Where Id = 1;

-- 테이블 삭제
Drop Table Ideas;

-- 데이터베이스 삭제
Drop Database IdeaApp;
