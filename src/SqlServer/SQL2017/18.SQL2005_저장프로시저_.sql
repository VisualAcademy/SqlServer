-- ���� ���ν���(Stored Procedure) : SQL Server�������� ���α׷��� ��ü

--[1] ���̺� ����
Create Table dbo.AdminMemos
(
	Num Int Identity(1, 1) Not Null Primary Key,	-- �Ϸù�ȣ
	[Content] Text Not Null							-- ����
)
Go

--[2] �Է� ���ù� : �۾���, ȸ������
Insert AdminMemos Values('���� ���ν��� ����')
Go
--[3] ��� ���ù� : ����Ʈ, ȸ������Ʈ, ��ǰ����Ʈ
Select * From AdminMemos Order By Num Desc
Go
--[4] �� ���ù� : ȸ���󼼺���, �ֹ��󼼳���, �Խù�����
Select Num, Content From AdminMemos Where Num = 1
Go
--[5] ���� ���ù� : ȸ����������, �Խù�����
Begin Tran
	Update AdminMemos
	Set Content = '���� ���ν��� �Ƚ�'
	Where Num = 1
	--RollBack Tran
Commit Tran
--[6] ���� ���ù� : ȸ��Ż��, �Խù�����
Begin Tran
	Delete AdminMemos
	Where Num = 1
	--RollBack Tran
Commit Tran
--[7] �˻� ���ù� : ȸ���˻�, ��ǰ�˻�
Select Num, Content
From AdminMemos
Where [Content] Like '%���ν���%'
Go

--[8] 1���� 100���� ¦���� ������ Content�� '�ȳ�'�� �Է�,
--    Ȧ���� ������ '�氡'�� �Է�
Declare @i Int
Set @i = 1
While @i <= 100
Begin 
	If @i % 2 = 0 
	Begin
		Insert AdminMemos Values('�ȳ�')
	End 
	Else
	Begin
		Insert Into AdminMemos Values('�氡')
	End
	Set @i = @i + 1
End 
Go

--[9] �� ���� : ��ü ���ڵ带 ��ȸ
Create View dbo.GetAdminMemos
As
	Select Num, Content From AdminMemos
Go
Select * From GetAdminMemos Order By Num Desc
Go

--[10] �Է� ���ù� -> ���α׷���ȭ(�Ű�����ȭ) -> �Է� ���� ���ν���
Create Procedure dbo.AddAdminMemo
As
	Insert AdminMemos Values('���� ���ν��� ����')
Go

--[11] ���� ���ν��� ���� : Execute, Exec, �������ν�����
Execute AddAdminMemo
Go
Exec AddAdminMemo
Go
AddAdminMemo
Go

--[12] ���� ���ν��� ����
Alter Procedure dbo.AddAdminMemo
	@Content VarChar(8000)
As
	Insert AdminMemos Values(@Content)
Go

--[13] �Ű������� �ִ� ���� ���ν��� ����
Exec AddAdminMemo '�ȳ�'
Go
Exec AddAdminMemo '�氡' 
Go

--[14] �� SQL���� ª�� �ϳ��� ��ɾ�(�������ν�����)���� ��ȯ
Create Procedure dbo.ListAdminMemos
As
	Select * From AdminMemos Order By Num Desc
Go

--[15] �Ű������� ���� ���� ���ν��� �׽�Ʈ
Exec ListAdminMemos
Go

--[16] �Ѱ��ִ� ���� ���� ��� ����
Create Proc dbo.ViewAdminMemos
	@Num Int
As
	Select Num, Content From AdminMemos Where Num = @Num
Go

--[17] �Ű������� �ִ� ���� ���ν��� ����
Exec ViewAdminMemos 100
Go
Exec ViewAdminMemos 5
Go

--[18] �Ѱ��� �� ��ȣ�� �ش��ϴ� ������ �Ѱ����� ������ ����
Create Proc dbo.ModifyAdminMemos
	@Content VarChar(8000),
	@Num Int
As
	Begin Tran
		Update AdminMemos
		Set Content = @Content
		Where Num = @Num
		--RollBack Tran
	Commit Tran
Go
--[19] �� ���� ���ν��� ���� ����
Exec ModifyAdminMemos '�ݰ����ϴ�.', 100
Go
Exec ViewAdminMemos 100
Go

--[20] ���� ���� ���ν��� ���� 
Create Proc dbo.DeleteAdminMemos
	@Num Int
As
	Begin Tran
		Delete AdminMemos
		Where Num = @Num
		--RollBack Tran
	Commit Tran

	--Select * From AdminMemos Where Num = @Num
Go
--[21] ����
DeleteAdminMemos 100
Go

--[22] �˻� ���� ���ν��� : ���� ���ν������ٴ� ���� �������̶�� �θ�.
Create Proc dbo.SearchAdminMemos
	@Content VarChar(50)
As
	Declare @strSql VarChar(255)
	Set @strSql = '
		Select Num, Content
		From AdminMemos
		Where [Content] Like ''%' + @Content + '%''
	'
	Exec(@strSql) -- �������� ���� SQL���� �����ϴ� ��ɾ�
Go

--[23] �������������� �˻�
SearchAdminMemos '�ȳ�'
Go
SearchAdminMemos '�氡'
Go