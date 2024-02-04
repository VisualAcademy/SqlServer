--[!] T-SQL�� �α��� ����� �����
Use Master
Go

--[1] Sun �����ͺ��̽� ����
--Drop Database Sun
Create Database Sun
Go

--[2] Sun Login ����
--Drop Login Sun
Create Login Sun				-- ���̵�
With 
    Password = 'Pa$$w0rd',		-- ��ȣ
    DEFAULT_DATABASE = Sun,		-- �⺻ �����ͺ��̽� ����
    CHECK_POLICY = Off			-- ��ȣ ��å ���� ���� ����
Go

Alter Login Sun Enable -- Ȱ��ȭ(�⺻��)
Go

--[3] Sun �����ͺ��̽��� Sun �α��� ����ڿ� db_owner ���� �ο�
Use Sun
Go

--Drop User Sun 
Create User Sun For Login Sun With DEFAULT_SCHEMA = dbo
Go

-- db_owner ���� �ο� 
Exec sp_addrolemember db_owner, Sun
Go
