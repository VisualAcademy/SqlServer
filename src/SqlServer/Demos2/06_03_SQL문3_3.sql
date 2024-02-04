--[6] 5. Create문(DB 및 Table생성)
--Memos와 동일한 구조를 가지는 Memos2라는 테이블을 MyDatabase안에 생성
Use MyDatabase  --만약 없으면 create database MyDatabase
Go

CREATE TABLE dbo.Memos2
(
	Num int IDENTITY(1, 1) NOT NULL Primary Key,
	Name VarChar(25) NULL ,
	Email VarChar(100) NULL ,
	Title VarChar(150) NULL ,
	PostDate datetime NULL default getdate()
) 
Go
--Drop Table Memos2

--[7] 테이블 관련 시스템 프로시저 
   -- sp_help : 특정한 객체에 대한 정보값 반환.
   sp_help Memos2
   -- sp_tables : 특정한 테이블에 대한 정보를 보여줌.
   sp_tables Memos2
   -- sp_columns : 특정한 테이블에 존재하는 컬럼들의 정보를 보여줌.
   sp_columns Memos2

--[8] Memos2 테이블에 데이터 삽입, 검색, 수정, 삭제.
   Insert Memos2(Name, Email, Title, PostDate) Values('홍길동','hong@hong.com','하늘',getdate())
   -- Memos2테이블의 모든 필드 검색.
   Select Num, Name, Email, Title, PostDate From Memos2
   -- Memos2테이블에서 홍길동인 사람의 Email을 'hong@redplus.net'으로 변경.
   Update Memos2 Set Email = 'hong@redplus.net' Where Name = '홍길동'
   -- Memos2 테이블의 모든 자료 삭제.
   Delete Memos2

--[9] 6. Drop문(DB 및 Table 삭제)
--Memos2 테이블 삭제
DROP TABLE Memos2

--[10] 7. Alter문(테이블 수정)
--a. 열 추가하기
Alter Table Memos2
Add homepage VarChar(100) Null

EXEC sp_help Memos2

--b. 열 수정하기
Alter Table Memos2
Alter Column homepage VarChar(120) Null

--c. 열 삭제하기
Alter Table Memos2
Drop Column homepage

--[11] 8. 임시테이블
--임시테이블 만들기 : Drop테이블로 지울 필요가 없다!
--테이블만들때 #을 이름 앞에 붙인다.
-- #<TableName> : 지역 임시 테이블
-- ##<TableName> : 전역 임시 테이블

--[A] 지역 임시 테이블 생성 및 입출력
CREATE TABLE #LocalTable
(
	Column1 VarChar(20)
)
Go

INSERT #LocalTable VALUES('테스트')

SELECT * FROM #LocalTable

--[B] 전역 임시 테이블 생성 및 입출력
CREATE TABLE ##GolbalTable
(
	Column1 VarChar(20)
)
Go

INSERT ##GolbalTable VALUES('테스트')

SELECT * FROM ##GolbalTable
