use tempdb;

--[!] ��ǰ ���̺�
Create Table dbo.Products 
(
  ProductID Int Identity(1, 1) Not Null Primary Key , --��ǰ�����ڵ�
  CategoryID Int Not Null,                            --ī�װ���ȣ
  ModelNumber VarChar(50),                            --�𵨹�ȣ
  ModelName VarChar(50),                              --�𵨸�(��ǰ��)
  Company VarChar(50),                                --����ȸ��
  OriginPrice Int Null,                               --����
  SellPrice Int Null,                                 --�ǸŰ�
  EventName VarChar(50) Null,         
        --�Ż�ǰ(NEW),��Ʈ(HIT),��ȹ(BEST),��������(NONE),...
  ProductImage VarChar(50),                           --�̹�����(ū/��/����Ʈ)
  Explain VarChar(400),                               --��༳��
  [Description] Text Null,                            --�󼼼��� : VarChar(4000)
  Encoding VarChar(10) Null,                          --���ڵ�(Text/HTML/Mixed)
  ProductCount Int Default(0),                        --������
  RegistDate DateTime Default(GetDate()),             --��ǰ�����
  Mileage Int Null,                                   --���ϸ���(������)
  Absence Int Null                                    --ǰ������(1:ǰ��)
)
Go 

--[!] ���� ������ �Է�
Insert Into Products Values (1, 'COM-01', '������ǻ��', '�츮��', 10000, 8000, 
'NEW', 'COM-01.JPG', '������ǻ���Դϴ�.', '������ǻ���Դϴ�...', 'Text', 100, GetDate(), 0, 0)
;
Insert Into Products Values (2, 'BOOK-01', '����å', '�츮��', 8000, 5000, 
'HIT', 'BOOK-01.JPG', '����å�Դϴ�.', '����å�Դϴ�...', 'Text', 100, GetDate(), 0, 0)
;
Insert Into Products Values (3, 'SOFTWARE-01', '��������', '�츮��', 10000, 8000, 
'BEST', 'SOFTWARE-01.JPG', '���������Դϴ�.', '���������Դϴ�...', 'Text', 100, GetDate(), 0, 0)
;

-- ��ü ��ǰ ����Ʈ ���
Select ProductID, CategoryID, ModelName From Products Order By ProductID Asc;

-- Case ǥ�������� ī�װ� ǥ��: ���ǿ� ���� �� ���
Select ProductID, ModelName, CategoryID,
	Case CategoryID
		When 1 Then '��ǻ��'
		When 2 Then '����'
		When 3 Then '����' 
	End As CategoryName
From Products
;

Select ProductID, ModelName, CategoryID,
	Case CategoryID
		When 1 Then		'��ǻ��'
		When 2 Then		'����'
		Else			'��Ÿ ī�װ�'
	End As CategoryName
From Products
;

