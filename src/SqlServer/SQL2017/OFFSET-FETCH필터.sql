-- OFFSET-FETCH ����

--[0] ������ ���̺� ����
CREATE TABLE dbo.Memos
(
	Num Int IDENTITY(1, 1) NOT NULL Primary Key,	-- ��ȣ
	[Name] VarChar(25) Not Null,					-- �̸�
	Email VarChar(50) NULL,							-- �̸���
	Title VarChar(150) NULL,						-- ���ٸ޸�(����)
	PostDate DateTime NULL Default(GetDate())		-- �ۼ���
)
Go 

--[0] Memos���̺� 1000���� ���ڵ� ���
DECLARE @i Int		--��������	
SET @i = 1			--���� �� �Ҵ�
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


--[1] ��ü ���ڵ� ��ȸ
Select Count(*) From Memos;
-- Select * From Memos Order By Num Desc;


--[2] OFFSET-FETCH ���͸� ����� ����¡ ó��: SQL Server 2012���� ����
Select * 
From Memos
Order By Num Desc
OffSet 5 Rows Fetch Next 3 Rows Only; -- 5�� �� Skip �� 3�� �� Take

Select * 
From Memos
Order By Num Desc
OffSet 10 Rows Fetch Next 10 Rows Only; -- 10�� �� Skip �� 10�� �� Take

-- �ܼ����� ������ Rows ��ſ� Row ����ص� ��
Select * 
From Memos
Order By Num Desc
--OffSet 1 Rows Fetch Next 1 Rows Only; -- 1�� �� Skip �� 1�� �� Take
OffSet 1 Row Fetch Next 1 Row Only; -- 1�� �� Skip �� 1�� �� Take


-- ����¡ ó�� [���� ���ν���] �Ǵ� [�Լ�]�� Ȯ���ؼ� ���
Select * 
From Memos
Order By Num Desc
OffSet  (2 - 1) * 10 Rows Fetch Next 10 Rows Only;




