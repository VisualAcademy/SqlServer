--[!] �θ� ���̺�� �ڽ� ���̺��� Foreign Key ���� �������� �����Ǿ��� ���� 
--    �θ� ���̺� ������ �ڽ� ���̺��� �����ϰ� ���� �ÿ��� �θ� ���̺��� ���ڵ带 ������ �� ����.

--[0] tempdb���� �����ϱ�
Use tempdb
Go

--[1] ī�װ� ���� ���̺� ����
Create Table Categories
(
	CategoryID Int Identity(1, 1) Primary Key, 
	CategoryName VarChar(25)
)
Go

--[2] ī�װ� ���̺� ���� ������ 2�� ���
Insert Into Categories Values('����ũ��')
Go
Insert Into Categories Values('��Ʈ��')
Go
Insert Into Categories Values('����')
Go

--[3] ��ǰ ���̺� ����
Create Table Products
(
	ProductID Int Identity(1, 1) Primary Key,
	ProductName VarChar(25),
	CategoryID Int Not Null
)

--[4] �⺻������ �ܷ�Ű ���� 
Alter Table dbo.Products
Add Foreign Key(CategoryID) References Categories(CategoryID)
Go

--[5] ���� ��ǰ ������ ���
Insert Into Products Values ('������ǻ��', 1)
Go
Insert Into Products Values ('������Ʈ��', 2)
Go

--[6] ���� 1�� ī�װ��� ����ũ���� �����Ϸ���, ������ǻ�Ͱ� �����ϰ� �����Ƿ� ���� �Ұ� : ���� �߻�
Delete Categories Where CategoryID = 1
Go

--[7] �ܷ�Ű ������ On Delete Cascade �ɼ��� �θ�, �θ�Ű(Primary Key) ������ �����Ǵ� ��� �ڽ� ���̺��� ���ڵ嵵 ���� ����
Alter Table dbo.Products
Add Foreign Key(CategoryID) References Categories(CategoryID) On Delete Cascade
Go

--[8] 1�� ī�װ� ���� �õ� : ������
Delete Categories Where CategoryID = 1
Go

--[9] �� ���� ���� ��� 1�� ī�װ� �� 1�� ī�װ��� �����ϰ� �ִ� Products ���̺��� '������ǻ��' �׸� ���� ������
Select * From Products
Go

--[10] ����, �ڽ� ���̺��� �����ϰ� ���� ���� '����' ���ڵ�� �ٷ� ������ �����ϴ�.
Delete Categories Where CategoryID = 3
Go

