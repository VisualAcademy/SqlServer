--[1] Create��
Create Table dbo.Memos
(
	Num Int Identity(1, 1) Not Null Primary Key, -- ��ȣ
	Name VarChar(25) Not Null, -- �̸�
	Email VarChar(50) Null, -- �̸���
	Title VarChar(150) Not Null, -- ����(���ܸ޸�)
	PostDate DateTime Default(GetDate()), -- �ۼ���
	PostIP VarChar(15) Null -- IP�ּ� 
)
Go
--[2] Drop��
Drop Table dbo.Memos
Go
--[3] �Է�
Insert Memos(Name, Email, Title, PostDate, PostIP) 
Values('ȫ�浿', 'h@h.com', '�ȳ��ϼ���.', GetDate(), '127.0.0.1')
Go
--[4] ���
Select * 
From Memos
Order By Num Desc
Go
--[5] ��
Select Num, Name, Title, PostDate
From Memos
Where Num = 1
Go
--[6] ����
Begin Tran
	Update Memos
	Set Name = '��λ�', Email = 'b@b.com'
	Where Num = 1
Commit Tran
Go
--[7] ����
Delete Memos
Where Num = 1
Go
--[8] �˻�
Select * 
From Memos
Where Name Like '%��%'
Go

--[!] 1���� 100���� 3�� ��� �Ǵ� 4�� ����� ���� ���ϴ� ���α׷��� 
--    T-SQL�� �����Ͻÿ�.
--[1] ���� ����
Declare @sum Int
Declare @i Int
--[2] ���� �ʱ�ȭ
Set @sum = 0
--[3] �ݺ���
Set @i = 1					--[a] �ʱ��
While @i <= 100				--[b] ���ǽ�
Begin
	If (@i % 3 = 0) Or (@i % 4 = 0)	--[!] ���ǽ�
	Begin
		Set @sum = @sum + @i	--[!] ���๮
	End
	Set @i = @i + 1			--[c] ������
End
Select 
	'1���� 100���� 3�� ��� �Ǵ� 4�� ����� �� : ' 
	+ Cast(@sum As VarChar)
Go

--[*] ���� ���ν��� �����
--[1] �Է�
Create Proc dbo.AddMemo
(
	@Name VarChar(25),
	@Email VarChar(50),
	@Title VarChar(150),
	@PostIP VarChar(15)
)
As
	Insert Memos(Name, Email, Title, PostDate, PostIP) 
	Values(@Name, @Email, @Title, GetDate(), @PostIP)
Go
AddMemo '�Ѷ��', 'h@h.net', '�Ѷ���Դϴ�.', '127.0.0.1'
Go
--[2] ���
Create Proc dbo.GetMemos
As
	Select * 
	From Memos
	Order By Num Desc
Go
Exec GetMemos
Go
--[3] ��
Create Proc dbo.GetMemo
	@Num Int
As
	Select Num, Name, Title, PostDate
	From Memos
	Where Num = @Num
Go
Execute GetMemo 6
Go
--[4] ����
Create Proc dbo.EditMemo
(
	@Name VarChar(25),
	@Email VarChar(50),
	@Num Int
)
As
	Begin Tran
		Update Memos
		Set Name = @Name, Email = @Email
		Where Num = @Num
	Commit Tran
Go
Exec EditMemo '������', 'j@j.com', 5
Go
--[5] ����
Create Procedure dbo.DeleteMemo
	@Num Int
With Encryption
As
	Delete Memos
	Where Num = @Num
Go
Exec DeleteMemo 6
Go
--[6] �˻� : ���� ���ν��� -> ���� ������(SQL ������ ��ŷ ����) -> ���� ���ν���
Create Proc dbo.FindMemos
	@SearchField VarChar(50),
	@SearchQuery VarChar(50)
As
	-- Name -> ' + �ش纯�� + '
	Declare @strSql VarChar(255)
	Set @strSql = ' 
		Select * 
		From Memos
		Where ' + @SearchField + ' Like ''%' + @SearchQuery + '%''
		Order By Num Desc
	'
	Exec(@strSql)
Go
Exec FindMemos 'Name', '��'
Go
Exec FindMemos 'Email', 'j'
Go
Exec GetMemos
Go
Exec FindMemos ' 1 = 1; Delete Memos; -- ', 'ȫ�浿'
Go
--[7] �˻� : ���� ������(���� ���ν���)
Create Proc dbo.SearchMemos
	@SearchField VarChar(50),
	@SearchQuery VarChar(50)	
As
	Set @SearchQuery = '%' + @SearchQuery + '%' 
	Select * From Memos
	Where 
	(
		Case @SearchField
			When 'Name' Then Name
			When 'Title' Then Title
		Else
			@SearchQuery
		End
	)
		Like
		@SearchQuery
	Order By Num Desc
Go
Exec SearchMemos 'Name', '�Ѷ��'
Go
-- �Ʒ� ������ ������� �ʴ´�.
Exec SearchMemos ' 1 = 1; Delete Memos; -- ', 'ȫ�浿'
Go
