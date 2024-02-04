-- TOP 쿼리 : 상위 n 개의 레코드를 반환

-- 전체 데이터 출력
SELECT	[FirstName],
		[LastName],
		[StartDate],
		[EndDate]
FROM [HumanResources].[vEmployeeDepartmentHistory] AS [emp]
ORDER BY [emp].[StartDate];


-- TOP 10 : 상위 10개의 레코드
SELECT	TOP (10)
		[FirstName],
		[LastName],
		[StartDate],
		[EndDate]
FROM [HumanResources].[vEmployeeDepartmentHistory] AS [emp]
ORDER BY [emp].[StartDate];


-- TOP 퍼센트 : 상위 50퍼센트
SELECT	TOP (50) PERCENT
		[FirstName],
		[LastName],
		[StartDate],
		[EndDate]
FROM [HumanResources].[vEmployeeDepartmentHistory] AS [emp]
ORDER BY [emp].[StartDate];


-- TIES 사용 전 : 기본 상위 5개
SELECT	TOP (5) 
		[FirstName],
		[LastName],
		[StartDate],
		[EndDate]
FROM [HumanResources].[vEmployeeDepartmentHistory] AS [emp]
WHERE [emp].[StartDate] = '2005-07-01'
ORDER BY [emp].[StartDate];


-- TIES 사용 후 : 5 + 알파
SELECT	TOP (5) WITH TIES
		[FirstName],
		[LastName],
		[StartDate],
		[EndDate]
FROM [HumanResources].[vEmployeeDepartmentHistory] AS [emp]
WHERE [emp].[StartDate] = '2005-07-01'
ORDER BY [emp].[StartDate];

