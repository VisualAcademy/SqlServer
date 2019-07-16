-- Insert Into Select��
-- : ���̺��� ���� �о Ư�� ���̺� �����ϱ�

use [AdventureWorks2012];

-- ���̺� ���� : �̹� ���̺��� ������� �ִٰ� ����
Create Table IIS
(
	Name VarChar(100),
	ModifiedDate DateTime
);

-- [Person].[ContactType]�� �����͸� ��������
Insert Into IIS(Name, ModifiedDate)
Select [Name], [ModifiedDate]
From [Person].[ContactType]
Where ContactTypeID Between 1 and 10;

Select * From IIS;

-- ���̺� ����
Drop Table IIS;
