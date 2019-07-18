--[?] 중복 데이터 가져오기 
--[1] 중복인 것 가져오기 
Select Title From Terms 
Group By Title Having Count(Title) > 1
GO

--[2] 중복인 것들 가져오기 
Select Title From Terms 
Where Title 
    In (Select Title From Terms Group By Title Having Count(Title) > 1)
Go
