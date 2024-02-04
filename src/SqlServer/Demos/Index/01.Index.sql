Use tempdb
Go
--[0] �׽�Ʈ�� �ӽ����̺� �ۼ�
--Drop Table FrontBoard1
CREATE TABLE dbo.FrontBoard1  -- ������Ʈ ������ ��� ������ ���̺�
(
	ItemID Int IDENTITY(1,1),--PRIMARY KEY �� NOT NULL -- ��Ŭ�����͵� �ε���
	Title varchar(150) NULL,	-- Ŭ�����͵� �ε���
	Url varchar(50) NULL,
	Target varchar(10) NULL,
	CreatedDate datetime default(getdate())
)
Go
CREATE TABLE dbo.FrontBoard2  -- ������Ʈ ������ ��� ������ ���̺�
(
	ItemID Int IDENTITY(1,1),--PRIMARY KEY �� NOT NULL
	Title varchar(150) NULL,
	Url varchar(50) NULL,
	Target varchar(10) NULL,
	CreatedDate datetime default(getdate())
)
Go
--[!] ����ӵ� ��
Select * From FrontBoard1 Where Title Like '����%'
Select * From FrontBoard2 Where Title Like '����%'
--[!] ������ �Է�
Declare @i Int
Set @i = 1
While @i <= 100000
Begin
	Insert FrontBoard1 Values('����' + Cast(@i As VarChar), 'URL', 'Target', GetDate())
	Insert FrontBoard2 Values('����' + Cast(@i As VarChar), 'URL', 'Target', GetDate())
	Set @i = @i + 1
End
Go
--[1] FrontBoard�� ItemID�ʵ忡 idxFrontBoard�� ��Ŭ������ �ε��� ����
CREATE INDEX idxFrontBoard
ON FrontBoard1(ItemID)
Go
--[2] sp_helpindex �ý��� ���� ���ν����� �̿��ؼ� �ε��� ���� Ȯ��
EXEC sp_helpindex FrontBoard
Go
--[3] �ε��� �����
DROP INDEX FrontBoard1.idxFrontBoard
Go
--[4] Title�ʵ忡 ����ũ�� Ŭ������ �ε��� ����
CREATE UNIQUE CLUSTERED INDEX idxFrontBoard1
ON FrontBoard1(Title)
go
--[5] sp_helpindex �ý��� ���� ���ν����� �̿��ؼ� �ε��� ���� Ȯ��
EXEC sp_helpindex FrontBoard1
--[6] �ε��� �����
DROP INDEX FrontBoard.idxFrontBoard  --�ε��� �����
go
