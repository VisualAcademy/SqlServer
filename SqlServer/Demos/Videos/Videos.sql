-- 비디오 테이블
CREATE TABLE [dbo].[Videos]
(
	Id INT NOT NULL PRIMARY KEY Identity(1, 1),
	Title NVarChar(Max) Not Null,
	Created DateTimeOffset(7) Default(SysDateTimeOffset() AT TIME ZONE 'Korea Standard Time')
)
Go
