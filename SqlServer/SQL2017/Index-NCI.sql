-- �ε���(Index)
-- Clustered Index(CI): å�� �պκ��� ����(����): 1,2,3
-- Non-Clustered Index(NCI): å�� �޺κ��� ã�ƺ���: ���̺�-100,��-200,�Լ�-300

-- CI

Use TempDB
Go

-- ���� ���̺� ����
Create Table Sales
(
	ID Int Identity(1, 1),
	ProductCode VarChar(20),
	Price Float(53),
	DateTransaction DateTime
);

-- ���� ������ �Է�
BEGIN
	
	Declare @PC VarChar(20) = 'REDPLUS'
	Declare @Price Int = 50
	Declare @Count Int = 0

	While @Count < 100000
	Begin
		Set @PC = @PC + CAST(@Count As VarChar(20))
		Set @Price = @Price + @Count
		Insert Into Sales Values(@PC, @Price, GetDate())
		Set @PC = 'REDPLUS'
		Set @Price = 50
		Set @Count += 1
	End
END
Go

-- Select Top 100 * From Sales

-- Ctrl + M Ŭ���Ͽ� [���� ���� ��ȹ ����] Ȱ��ȭ

-- Ư�� ID�� �ش��ϴ� ���ڵ� ��ȸ(�ε��� ���� ��)
Set Statistics IO ON
Select * From Sales Where ID = 12345

--ID          ProductCode          Price                  DateTransaction
------------- -------------------- ---------------------- -----------------------
--12345       REDPLUS12344         12394                  2013-11-05 03:42:13.033

--(1�� ���� ������ ����)

--���̺� 'Sales'. �˻� �� 1, ���� �б� �� 584, ������ �б� �� 0, �̸� �б� �� 0, LOB ���� �б� �� 0, LOB ������ �б� �� 0, LOB �̸� �б� �� 0.


--(1�� ���� ������ ����)



-- Sales ���̺� Clustered Index ����
Create Clustered Index idxID On Sales(ID);


-- Ư�� ID�� �ش��ϴ� ���ڵ� ��ȸ(�ε��� ���� ��)
Set Statistics IO ON
Select * From Sales Where ID = 12345

--ID          ProductCode          Price                  DateTransaction
------------- -------------------- ---------------------- -----------------------
--12345       REDPLUS12344         12394                  2013-11-05 03:42:13.033

--(1�� ���� ������ ����)

--���̺� 'Sales'. �˻� �� 1, ���� �б� �� 2, ������ �б� �� 0, �̸� �б� �� 0, LOB ���� �б� �� 0, LOB ������ �б� �� 0, LOB �̸� �б� �� 0.


--(1�� ���� ������ ����)








-- NCI

-- CI(����) : Ư�� ��ȣ�� ���� �����Ͱ� �����
-- NCI(ã�ƺ���) 
--     : Ư�� CI�� ���� �����͸� ���� : ���̺�(NCI)->100(CI)
--     : A�� �����ϴ� �ܾ�		


--[1] �⺻ ���� ��ȸ
Set Statistics IO ON
Select * From Sales Where ProductCode Like 'REDPLUS123%' Order By Price;

-- ���̺� 'Sales'. �˻� �� 1, ���� �б� �� 582, ������ �б� �� 0, �̸� �б� �� 0, LOB ���� �б� �� 0, LOB ������ �б� �� 0, LOB �̸� �б� �� 0.


--[!] Non-Clustered Index ����
Create NonClustered Index idx_PC On Sales(ProductCode);


--[2] NCI ���� ��ȸ: NCI�� CI�� ���
Set Statistics IO ON
Select * From Sales Where ProductCode Like 'REDPLUS123%' Order By Price;

-- ���̺� 'Sales'. �˻� �� 1, ���� �б� �� 240, ������ �б� �� 0, �̸� �б� �� 0, LOB ���� �б� �� 0, LOB ������ �б� �� 0, LOB �̸� �б� �� 0.

--[!] ������ �ִ� Ŭ�����͵� �ε��� ����
Drop Index Sales.idxID;


--[3] NCI ���� ��ȸ: CI�� ���� ������ Heap�� ����Ͽ� �ӵ��� �� �� ���
Set Statistics IO ON
Select * From Sales Where ProductCode Like 'REDPLUS123%' Order By Price;

-- ���̺� 'Sales'. �˻� �� 1, ���� �б� �� 114, ������ �б� �� 0, �̸� �б� �� 0, LOB ���� �б� �� 0, LOB ������ �б� �� 0, LOB �̸� �б� �� 0.
