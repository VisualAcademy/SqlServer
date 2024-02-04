------------------------------------------------------------------------------------------
--[1] ���������� ����ϱ�
-- '--'(Double-hyphen)�� �ּ������� ó��... /* ~ */ �� �ּ����� ó��
-- SQL ���� ������ �ش� ������ ���� ���� �� F5�̳� �����ư�� ������.
-- �� SQL������ ���ڿ��� �ݵ�� ��������ǥ(')�� ���´�.
-- SQL�� �����ϽǶ��� �׻� SQL 2008 �¶��� ����(����)�� ����Ȱ���Ѵ�. 

--������ ���̺� ����(���������� ���� ��)
CREATE TABLE dbo.Memos
(
	Num Int IDENTITY(1, 1) NOT NULL Primary Key,	-- ��ȣ
	[Name] VarChar(25) Not Null,			-- �̸�
	Email VarChar(50) NULL,				-- �̸���
	Title VarChar(150) NULL,						-- ���ٸ޸�(����)
	PostDate DateTime NULL Default(GetDate())		-- �ۼ���
)
Go 

-- Memos ���̺� ���� �Ӽ��� �����ִ� ��ɾ�
Exec sp_help Memos
Go
Execute sp_help Memos
Go
sp_help Memos
Go

--[2] 1. INSERT(����) ��
--����) Insert TableName(FieldNameList,...) Values(FileldValueList,...)

--[3] Memos�� ������ ����.
Insert Memos(Name, Email, Title, PostDate) 
Values('ȫ�浿','hong@hong.com','�ϴ�',GetDate())
Go
   -- �ο� ���� : �� �������� ��¥�Լ��� GetDate() ��� : ���� �ý����� ��¥ �ð��� ��ȯ.
   -- 2001-08-19 01:07:20.070������ ���.

Select GetDate()   -- ���� �ð��� �˻�. : .NET������ DateTime.Now�� ���� ����
Go
Select Year(GetDate()), Month(GetDate()), Day(GetDate())	-- ������ ��¥(��/��/��)
Go
Select DateDiff(DD, GetDate(), '2010-12-25')   -- 2010�� ũ���������� �󸶳� ���Ҵ��� ���(DD�� �ϼ�)
Go

--(����) ���� ���ݱ��� �� �� ��ƿԴ���? 
Select DateDiff(dd, '1982-02-05', GetDate())
Go

--�˻������ ǥ ���·� ���� ������ [�޴�]-[����]-[ǥ ���·� ��� ǥ��(Ctrl+D)]�� �����Ѵ�.

Insert Memos(Name, Email, Title, PostDate) 
Values('��λ�','hong@hong.com','��λ�',GetDate())
Go

Insert Into Memos(Name, Email, Title, PostDate) 
Values('�Ѷ��','hong@hong.com','�ϴ�',GetDate())
Go

Insert Memos(Email, Name, PostDate, Title)
Values('nimda@nimda.com', '�Ӳ���', GetDate(), '�� ����')
Go

--�ش� �ʵ��̸��� ���������ϴ�. ��, �ʵ��̸� ������� �����͸� �����ؾ��Ѵ�.
Insert Memos Values('�ڿ���','redplus@redplus.net','����',GetDate())
Go

--[4] Title ������ '(��������ǥ) ����
-- ��������ǥ �ΰ��� �������� �ٿ����� SQL������ '(��������ǥ) �ν��Ѵ�.
Insert Memos(Name, Email, Title, PostDate) 
Values('ȫ�浿','hong@hong.com','��''��',GetDate())
--Select * From Memos
Select '��''��'   -- ��'�� ���
Select '��'''   -- ��' ���

--[5] Memos���̺� 1000���� ���ڵ� ���(����:Declare����~End���� ������Ѿ� ��.)
--Declare : ���� ����
--Set : �� �Ҵ�
DECLARE @i Int		--��������	
SET @i = 1		--���� �� �Ҵ�
WHILE @i <= 200
BEGIN
	Insert Memos(Name, Email, Title, PostDate) Values('��λ�','hong@hong.com','��ϴ�',GetDate())
	Insert Memos(Name, Email, Title, PostDate) Values('�Ѷ��','hong@hong.com','���ֵ�',GetDate())
	Insert Memos(Name, Email, Title, PostDate) Values('������','hong@hong.com','������',GetDate())
	Insert Memos(Name, Email, Title, PostDate) Values('����','hong@hong.com','����',GetDate())
	Insert Memos(Name, Email, Title, PostDate) Values('ȫ�浿','hong@hong.com','ȫ���',GetDate())
	SET @i = @i + 1
END
GO


Select Count(*) From Memos;

Select * 
From Memos
Order By Num Desc
OffSet 5 Rows Fetch Next 3 Rows Only;

