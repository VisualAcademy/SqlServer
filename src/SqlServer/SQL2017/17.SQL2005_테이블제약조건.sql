--[0] tempdb ���
USE tempdb
GO

--[1] �ǽ��� ���̺� ���� : ���� ��������(����) �Խ���
-- �۹�ȣ, ����, ��ũ, Ÿ��, �ۼ���
CREATE TABLE dbo.FrontBoard
(
    ItemID Int
		IDENTITY(1, 1)		--[1] �ڵ����� : 1���� 1�� ���� 
		NOT NULL			--[2] �ΰ����� : NOT NULL(�ݵ�� �Է�)
		PRIMARY KEY,		--[3] �⺻Ű(����) : ���ڵ� ���� �ʵ�
    Title VarChar(150)
		NOT NULL
		Unique,				--[4] ����Ű : ���̺��� ������ ��  						
    Url VarChar(255) 
		NULL,				--[2] �ΰ����� : NULL(�� ���) 
    Target VarChar(10)		 
		NULL 
		CHECK				--[5] üũ���� : �־��� �����͸� �Է� ���
		(
			Target IN('_top','_blank','_parent','_self')
		),
    CreatedDate DateTime 
		DEFAULT(GETDATE())	--[6] �⺻�� : ���ڵ� ������ �⺻�� �ο�
)
GO

--[2] �ڵ����� �׽�Ʈ
Insert FrontBoard
Values('����1', 'http://www.hawaso.com/', '_blank', GetDate())
Go
Insert FrontBoard
Values('����2', 'http://www.dotnetkorea.com/', '_blank', GetDate())
Go
Select * From FrontBoard Order By ItemID Desc
Go

--[3] �ΰ� üũ
Insert FrontBoard(Title, Url, Target, CreatedDate) 
Values('����3', 'http://www.live.com/', '_blank', GetDate())
Go
Insert FrontBoard(Url, Target, CreatedDate) 
Values('http://www.live.com/', '_blank', GetDate())
Go --�����߻�

--[4] ����Ű ���� ����
Insert FrontBoard(Title, Url, Target, CreatedDate)
Values('����1', 'http://www.microsoft.com/', '_blank', GetDate())
Go --�����߻�

--[5] üũ ���� ����
Insert FrontBoard(Title, Url, Target, CreatedDate)
Values('����4', NULL, NULL, GetDate())
Go --�������
Insert FrontBoard(Title, Url, Target, CreatedDate)
Values('����5', NULL, 'test', GetDate())
Go --�����߻�

--[6] �⺻(Default) ���� ����
Insert FrontBoard(Title)
Values('����5')
Go
Select * From FrontBoard
Go
Create Table DefaultTest(PostDate DateTime Default(GetDate())) 
Go
Insert DefaultTest Default Values
Go












