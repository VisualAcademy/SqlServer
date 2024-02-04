
-- 기본 제공 데이터베이스가 설치된 경로 정보
EXEC sp_helpfile;


-- 명령어로 특정 데이터베이스를 SSMS에 연결하고자 할 때(자동으로 생성한 구문임)
USE [master]
GO
CREATE DATABASE [AdventureWorks2012] ON 
( FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\AdventureWorks2012_Data.mdf' )
 FOR ATTACH
GO
