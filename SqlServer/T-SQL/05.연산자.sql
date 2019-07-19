--[0] ���������
Select 3 + 4
Select 3 - 4
--[1] %������ : ������ �����ڶ�� ��
Select 3 % 4 -- 3 ������ 4�� ���� ���. �� : 0, ������ : 3, �� �� �������� ��ȯ

--[2] ���ڿ� ���Ῥ�� : '+' ������ ���
Select '�ȳ�' + '�ϼ���' --�ȳ��ϼ���

--[3] ��
-- >, >=, <, <=
Select * From Memos Where  3 > 4 -- ������ ����
Go
-- ������(=), �ٸ���(<>)
Select * From Memos Where 3 = 4 -- ������ ����
Go
Select * From Memos Where 3 <> 4 -- ������ ��
Go
-- �ⱳ�� �ڵ�(?) : ������ ���� : SQL ������(��ŷ)
Select * From Memos Where 1 = 1
Go

--[4] ��
-- Or(||) : �ϳ��� ���̸�, ��
Select * From Memos Where (3 = 4) Or (3 <> 4) -- ���� Or �� -> ��
Go
-- And(&&) : �� �� ���϶�����, ��
Select * From Memos Where (3 = 4) And (3 <> 4) -- ���� And �� -> ����
Go

--[5] Null �� üũ
--[A] ���̺� ����
Create Table NullTest
(
	Name VarChar(25) Not Null,
	Age Int Null
)
Go
--[B] ������ �Է�
Insert Into NullTest Values('ȫ�浿', 21)
Insert Into NullTest Values('��λ�', NULL)
Insert Into NullTest(Name) Values('�Ӳ���')
--[C] ���� ���
-- ���̰� �ִ� ��� ��� : Is Not Null, <> ���Ұ�
Select * From NullTest Where Age Is Not Null
-- ���̰� ��ϵ��� ���� ������ ���, = ���Ұ�
Select * From NullTest Where Age Is Null
