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










