-- AT TIME ZONE 구문

-- 타임존 정보 표시
Select * From sys.time_zone_info
Go

-- 현재 시간을 'UTC'로 표시
Select GetDate() AT TIME ZONE 'UTC' 
Go

-- 현재 시간을 'Korea Standard Time'으로 표시
Select GetDate() AT TIME ZONE 'Korea Standard Time'
Go

-- 샘플 로그 테이블 생성
Create Table LogBases
(
	Id Int Identity(1, 1) Primary Key Not Null,
	Message NVarChar(Max),
	TimeStamp DateTimeOffset(7) Default(GetDate() AT TIME ZONE 'Korea Standard Time')
)
Go

-- 입력 테스트
Insert Into LogBases (Message) Values (N'데이터 입력 테스트')
Go

-- 출력 테스트
Select * From LogBases
Go
