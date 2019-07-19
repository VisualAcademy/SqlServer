
-- SQL 데이터 형식의 종류
-- 정수형 : Int, TinyInt, BigInt, Bit
-- 실수형 : Float
-- 문자열(가변) : VarChar, NVarChar
-- 문자열(고정) : Char
-- 문자열 : Text
-- 날짜형 : DateTime, SmallDateTime
-- 기타 : ...

-- 테이블 생성 예 : 상황에 맞게 데이터형식 지정
Create Table Members
(
	Num Int Identity(1, 1) Primary Key, -- 일련번호
	Name VarChar(25) Not Null,			-- 이름
	Age TinyInt Null,					-- 나이(0~255)
	Ssn Char(13) Null,					-- 주민번호(13)
	Intro Text Null,					-- 자기소개
	AddDate SmallDateTime Null,			-- 가입일 
	Gender Bit Null,					-- 남자(0), 여자(1)
	Height Float Null,					-- 키(180.5)
	Photo Image Null					-- 사진(바이너리) 	 	
)
