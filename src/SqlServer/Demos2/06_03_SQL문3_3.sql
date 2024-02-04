--[6] 5. Create��(DB �� Table����)
--Memos�� ������ ������ ������ Memos2��� ���̺��� MyDatabase�ȿ� ����
Use MyDatabase  --���� ������ create database MyDatabase
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

--[7] ���̺� ���� �ý��� ���ν��� 
   -- sp_help : Ư���� ��ü�� ���� ������ ��ȯ.
   sp_help Memos2
   -- sp_tables : Ư���� ���̺� ���� ������ ������.
   sp_tables Memos2
   -- sp_columns : Ư���� ���̺� �����ϴ� �÷����� ������ ������.
   sp_columns Memos2

--[8] Memos2 ���̺� ������ ����, �˻�, ����, ����.
   Insert Memos2(Name, Email, Title, PostDate) Values('ȫ�浿','hong@hong.com','�ϴ�',getdate())
   -- Memos2���̺��� ��� �ʵ� �˻�.
   Select Num, Name, Email, Title, PostDate From Memos2
   -- Memos2���̺��� ȫ�浿�� ����� Email�� 'hong@redplus.net'���� ����.
   Update Memos2 Set Email = 'hong@redplus.net' Where Name = 'ȫ�浿'
   -- Memos2 ���̺��� ��� �ڷ� ����.
   Delete Memos2

--[9] 6. Drop��(DB �� Table ����)
--Memos2 ���̺� ����
DROP TABLE Memos2

--[10] 7. Alter��(���̺� ����)
--a. �� �߰��ϱ�
Alter Table Memos2
Add homepage VarChar(100) Null

EXEC sp_help Memos2

--b. �� �����ϱ�
Alter Table Memos2
Alter Column homepage VarChar(120) Null

--c. �� �����ϱ�
Alter Table Memos2
Drop Column homepage

--[11] 8. �ӽ����̺�
--�ӽ����̺� ����� : Drop���̺�� ���� �ʿ䰡 ����!
--���̺��鶧 #�� �̸� �տ� ���δ�.
-- #<TableName> : ���� �ӽ� ���̺�
-- ##<TableName> : ���� �ӽ� ���̺�

--[A] ���� �ӽ� ���̺� ���� �� �����
CREATE TABLE #LocalTable
(
	Column1 VarChar(20)
)
Go

INSERT #LocalTable VALUES('�׽�Ʈ')

SELECT * FROM #LocalTable

--[B] ���� �ӽ� ���̺� ���� �� �����
CREATE TABLE ##GolbalTable
(
	Column1 VarChar(20)
)
Go

INSERT ##GolbalTable VALUES('�׽�Ʈ')

SELECT * FROM ##GolbalTable
