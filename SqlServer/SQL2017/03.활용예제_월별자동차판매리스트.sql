
-- ���� ���̺� �ۼ�
--Drop Table CarSales
Create Table CarSales
(
    M1 VarChar(2) Not Null,
    M2 VarChar(2) Not Null,
    C VarChar(20) Not Null
)
Go

-- ���� ������ �Է�
Insert Into CarSales Values('1', '5', '���׽ý�')
Go
Insert Into CarSales Values('1', '3', '����')
Go
Insert Into CarSales Values('2', '4', '����')
Go
Insert Into CarSales Values('3', '4', '�ؼ���')
Go
Insert Into CarSales Values('3', '6', '�ƿ��')
Go
Insert Into CarSales Values('3', '6', '������')
Go
Insert Into CarSales Values('3', '6', '������')
Go

-- ��ȸ
Select * From CarSales 
Go

-- ���� ���� �ȸ� ���� �ǸŴ��? ���� �÷� : 3���� 4��
Select TOP 1 COUNT(M1) From CarSales Group By M1 Order By COUNT(M1) Desc
Go

-- ���� ���� �ȸ� ���� �ǸŴ��? ���� �÷�
Select M1 As M From CarSales UINONALL Select M2 As M From CarSales

-- ���� �Ǹ����� ����Ʈ ���
Select * From CarSales Where M = '3'
Go








