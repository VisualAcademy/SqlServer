--[!] 예시문
-- 일정 입력
Insert Into Schedules (Community, SYear, SMonth, SDay, SHour, SMinute, Title, Content, Created, Icon, Ref) 
Values ('SQL', 2018, 1, 20, 12, 30, 'SQL 문 연습', 'Insert, Select, Update, Delete 연습', Default, '', NULL); 

-- 일정 출력
Select * From Schedules;
Select * From Schedules Where Community = 'SQL' And SYear = 2018 And SMonth = 1 And SDay = 20;

-- 일정 상세
Select * From Schedules Where Num = 1;

-- 일정 수정
Update Schedules
Set
    Community = 'C#', 
    SYear = 2019, 
    SMonth = 1, 
    SDay = 25, 
    SHour = 10, 
    SMinute = 30, 
    Title = 'C# 공부', 
    Content = 'Visual Studio를 사용한 C# 개발'    
Where  Num = 1;

-- 일정 삭제
Delete Schedules Where Num = 1;