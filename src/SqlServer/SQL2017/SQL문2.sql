--[1] 2. SELECT(�˻�) ��
--����) Select FieldNameList From TableName [Where ����] [Order By ���Ľ�ų�ʵ�� [ASC | DESC]]

--[2] �ý��� ������ ������(�ý��� �Լ� ���)
-- ���� ������ �̸��� �˻�
Select @@servername
Go
-- ���� ������ ������ �˻�
Select @@version
Go

--[3] Memos�� ��� �ʵ� �˻�.
Select Num, Name, Email, Title, PostDate From Memos
Go
-- Memos�� ��� �ʵ� �˻�('*' ���ϵ幮�� ��� : ��� ��).
Select * From Memos
Go

--����) �ð��� �ֱ� : WAITFOR(���� ��� ����)
BEGIN
	SELECT * FROM Memos
	WAITFOR DELAY '000:00:05'
END

--[4] Memos���� Name�ʵ�� PostDate�ʵ常 �˻�
Select [Name], PostDate From Memos
Go

--[5] ���ǰ˻� : Name�� ȫ�浿�� ����� ��� �� �˻�.
Select * From Memos Where Name = 'ȫ�浿'
Go

-- ���ǰ˻� : Name�� ȫ�浿�� �ƴ� ����� Num, Email�� �˻�.
Select Num, Email From Memos Where Name <> 'ȫ�浿'
Go

--[6] ���˰˻� : Name�� 'ȫ'���� �����ϴ� ����� ��� �� �˻�.
--      '%' ���ϵ� ���� ���. % -> ����... / Like Ű���� ���.
Select * From Memos Where Name Like 'ȫ%'
Go  

-- ���˰˻� : Name�� '��'�ڰ� ���� ����� ��� �� �˻�.
Select * From Memos Where Name Like '%��%'
Go

-- ���˰˻� : Name�� '��'�ڷ� ������ ����� ��� �� �˻�.
Select * From Memos Where Name Like '%��' 
Go

--����) �̸��� '��'�ڷ� ������ ����� Name�� Email�� �˻�.
Select Name, Email From Memos Where Name Like '%��'
Go

--[7] ���˰˻� : Memos���̺��� Name�� 'ȫ'�ڷ� �����ϰ�, 
--[�׸��� | �Ǵ�], Email�� 'h'�ڰ� ���� ����� ��� �� �˻�.
-- AND ������ ���. : �� �� ���� ����
Select * From Memos Where Name Like 'ȫ%' AND Email Like '%h%'
Go

-- OR ������ ���.  : �� �� �ϳ��� ���� ����
Select * From Memos Where Name Like 'ȫ%' OR Email Like '%h%'
Go

--[8] ���İ˻� : Num�� ����(��������)���� ����.
--	�������� ����(ASCending) = 1,2,3 �������...(�⺻��)
--	�������� ����(DESCending) = 3,2,1 �������...
Select * From Memos Order By Num DESC
Go
-- ���İ˻� : Name �ʵ带 ������������ ����.
Select * From Memos Order By Name ASC -- ASC�� ��������.
Go
-- ���� ���� �˻� : Name �ʵ��� ����, �̸����� ����
Select *
From Memos
--Where
Order By 
	Name Desc, Email Asc
Go

--����) Name�� '��'�ڰ� ���� ����� Name�� Email�� Num�� �������� �˻��ض�.
Select Name, Email From Memos Where Name Like '%��%' Order By Num DESC
Go

--[9] ���� 5�� ���ڵ常 �˻�.(Top N)
Select Top 5 * From Memos Order By Num DESC
Go

--[10] �ش� ���̺��� ��ü ���ڵ� �� ��ȯ
Select Count(*) From Memos
Go

Select Count(Num) From Memos
Go

-- �������� ��Ī�� �־ ��� As ���� ���
Select Count(*) As [��ü���ڵ��] From Memos
Go

--����) Memos ���̺� �ִ� ���� 5�� �ڷḦ XML�� ���
Select Top 5 * From Memos FOR XML AUTO
Go

--����) ������ ������ ���ڿ� ���� ��½����ִ� �Լ�
Select NewId() -- GUID
Go