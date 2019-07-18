-----------------------------------------------------------
-- Market DB 및 로그인 사용자 생성 후 권한 주기
-- 작성자 : 박용준
-----------------------------------------------------------

use master;

--[1] Market 데이터베이스 생성
Create Database Market
Go

--[2] Market2 Login 생성
Create Login Market				-- UID
With
	Password = 'Market',			-- PWD
	DEFAULT_DATABASE = Market,		-- 기본 데이터베이스
	CHECK_POLICY = Off				-- 암호정책강제적용 해제
;

Alter Login Market Enable;

--[3] Market 데이터베이스에 모든 권한 부여
use Market;

Create User Market For Login Market With DEFAULT_SCHEMA = dbo;

-- db_owner 권한 부여
Exec sp_addrolemember db_owner, Market;


