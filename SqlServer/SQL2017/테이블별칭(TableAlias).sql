-- 테이블 별칭(Table Alias) : 긴 테이블 이름을 줄여서 표현

-- 기본
Select Name From [HumanResources].[Department];

-- 테이블에 별칭 사용 전
Select [HumanResources].[Department].[Name] 
From [HumanResources].[Department];

-- 테이블에 별칭 사용 후
Select [dept].[Name] 
From [HumanResources].[Department] As [dept];

-- 축약형
Select [d].[Name] 
From [HumanResources].[Department] As [d];





