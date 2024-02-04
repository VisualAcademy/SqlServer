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


INSERT INTO Tables (Note) Values('안녕하세요.'), ('반갑습니다.'), ('또 만나요.');
SELECT * From Tables;

-- Select 문의 여러 가지 모양
Select * From Tables;
Select Id, Note From Tables; -- Id 컬럼(열), 가로/세로, 행/열, 레코드/필드, 튜플/애트리뷰트
Select Note From Tables;

-- 중복 제거
Select DISTINCT Note From Tables; 

-- 새로운 별칭으로 출력
Select DISTINCT Note As 중복이제거된노트 From Tables; 
Select Id As 일련번호, Note As 노트 From Tables;

-- 현재까지의 데이터 출력
