------------------------------------------------------------------------------------------
--[1] 1. 데이터베이스 만들기(Create문)
-- ex1) 간단하게 데이터베이스 만들기
--데이터베이스 자체를 만들때는 'MASTER'에 두고 한다.
Use Master	--Master데이터베이스로 이동하는 명령어.
Go

--[!] MyDatabase2 데이터베이스 생성
Create Database MyDatabase2
Go

--[2] 데이터베이스에 대한 구체적인 정보 검색(해당 데이터베이스만)
Exec sp_helpdb MyDatabase2
Go
--Execute sp_helpdb MyDatabase2

--데이터베이스에 대한 구체적인 정보 검색(모든 데이터베이스)
Exec sp_helpdb
Go

--현재 데이터베이스의 옵션정보 검색 : 몰라도 상관없다.
Use MyDatabase2
Go
Exec sp_dboption
Go

--[3] 2. 데이터베이스 삭제하기(Drop문)
-- ex2) 데이터 베이스 삭제하기
-- 삭제하려는 데이터베이스가 현재 사용중이면 삭제가 되질 않는다.
Drop Database MyDatabase2
Go

-- ex3) 좀더 세세하게 데이터베이스 만들기(한번정도는 만들어 보자... 나중에는 엔터프라이즈관리자 사용)
Create Database MyDatabase2
On
(
  name = 'MyDatabase2_data',	--DB의 논리적인 이름
  filename = 'C:\Temp\MyDatabase2_Data.MDF',	--DB파일경로
  size = 10,	--크기
  maxsize = 20,	--최대크기
  filegrowth = 5	--파일증가량
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

--[4] 3. 데이터베이스 이름 변경하기(sp_renamedb) : 
-- SQL Server 2000은 오로지 아래 명령어로만 변경 가능
-- ex4) 데이터베이스 이름 변경하기
--sp_renamedb 사용
--데이터베이스 이름을 바꿔주기 전에 먼저 싱글유저모드로 전환.
Exec sp_dboption 'MyDatabase2', 'single user', 'on'  --on, true를 둘 다 사용가능
go
Exec sp_renamedb 'MyDatabase2', 'MyDatabase3'
go
Exec sp_dboption 'MyDatabase3', 'single user', 'false' --false, off 둘다 사용가능
go

sp_helpdb   -- sp_helpdb로 바뀐이름을 확인할 것.

-- 데이터베이스 이름 - 다시 원래대로 복구 할 것.
Exec sp_dboption 'MyDatabase3', 'single user', 'on'  --on, true를 둘 다 사용가능
go
Exec sp_renamedb 'MyDatabase3', 'MyDatabase2'
go
Exec sp_dboption 'MyDatabase2', 'single user', 'false' --false, off 둘다 사용가능
go

--[5] 4. 데이터베이스 파일 추가하기(Alter문)
-- ex5) 데이터베이스에 파일 추가하기
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

-- MyDatabase2 데이터베이스 사용하기
use MyDatabase2

-- 연습용 데이터베이스 삭제
Use Master
Go

Drop Database MyDatabase2
Go
