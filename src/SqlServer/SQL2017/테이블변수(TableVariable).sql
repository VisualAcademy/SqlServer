-- ���̺� ����(Table Variable)

-- ���̺� ���� ����
-- ��ġ ����
Declare @Members Table
(
	MemberID Int Primary Key Not Null,
	MemberName VarChar(25) Not Null
);

Insert @Members Values(1, 'ȫ�浿');
Insert @Members Values(2, '��λ�');
Insert @Members Values(3, '�Ӳ���');

Select MemberID, MemberName From @Members;
-- ��ġ ��

-- ���̺� ���� ����
-- ��ġ ����
Declare @Members2 Table
(
	MemberID Int Primary Key Not Null,
	MemberName VarChar(25) Not Null
);

Insert @Members2 Values(1, 'ȫ�浿');
Insert @Members2 Values(2, '��λ�');
Insert @Members2 Values(3, '�Ӳ���');
Go -- ��ġ ��

Select MemberID, MemberName From @Members2;
-- ��ġ ��



