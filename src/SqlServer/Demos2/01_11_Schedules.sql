-- 일정관리 테이블 생성: 커뮤니티(Communities 테이블)에 따른 일정관리 
Create Table dbo.Schedules
(
    Num             Int Identity(1, 1) Not Null Primary Key,    -- 일련번호
    CommunityName   NVarChar(25) Null,                          -- 커뮤니티(그룹) 이름 => CommunityId
    SYear           SmallInt Not Null,                          -- 년
    SMonth          SmallInt Not Null,                          -- 월
    SDay            SmallInt Not Null,                          -- 일
    SHour           SmallInt Null,                              -- 시
    SMinute         SmallInt Null,                              -- 분     
    Title           NVarChar(150) Not Null,                     -- 일정 제목
    Content         NVarChar(Max) Null,                         -- 일정 내용 
    Created         DateTimeOffset(7) Default(GetDate()),       -- 일정 등록일
    Icon            NVarChar(20) Null,                          -- 아이콘
    Ref             Int Null                                    -- 외부 일정 참조용
)
Go
