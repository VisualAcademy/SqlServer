--[!] T-SQL로 로그인 사용자 만들기
Use Master
Go

--[1] Sun 데이터베이스 생성
--Drop Database Sun
Create Database Sun
Go

--[2] Sun Login 생성
--Drop Login Sun
Create Login Sun				-- 아이디
With 
    Password = 'Pa$$w0rd',		-- 암호
    DEFAULT_DATABASE = Sun,		-- 기본 데이터베이스 설정
    CHECK_POLICY = Off			-- 암호 정책 강제 적용 해제
Go

Alter Login Sun Enable -- 활성화(기본값)
Go

--[3] Sun 데이터베이스에 Sun 로그인 사용자에 db_owner 권한 부여
Use Sun
Go

--Drop User Sun 
Create User Sun For Login Sun With DEFAULT_SCHEMA = dbo
Go

-- db_owner 권한 부여 
Exec sp_addrolemember db_owner, Sun
Go
