--Use tempdb
--Go

--[!] Tables 테이블 생성
Create Table Tables
(
	Id		Int				Identity(1, 1)	Primary Key,
	Note	NVarChar(Max)	Null
)
Go

----[1] 입력(Create)
--Insert Into Tables (Note) Values ('안녕하세요.')
--Go
----[2] 출력(Read, 조회)
--Select * From Tables
--Go
----[3] 수정(Update, 갱신)
--Update Tables Set Note = '반갑습니다.' Where Id = 1
--Go
----[4] 삭제(Delete)
--Delete Tables Where Id = 1
--Go
