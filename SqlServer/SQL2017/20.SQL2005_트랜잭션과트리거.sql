--[1] Ʈ����� ���� ���� ���̺�
Create Table dbo.TranTest
(
	Num Int Identity(1, 1) Not Null Primary Key,
	Name VarChar(25) Not Null,
	PostDate SmallDateTime Default(GetDate())
)
Go
--[2] ���� ������ �Է�
Insert Into TranTest(Name) Values('ȫ�浿')
Go
Insert Into TranTest(Name) Values('�Ѷ��')
Go
Insert Into TranTest(Name) Values('��λ�')
Go
--[3] ���
Select * From TranTest
Go
--[4] Ʈ����� �׽�Ʈ(�ѹ�) : Begin Tran ~ RollBack Tran
--[a] Ʈ����� ����
Begin Tran
--[b] SQL ���� ����
Delete TranTest Where Num = 2
--[c] Ʈ����� �ѹ� : Ʈ����� �������� ���� ������(���� ���...)
RollBack Tran

--[5] Ʈ����� ó�� : Begin Tran ~ Commit Tran
Begin Tran
Delete TranTest Where Num = 2
Commit Tran

--[6] Ʈ����ǿ� ��Ī �ο�
Begin Tran DeleteData
	Delete TranTest Where Num = 3
	Select * From TranTest
RollBack Tran DeleteData

--[7] ���� Ʈ����� ó��
Begin Tran 
	Delete TranTest Where Num = 6
	Begin Tran 
		Delete TranTest Where Num = 7
		Select @@TranCount -- 2��
RollBack Tran -- ��ü Ʈ������� �ǵ�����.
Commit Tran 

Select * From TranTest

--[8] Ʈ����� �ܰ� Ȯ��
Begin Tran 
	Update TranTest Set Name = 'Ʈ�����1' Where Num = 8
	Begin Tran 
	Update TranTest Set Name = 'Ʈ�����2' Where Num = 9
		Select @@TranCount -- 2��
RollBack Tran -- ��ü Ʈ������� �ǵ�����.
Commit Tran 

--[9] Ʈ������� �ֿ� ���
Begin Tran

	Insert Into TranTest(Name) Values('ȫ�浿')

	Update TranTest Set Name = 'Ʈ�����1' Where Num = 14

	Insert Into TranTest(Name) Values('ȫ�浿')

	If @@Error > 0		-- ��������� Ʈ����� �ǵ�����
	Begin
		RollBack Tran
	End

Commit Tran

Select * From TranTest
--[10] �ѹ� ó���� �������� ���� ó���� Ʈ������� �ݵ�� ����
Begin Tran
	Insert��
	Update��
	Delete��
Commit Tran




--[0] Ʈ���� ������ ���̺� ����
--DROP TABLE dbo.[�������̺�]
CREATE TABLE dbo.[�������̺�]
(
	CustomerID int, --����ȣ
	ProductID int,	--��ǰ��ȣ
	Quantity int	--�ֹ�����
)
GO

--DROP TABLE dbo.[������̺�]
CREATE TABLE dbo.[������̺�]
(
	ProductID int,	--��ǰ��ȣ
	Quantity int	--������
)
GO

--[1] ������̺� 1��, 2�� ��ǰ�� 10�� �־����(����)
INSERT [������̺�] VALUES(1, 10)
INSERT [������̺�] VALUES(2, 10)
SELECT * FROM [������̺�]

--[2] ���Ű� �ѹ� �̷������ �ڵ����� ������̺��� ���ҽ�Ű�� Ʈ���� �ۼ�
CREATE TRIGGER [�ڵ������]
ON [�������̺�] 
FOR INSERT --���� ���̺� �����Ͱ� �ԷµǴ� ����
AS
	UPDATE [������̺�] 
	SET Quantity = Quantity - 1

	PRINT '������̺��� 1�� �����߽��ϴ�.'
Go

--[3] �������̺� INSERT���� ������Ѻ���.
INSERT [�������̺�] VALUES(1, 1, 1)

--[4] Ʈ���ſ����� ������̺��� ��� �ʵ尪�� �ڵ����� ���ҵ��� �� �� �ִ�.
SELECT * FROM [������̺�]

--[5] Ʈ���Ÿ� �����غ���: ���Ű�����ŭ ���̵��� ����
ALTER TRIGGER [�ڵ������]
ON [�������̺�]
FOR INSERT
AS
	DECLARE @ProductID int
	Declare @Quantity int

	SET @ProductID = 0
	SET @Quantity = 0

	--Select * From [�������̺�]

	SELECT 
		@ProductID = ProductID, 
		@Quantity = Quantity 
	FROM INSERTED  --INSERTED�� ���ؼ� �Էµ� ������ �޾ƿ�

	UPDATE [������̺�] 
	SET Quantity = Quantity - @Quantity
	WHERE ProductID = @ProductID
GO

--[6] 1�� ��ǰ���� 1�� ����
INSERT [�������̺�] VALUES(1, 1, 1)
SELECT * FROM [������̺�]

--[7] 2�� ��ǰ���� 3�� ����
INSERT [�������̺�] VALUES(1, 2, 3)
SELECT * FROM [������̺�]

--[8] Ʈ���� ����
DROP TRIGGER [�ڵ������]

--[!] [�ڵ������]�� ������ ����� �ϴ� �Է� �������ν���
Create Procedure dbo.[�ڵ���������ν���]
	@CustomerID 	Int,
	@ProductID   	Int,
	@Quantity  	Int
As
Begin Tran
	Insert [�������̺�]
	Values
	(
		@CustomerID,
		@ProductID,
		@Quantity
	)

	UPDATE [������̺�] 
	SET Quantity = Quantity - @Quantity
	WHERE ProductID = @ProductID

	Select * From [������̺�]
Commit Tran
Go
Exec [�ڵ���������ν���] 1, 2, 3
Go










