--[1] 테이블 생성 : 한줄 메모장 응용 프로그램
Create Table Memos
(
	Num Int Identity(1, 1) Not Null Primary Key,	-- 번호 
	Name VarChar(25) Not Null,						-- 이름
	Email VarChar(50) Null,							-- 작성자
	Title VarChar(150) Not Null,					-- 메모
	PostDate DateTime Default(GetDate()),			-- 작성일
	PostIP VarChar(15) Null							-- IP주소
)
Go
--[2] 테이블 구조 변경 : EM/MS
Alter Table Memos
(
	-- 어렵기때문에...	
)
Go
--[3] 테이블 구조 삭제
Drop Table Memos
Go
--[4] 테이블에 데이터 입력 : Insert문
Insert Memos(Name, Email, Title, PostDate, PostIP) 
Values('홍길동', 'h@h.com', '안녕.', GetDate(), '127.0.0.1')
Go
--[5] 테이블에서 데이터 출력/조회 : Select문
Select * From Memos
Go
Select Num, Name, Email, Title, PostDate, PostIP 
From Memos
Order By Num Desc -- 번호 필드(열)에 역순으로 출력
Go
--[6] 테이블의 데이터를 수정 : Update문
Update Memos
Set 
	Name = '백두산',
	Email = 'b@b.com'
Where
	Name = '홍길동'
Go
--[7] 테이블의 데이터를 삭제 : Delete문
Delete Memos
Where Name = '백두산'
Go


 


















