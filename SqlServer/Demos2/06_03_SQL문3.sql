--[1] 3. Update(수정)문 
--정의) Update 테이블명 Set 필드명 = 값 [Where 조건]
--※ Update문이나 Delete문에서 조건을 생략하면... 전체 레코드에 영향을 미친다.

--연습용 데이터베이스 생성
--use master
--create database my_database
--use my_database

--[!] 전체 데이터 출력
Select * From Memos Order By Num Desc
Go

--[!] 데이터 수정(갱신) : Update
--Update
--Set
--Where
--Go

--[2] Name이 홍길동인 사람의 Email을 'hong@redplus.net'으로 변경.
Update Memos 
Set 
	Email = 'hong@redplus.net' 
Where 
	Name = '홍길동'
Go

Select * From Memos
Go

-- Name이 '동'으로 끝나는 레코드의 Name='한라산', Email='h@h.net'
Update Memos
Set Name='한라산', Email='h@h.net', Title='안녕하세요.'
Where Name Like '%동'
Go

-- Where절이 없는 Update문은 사용하지마시오.
Update Memos
Set Name='홍길동'
--Where Name = '한라산'
Go

--퀴즈) Name에 '두'자가 들어가는 사람의 Name을 '천두산'으로 변경.
Update Memos Set Name = '천두산' Where Name Like '%두%' 
Go

--[3] 트랜잭션과 함께...
Begin Tran
	Update Memos Set Name = '천두산' Where Name Like '%두%'
	-- Rollback Tran
Commit Tran
Go

--[4] 4. Delete(삭제)문 : 레코드 단위로 삭제...
--정의) Delete TableName [Where 조건]

--Delete
--Where

--[5] Memos에서 이름이 '천두산'인 사람의 모든 것 삭제.
Delete Memos 
Where Name = '천두산'
Go

Select * From Memos Where Name = '천두산'
Go

--퀴즈) Email에 'h'자가 들어가는 사람의 모든 것 삭제.
Delete Memos Where Email Like '%h%'
Go

--[6] Memos의 모든 자료 삭제.
Delete Memos
Go

Select * from Memos
Go

-- 테이블 삭제
Drop Table dbo.Memos
Go

