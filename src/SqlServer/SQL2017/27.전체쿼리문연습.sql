-- Create/Alter/Drop/Insert/Select/Update/Delete문 연습
--[1] 테이블 생성
Create Table dbo.Sample
(
	Num Int Identity(1, 1) Primary Key,
	Name VarChar(25),
	Age Int Default 21
)
Go
--[2] 테이블 구조 수정
--Alter Table dbo.Sample
--(
--)
--Go
--[4] 데이터 입력
Insert Into Sample(Name, Age) Values('홍길동', 21)
Insert Into Sample(Name, Age) Values('홍길동', Default)
Insert Sample Values('홍길동', 21)
Insert Sample Select Top 3 Name, Age From Sample
Select * Into NewSample From Sample -- 복사
Select * From NewSample
Insert Sample Output Inserted.* Values('홍길동', 21)
Go
--[5] 데이터 출력
Select * From Sample
Select Num, Name, Age From Sample
Select * From Sample Where Num > 10
Select * From Sample Where Name Like '%홍%'
Select * From Sample Where Num In (2, 4, 6)
Select * From Sample Where (Num % 2 = 0)
Select Avg(Age) From Sample
Go
--[6] 데이터 수정
Begin Tran
	Update Sample
	Set Name = '백두산', Age = 100
	Where Num = 1
--RollBack Tran
Commit Tran
Go
--[7] 데이터 삭제
Delete Sample
Where Name Like '%두%'
Go
--[3] 테이블 구조 삭제
Drop Table dbo.Sample
Go







