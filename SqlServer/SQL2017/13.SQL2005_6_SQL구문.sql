--[1] ���̺� ���� : ���� �޸��� ���� ���α׷�
Create Table Memos
(
	Num Int Identity(1, 1) Not Null Primary Key,	-- ��ȣ 
	Name VarChar(25) Not Null,						-- �̸�
	Email VarChar(50) Null,							-- �ۼ���
	Title VarChar(150) Not Null,					-- �޸�
	PostDate DateTime Default(GetDate()),			-- �ۼ���
	PostIP VarChar(15) Null							-- IP�ּ�
)
Go
--[2] ���̺� ���� ���� : EM/MS
Alter Table Memos
(
	-- ��Ʊ⶧����...	
)
Go
--[3] ���̺� ���� ����
Drop Table Memos
Go
--[4] ���̺� ������ �Է� : Insert��
Insert Memos(Name, Email, Title, PostDate, PostIP) 
Values('ȫ�浿', 'h@h.com', '�ȳ�.', GetDate(), '127.0.0.1')
Go
--[5] ���̺��� ������ ���/��ȸ : Select��
Select * From Memos
Go
Select Num, Name, Email, Title, PostDate, PostIP 
From Memos
Order By Num Desc -- ��ȣ �ʵ�(��)�� �������� ���
Go
--[6] ���̺��� �����͸� ���� : Update��
Update Memos
Set 
	Name = '��λ�',
	Email = 'b@b.com'
Where
	Name = 'ȫ�浿'
Go
--[7] ���̺��� �����͸� ���� : Delete��
Delete Memos
Where Name = '��λ�'
Go


 


















