--[!] ���̺� ��������

--[0] tempdb ���
Use TempDB
Go

--[1] �ǽ��� ���̺� ���� : ���� ���� ��������(����) �Խ���
-- �۹�ȣ, ī�װ�, ����, ��ũ, Ÿ��, �ۼ���
Create Table Categories (
    CategoryID          --[!] ī�װ� �Ϸù�ȣ 
        Int             --[0] ������ ����	 
        Identity(1, 1)  --[1] �ڵ������� : 1���� 1�� ���� 
        Primary Key,    --[2] �⺻Ű(������ �ĺ���(Identifier)) : ���ڵ� �����ϴ� ������ ��
                        --    �⺻Ű�� NOT NULL ����, UNIQUE�� ����
    CategoryName        --[!] ī�װ� �̸�
        VarChar(25) 
        Not Null        --[3] �ΰ����� : NOT NULL : �ݵ�� �� �Ϸ�, NULL(�� ���)
)
Go 

Create Table dbo.FrontBoards (
    ItemID                                  --[!] �Ϸù�ȣ
        Int Identity(1, 1) Primary Key, 
    Title
        VarChar(150) Not Null
        Unique,                             --[4] ����Ű���� : ���̺��� ������ ��(�ߺ��Ұ�)
    Url VarChar(255)
        Null,                               --[5] �� ���� : NULL : ���� �Է����� �ʾƵ� ����
    [Target] VarChar(10) Null 
        Check (                             --[6] üũ���� : �־��� �����͸� �Է� ���
            Target In('_top', '_blank', '_parent', '_self') 
        ),            
    CreatedDate DateTime
        Default(GetDate()),                 --[7] �⺻�� ���� : ���ڵ� ������ �⺻�� �ο�
    CategoryID Int
        References Categories(CategoryID)   --[8] �ܷ�Ű : �ٸ� ���̺��� �⺻Ű�� ������ ��
)    
Go

--[1] ���� ������ �Է� : �ڵ������� üũ
Insert Into Categories Values('����');
Insert Categories Values('����');
Select * From Categories Order By CategoryID Asc

--[2] �⺻�� ��������
Insert Into FrontBoards 
Values('����ڸ���', 'http://www.dotnetkorea.com', '_blank', Default,  1);
Insert Into FrontBoards(Title, Url, Target, CategoryID) 
Values('���־��ī����', 'http://www.VisualAcademy.com', '_self', 2);
Select * From FrontBoards

--[3] �ΰ� üũ
--Insert Into FrontBoards(Url) Values('http://www.JavaCampus.com');

--[4] ����Ű �������� Ȯ��
--Insert Into FrontBoards 
--Values('����ڸ���', 'http://www.dotnetkorea.com', '_blank', Default,  1);

--[5] üũ��������
--Insert Into FrontBoards 
--Values('�ڹ�ķ�۽�', 'http://www.JavaCampus.com', '_main', Default,  1);

--[6] �ܷ�Ű(Foreign Key) 
--Insert Into FrontBoards 
--Values('�ڹ�ķ�۽�', 'http://www.JavaCampus.com', '_blank', Default,  3);