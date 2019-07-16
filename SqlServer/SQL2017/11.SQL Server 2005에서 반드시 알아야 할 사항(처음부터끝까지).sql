Create Table dbo.Memos
(
	Num Int 
		Identity(1, 1)
		Not Null
		Primary Key,
	[Name] VarChar(25)
		Not Null,
	Email VarChar(50)
		Null,
	Title VarChar(150)
		Not Null,
	PostDate DateTime
		Default(GetDate()),
	PostIP VarChar(15) 
		Null
)
Go

Insert Memos(Name, Email, Title, PostDate, PostIP)
Values('ȫ�浿', 'h@h.com', 'ȫ�浿�Դϴ�.', GetDate(), '127.0.0.1')
Go

Select * From Memos Order By Num Desc
Go

Declare @i Int
Set @i = 1
While @i <= 1000
Begin
	Insert Memos(Name, Email, Title, PostDate, PostIP)
	Values('ȫ�浿', 'h@h.com', 'ȫ�浿�Դϴ�.', GetDate(), '127.0.0.1')

	Set @i = @i + 1
End
Go

Create Proc AddMemo
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

Exec AddMemo '��λ�', 'b@b.com', '�ȳ��ϼ���.', '127.0.0.1'
Go

















