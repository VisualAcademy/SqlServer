--[0] ������ ���̺� ����
use tempdb
go

Create Table Memos
(
	Num Int Identity(1,1) Primary Key Not Null,
	[Name] VarChar(10) Null,
	Email VarChar(50) Null,
	Title VarChar(200) Null,
	PostDate DateTime Default(GetDate())
)
Go

-- ���� ������ �Է�
Insert Memos values('ȫ�浿','hong@kil.dong','ȫ�浿�Դϴ�.',GetDate())
Go

-- ���� ���� : ���𿡼����� ��±��� ������� ����(F5)
--[1]~[4]���� ������� ����
--[1] ������ ���� ����
Declare	@intSu TinyInt
--[2] ������ 10���� �ʱ�ȭ
Set @intSu = 10
--[3] ���� �� ��� 
Set @intSu = @intSu + 5
--[4] ���� �� ���
Select @intSu
Go

--[5]~[8]���� ������� ����
--[5] �������� ���� ����
Declare @Name VarChar(25), @Email VarChar(50), @Title VarChar(150)
--[6] ���� �ʱ�ȭ
Set @Name = ''
Set @Email = ''
Set @Title = ''
--[7] Memos ���̺� �ʵ尪�� ������ ����
Select @Name = Name, @Email = Email, @Title = Title
From Memos
Where Num = 1
--[8] ���� �� ���
Select	@Name, @Email, @Title
Go

-- ����(Variable) : ����������� ������°��� �� ����� ����(F5)

-- ��������
Declare @Num Int
-- �����ʱ�ȭ
Set @Num = 1234
-- ���� ���
Set @Num = @Num * 10
-- ���� ���
Select @Num 

-- ���� ���̺� ���� �� ������ ����ؼ� ������ �Է�
Create Table Products
(
	ModelName VarChar(100) Not Null,
	UnitPrice Int Not Null
) 

Declare @ModelName VarChar(100)
Declare @UnitPrice Int

Set @ModelName = '���� ���� SQL Server'
Set @UnitPrice = 20000

Insert Into Products Values(@ModelName, @UnitPrice)

Select * From Products

-- SQL ������ ������ ��Ƴ���, �������� ����(���� ������)
Declare @sql VarChar(255)
Set @sql = 'Select * From Products'
Exec(@sql)












