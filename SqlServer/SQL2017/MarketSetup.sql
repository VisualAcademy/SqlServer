-----------------------------------------------------------
-- Market DB �� �α��� ����� ���� �� ���� �ֱ�
-- �ۼ��� : �ڿ���
-----------------------------------------------------------

use master;

--[1] Market �����ͺ��̽� ����
Create Database Market
Go

--[2] Market2 Login ����
Create Login Market				-- UID
With
	Password = 'Market',			-- PWD
	DEFAULT_DATABASE = Market,		-- �⺻ �����ͺ��̽�
	CHECK_POLICY = Off				-- ��ȣ��å�������� ����
;

Alter Login Market Enable;

--[3] Market �����ͺ��̽��� ��� ���� �ο�
use Market;

Create User Market For Login Market With DEFAULT_SCHEMA = dbo;

-- db_owner ���� �ο�
Exec sp_addrolemember db_owner, Market;


