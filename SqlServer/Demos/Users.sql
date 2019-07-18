--[!] 회원(Users) 관리 테이블
Create Table dbo.Users
(
	Id 
		Int 
		Identity(1, 1) 
		Primary Key 
		Not Null,						-- 일련번호
	Username 
		NVarChar(30) 
		Not Null,						-- 아이디
	Password 
		NVarChar(50) 
		Null,							-- 암호
	Name		
		NVarChar(50) 
		Null,							-- 이름
	Email		
		NVarChar(100) 
		Null,							-- 이메일
	Description 
		NVarChar(255) 
		Null,							-- 설명(소개)
	CreationDate	
		DateTimeOffset(7) 
		Default(GetDate()),				-- 가입일
	LastLoginDate 
		DateTimeOffset(7) 
		Default(GetDate()),				-- 마지막 로그인
	LastLoginIp 
		NVarChar(16) 
		Null,							-- IP 주소
	VisitedCount 
		Int 
		Default(0),						-- 방문횟수
	Blocked 
		Bit 
		Default(0),						-- 계정 잠금

	PhoneNumber 
		NVarChar(30)	
		Null,							-- 전화번호
	Address		
		NVarChar(500) 
		Null,							-- 주소
	Gender		
		NVarChar(10) 
		Null,							-- 성별
	BirthDate	
		NVarChar(20) 
		Null,							-- 생년월일
	Country		
		NVarChar(50) 
		Null,							-- 국가
	
	NickName	
		NVarChar(50) 
		Null,							-- 닉네임
	UserIcon	
		NVarChar(100) 
		Null,							-- 사용자 아이콘
	
	IsSleep	
		Bit 
		Default(0),						-- 휴면 사용자 여부
	SleepDate 
		DateTimeOffset(7) 
		Default(GetDate())				-- 휴면 전환 시점
)
Go
