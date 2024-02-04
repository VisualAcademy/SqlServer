------------------------------------------------------------------------------------------
--[1] 1. �����ͺ��̽� �����(Create��)
-- ex1) �����ϰ� �����ͺ��̽� �����
--�����ͺ��̽� ��ü�� ���鶧�� 'MASTER'�� �ΰ� �Ѵ�.
Use Master	--Master�����ͺ��̽��� �̵��ϴ� ��ɾ�.
Go

--[!] MyDatabase2 �����ͺ��̽� ����
Create Database MyDatabase2
Go

--[2] �����ͺ��̽��� ���� ��ü���� ���� �˻�(�ش� �����ͺ��̽���)
Exec sp_helpdb MyDatabase2
Go
--Execute sp_helpdb MyDatabase2

--�����ͺ��̽��� ���� ��ü���� ���� �˻�(��� �����ͺ��̽�)
Exec sp_helpdb
Go

--���� �����ͺ��̽��� �ɼ����� �˻� : ���� �������.
Use MyDatabase2
Go
Exec sp_dboption
Go

--[3] 2. �����ͺ��̽� �����ϱ�(Drop��)
-- ex2) ������ ���̽� �����ϱ�
-- �����Ϸ��� �����ͺ��̽��� ���� ������̸� ������ ���� �ʴ´�.
Drop Database MyDatabase2
Go

-- ex3) ���� �����ϰ� �����ͺ��̽� �����(�ѹ������� ����� ����... ���߿��� ����������������� ���)
Create Database MyDatabase2
On
(
  name = 'MyDatabase2_data',	--DB�� ������ �̸�
  filename = 'C:\Temp\MyDatabase2_Data.MDF',	--DB���ϰ��
  size = 10,	--ũ��
  maxsize = 20,	--�ִ�ũ��
  filegrowth = 5	--����������
)
Log On
(
  name = 'MyDatabase2_log',
  filename = 'C:\Temp\MyDatabase2_log.LDF',
  size = 5,
  maxsize = 10,
  filegrowth = 2
)
Go

--[4] 3. �����ͺ��̽� �̸� �����ϱ�(sp_renamedb) : 
-- SQL Server 2000�� ������ �Ʒ� ��ɾ�θ� ���� ����
-- ex4) �����ͺ��̽� �̸� �����ϱ�
--sp_renamedb ���
--�����ͺ��̽� �̸��� �ٲ��ֱ� ���� ���� �̱��������� ��ȯ.
Exec sp_dboption 'MyDatabase2', 'single user', 'on'  --on, true�� �� �� ��밡��
go
Exec sp_renamedb 'MyDatabase2', 'MyDatabase3'
go
Exec sp_dboption 'MyDatabase3', 'single user', 'false' --false, off �Ѵ� ��밡��
go

sp_helpdb   -- sp_helpdb�� �ٲ��̸��� Ȯ���� ��.

-- �����ͺ��̽� �̸� - �ٽ� ������� ���� �� ��.
Exec sp_dboption 'MyDatabase3', 'single user', 'on'  --on, true�� �� �� ��밡��
go
Exec sp_renamedb 'MyDatabase3', 'MyDatabase2'
go
Exec sp_dboption 'MyDatabase2', 'single user', 'false' --false, off �Ѵ� ��밡��
go

--[5] 4. �����ͺ��̽� ���� �߰��ϱ�(Alter��)
-- ex5) �����ͺ��̽��� ���� �߰��ϱ�
Alter Database MyDatabase2
Add File
(
  name = 'MyDatabase2_data2',
  filename = 'C:\Temp\MyDatabase2_Data2.NDF',
  size = 5,
  maxsize = 10,
  filegrowth = 2
)
Go

-- MyDatabase2 �����ͺ��̽� ����ϱ�
use MyDatabase2

-- ������ �����ͺ��̽� ����
Use Master
Go

Drop Database MyDatabase2
Go
