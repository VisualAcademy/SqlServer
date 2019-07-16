
-- SQL ������ ������ ����
-- ������ : Int, TinyInt, BigInt, Bit
-- �Ǽ��� : Float
-- ���ڿ�(����) : VarChar, NVarChar
-- ���ڿ�(����) : Char
-- ���ڿ� : Text
-- ��¥�� : DateTime, SmallDateTime
-- ��Ÿ : ...

-- ���̺� ���� �� : ��Ȳ�� �°� ���������� ����
Create Table Members
(
	Num Int Identity(1, 1) Primary Key, -- �Ϸù�ȣ
	Name VarChar(25) Not Null,			-- �̸�
	Age TinyInt Null,					-- ����(0~255)
	Ssn Char(13) Null,					-- �ֹι�ȣ(13)
	Intro Text Null,					-- �ڱ�Ұ�
	AddDate SmallDateTime Null,			-- ������ 
	Gender Bit Null,					-- ����(0), ����(1)
	Height Float Null,					-- Ű(180.5)
	Photo Image Null					-- ����(���̳ʸ�) 	 	
)
