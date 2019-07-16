
--[!] ���� ������ ���� ���̺� ����
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

--[2] ������ �Է�
Insert Into People(Num, Name) Values(1, 'ȫ�浿');
Insert Into People(Num, Name) Values(2, '��λ�');
Insert Into People(Num, Name) Values(3, '�Ӳ���');
Insert Into People(Num, Name) Values(4, '�Ѷ��');
Insert Into People(Num, Name) Values(5, '������');

Insert Into Computer(Num, Model) Values(3, 'M17x');
Insert Into Computer(Num, Model) Values(4, 'M6600');

--[3] ��ȸ

--[3][1] Inner Join : �� ���̺��� ������
--[3][1][1] ANSI SQL
Select People.Num, People.Name, Computer.Model
From People Join Computer On People.Num = Computer.Num;
--[3][1][2] T-SQL
Select People.Num, People.Name, Computer.Model
From People, Computer 
Where People.Num = Computer.Num;

--[3][2] Left Outer Join / Left Join : ���� ���̺��� ��� ������ ����
--[3][2][1] ANSI SQL
Select People.Num, People.Name, Computer.Model
From People Left Outer Join Computer On People.Num = Computer.Num;

--[3][3] Right Outer Join / Right Join : ������ ���̺��� ��� ������ ����
--[3][3][1] ANSI SQL
Select People.Num, People.Name, Computer.Model
From People Right Outer Join Computer On People.Num = Computer.Num;

--[3][4] Full Outer Join : ��ü����
--[3][4][1] ANSI SQL
Select People.Num, People.Name, Computer.Model
From People Full Outer Join Computer On People.Num = Computer.Num;

