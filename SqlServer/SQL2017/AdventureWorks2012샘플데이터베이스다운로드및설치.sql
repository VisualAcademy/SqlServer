
-- �⺻ ���� �����ͺ��̽��� ��ġ�� ��� ����
EXEC sp_helpfile;


-- ��ɾ�� Ư�� �����ͺ��̽��� SSMS�� �����ϰ��� �� ��(�ڵ����� ������ ������)
USE [master]
GO
CREATE DATABASE [AdventureWorks2012] ON 
( FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\AdventureWorks2012_Data.mdf' )
 FOR ATTACH
GO
