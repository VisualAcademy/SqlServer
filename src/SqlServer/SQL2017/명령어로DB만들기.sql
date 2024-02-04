-- 명령어로 데이터베이스 만들기

-- Master DB로 이동
Use Master
Go

-- DB 생성
Create Database MyDB
Go

-- DB 정보 보기
Execute sp_helpdb MyDB
Go

-- DB 삭제
Drop Database MyDB
Go

-- 옵션을 두어서 DB 생성 : 살면서 딱 한번 타이핑?
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



