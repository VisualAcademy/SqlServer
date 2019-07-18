--[1] ī�װ�
--Truncate Table dbo.Categories
CREATE TABLE dbo.Categories
(
    CategoryID Int IDENTITY(1, 1) NOT NULL Primary Key, --ī�װ���ȣ
    CategoryName VarChar(50),                           --ī�װ���
    --
    SuperCategory Int Null,               --�θ�ī�װ���ȣ(Ȯ���)
    Align SmallInt Default(0)             --ī�װ��������¼���(Ȯ���)
)
GO
--[2] �Է� ���ù�
Insert Categories Values('��ǻ��', NULL, 0)
Go
Insert Categories Values('��Ʈ��', 1, 0)
Go
Insert Categories Values('����ũ��', 1, 1)
Go
Insert Categories Values('����', NULL, 1)
Go
Insert Categories Values('ASP.NET', 4, 0)
Go
Insert Categories Values('C#', 4, 1)
Select @@Identity -- �������� ���Ե� �������� Identity��
Go
--[3] ��� : �ֻ��� ī�װ��� ���
Select CategoryID, CategoryName 
From Categories
Where SuperCategory Is Null
Order by Align Asc
Go
--[4] �� : 1�� ī�װ��� ���� ī�װ� ���
Select * From Categories Where SuperCategory = 1
Go
--[5] ���� : ī�װ��� ����
Begin Tran
	Update Categories
	Set CategoryName = '��ǻ��'
	Where CategoryID = 1
	--���� �������� ������ �߻��ϸ� �ǵ�����.
	If @@Error > 0		-- ���� ������ ��ȯ
	Begin
		RollBack Tran
	End
Commit Tran
GO
--[6] ����
Begin Tran
	Delete Categories 
	Where CategoryID = 3

	Select @@RowCount -- ������ �������� ���� : 1

	If @@Error > 0
	Begin 
		RollBack Tran
	End
Commit Tran
--[7] �˻�
Select CategoryID, CategoryName
From Categories
Where CategoryName Like '%��ǻ%'
Go
--[8] �Է� ���� ���ν��� : Add���̺��, Write���̺��
Create Proc dbo.AddCategory
(
	@CategoryName VarChar(50),
	@SuperCategory Int,
	@Align Int
)
As
	Insert Categories Values(@CategoryName, @SuperCategory, @Align)
	Select @@Identity -- �������� ���Ե� �������� Identity��
Go
Exec AddCategory 'SQL', 4, 2
Go
--[9] ��� ���� ���ν��� : Get���̺��, List���̺��
Create Proc dbo.GetCategories
With Encryption -- ���� ���ν��� ���� ��ȣȭ
As
	Select CategoryID, CategoryName 
	From Categories
	Where SuperCategory Is Null
	Order by Align Asc
Go
Execute GetCategories
Go
--[10] �� ���� ���ν��� : Get���̺��, View���̺��
Create Proc dbo.GetCategory
	@SuperCategory Int
As
	Select * From Categories Where SuperCategory = @SuperCategory
Go
Execute GetCategory 1
GO
Exec GetCategory 4
Go
--[11] ���� ���� ���ν��� : Edit���̺��, Modify���̺��
Create Procedure dbo.EditCategories
(
	@CategoryID Int,
	@CategoryName VarChar(50),
	@Align Int
)
As
	Begin Tran
		Update Categories
		Set CategoryName = @CategoryName, Align = @Align
		Where CategoryID = @CategoryID
		--���� �������� ������ �߻��ϸ� �ǵ�����.
		If @@Error > 0		-- ���� ������ ��ȯ
		Begin
			RollBack Tran
		End
	Commit Tran
Go
Exec EditCategories 1, '��ǻŸ', 2
Go
--[12] ���� ���� ���ν��� : Delete���̺��
Create Proc dbo.DeleteCategory
	@CategoryID Int
As
	Begin Tran
		Delete Categories 
		Where CategoryID = @CategoryID

		Select @@RowCount -- ������ �������� ���� : 1

		If @@Error > 0
		Begin 
			RollBack Tran
		End
	Commit Tran
Go
Exec DeleteCategory 7
Go
--[13] �˻� ���� ���ν���(����������) : Search���̺��, Find���̺�� 
Create Proc dbo.FindCategory
	@CategoryName VarChar(50)
As
	Declare @strSql VarChar(255)
	Set @strSql = '
		Select CategoryID, CategoryName 
		From Categories 
		Where CategoryName Like ''%' + @CategoryName + '%''
	'
	-- Print @strSql
	Exec(@strSql)
Go
--Declare @strSql VarChar(255)
--Set @strSql = 'Select * From Categories'
--Exec(@strSql)
Execute FindCategory 'ASP.NET'
Go