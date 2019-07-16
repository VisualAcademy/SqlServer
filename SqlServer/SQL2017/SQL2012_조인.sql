
--[!] 조인 연습을 위한 테이블 생성
Create Table People
(
	Num		Int Primary Key,
	Name	VarChar(10)
)
Go

Create Table Computer
(
	Num		Int Primary Key,
	Model	VarChar(10)
)
Go

--[2] 데이터 입력
Insert Into People(Num, Name) Values(1, '홍길동');
Insert Into People(Num, Name) Values(2, '백두산');
Insert Into People(Num, Name) Values(3, '임꺽정');
Insert Into People(Num, Name) Values(4, '한라산');
Insert Into People(Num, Name) Values(5, '지리산');

Insert Into Computer(Num, Model) Values(3, 'M17x');
Insert Into Computer(Num, Model) Values(4, 'M6600');

--[3] 조회

--[3][1] Inner Join : 두 테이블의 교집합
--[3][1][1] ANSI SQL
Select People.Num, People.Name, Computer.Model
From People Join Computer On People.Num = Computer.Num;
--[3][1][2] T-SQL
Select People.Num, People.Name, Computer.Model
From People, Computer 
Where People.Num = Computer.Num;

--[3][2] Left Outer Join / Left Join : 왼쪽 테이블의 모든 데이터 포함
--[3][2][1] ANSI SQL
Select People.Num, People.Name, Computer.Model
From People Left Outer Join Computer On People.Num = Computer.Num;

--[3][3] Right Outer Join / Right Join : 오른쪽 테이블의 모든 데이터 포함
--[3][3][1] ANSI SQL
Select People.Num, People.Name, Computer.Model
From People Right Outer Join Computer On People.Num = Computer.Num;

--[3][4] Full Outer Join : 전체집합
--[3][4][1] ANSI SQL
Select People.Num, People.Name, Computer.Model
From People Full Outer Join Computer On People.Num = Computer.Num;

