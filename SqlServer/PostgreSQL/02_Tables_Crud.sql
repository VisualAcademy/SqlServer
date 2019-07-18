-- 데이터베이스 생성
Create Database DatabaseApp;

--[0] 테이블(모델, 엔터티) 생성
Create Table Tables (
    Id      INT Not Null Generated ALWAYS As IDENTITY Primary Key, 
    Note    Text Null
);

--[1] 입력(Create)
INSERT INTO Tables (Note) Values('안녕하세요.');
--[2] 출력(Read, 조회)
Select * From Tables;
--[3] 수정(Update, 갱신)
Update Tables Set Note = '반갑습니다.' Where Id = 1;
--[4] 삭제(Delete)
DELETE FROM Tables Where Id = 1;

--[5] 테이블 삭제
Drop Table Tables;

--[6] 데이터베이스 삭제
Drop Database databaseapp;
