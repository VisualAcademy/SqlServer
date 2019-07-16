-- ��ɾ�� �����ͺ��̽� �����

-- Master DB�� �̵�
Use Master
Go

-- DB ����
Create Database MyDB
Go

-- DB ���� ����
Execute sp_helpdb MyDB
Go

-- DB ����
Drop Database MyDB
Go

-- �ɼ��� �ξ DB ���� : ��鼭 �� �ѹ� Ÿ����?
CREATE DATABASE MyDb 
ON
PRIMARY  
    (NAME = MyDb,
    FILENAME = 'C:\Temp\MyDb.mdf',
    SIZE = 100MB,
    MAXSIZE = 200,
    FILEGROWTH = 20),
    ( NAME = MyDb2,
    FILENAME = 'C:\Temp\MyDb2.ndf',
    SIZE = 100MB,
    MAXSIZE = 200,
    FILEGROWTH = 20)
LOG ON 
   (NAME = Archlog1,
    FILENAME = 'C:\Temp\MyDb_Log.ldf',
    SIZE = 100MB,
    MAXSIZE = 200,
    FILEGROWTH = 20)
GO



