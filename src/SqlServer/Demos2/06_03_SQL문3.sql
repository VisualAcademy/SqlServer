--[1] 3. Update(����)�� 
--����) Update ���̺�� Set �ʵ�� = �� [Where ����]
--�� Update���̳� Delete������ ������ �����ϸ�... ��ü ���ڵ忡 ������ ��ģ��.

--������ �����ͺ��̽� ����
--use master
--create database my_database
--use my_database

--[!] ��ü ������ ���
Select * From Memos Order By Num Desc
Go

--[!] ������ ����(����) : Update
--Update
--Set
--Where
--Go

--[2] Name�� ȫ�浿�� ����� Email�� 'hong@redplus.net'���� ����.
Update Memos 
Set 
	Email = 'hong@redplus.net' 
Where 
	Name = 'ȫ�浿'
Go

Select * From Memos
Go

-- Name�� '��'���� ������ ���ڵ��� Name='�Ѷ��', Email='h@h.net'
Update Memos
Set Name='�Ѷ��', Email='h@h.net', Title='�ȳ��ϼ���.'
Where Name Like '%��'
Go

-- Where���� ���� Update���� ����������ÿ�.
Update Memos
Set Name='ȫ�浿'
--Where Name = '�Ѷ��'
Go

--����) Name�� '��'�ڰ� ���� ����� Name�� 'õ�λ�'���� ����.
Update Memos Set Name = 'õ�λ�' Where Name Like '%��%' 
Go

--[3] Ʈ����ǰ� �Բ�...
Begin Tran
	Update Memos Set Name = 'õ�λ�' Where Name Like '%��%'
	-- Rollback Tran
Commit Tran
Go

--[4] 4. Delete(����)�� : ���ڵ� ������ ����...
--����) Delete TableName [Where ����]

--Delete
--Where

--[5] Memos���� �̸��� 'õ�λ�'�� ����� ��� �� ����.
Delete Memos 
Where Name = 'õ�λ�'
Go

Select * From Memos Where Name = 'õ�λ�'
Go

--����) Email�� 'h'�ڰ� ���� ����� ��� �� ����.
Delete Memos Where Email Like '%h%'
Go

--[6] Memos�� ��� �ڷ� ����.
Delete Memos
Go

Select * from Memos
Go

-- ���̺� ����
Drop Table dbo.Memos
Go

