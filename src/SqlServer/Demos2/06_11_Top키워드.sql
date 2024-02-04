-- TOP ���� : ���� n ���� ���ڵ带 ��ȯ

-- ��ü ������ ���
SELECT	[FirstName],
		[LastName],
		[StartDate],
		[EndDate]
FROM [HumanResources].[vEmployeeDepartmentHistory] AS [emp]
ORDER BY [emp].[StartDate];


-- TOP 10 : ���� 10���� ���ڵ�
SELECT	TOP (10)
		[FirstName],
		[LastName],
		[StartDate],
		[EndDate]
FROM [HumanResources].[vEmployeeDepartmentHistory] AS [emp]
ORDER BY [emp].[StartDate];


-- TOP �ۼ�Ʈ : ���� 50�ۼ�Ʈ
SELECT	TOP (50) PERCENT
		[FirstName],
		[LastName],
		[StartDate],
		[EndDate]
FROM [HumanResources].[vEmployeeDepartmentHistory] AS [emp]
ORDER BY [emp].[StartDate];


-- TIES ��� �� : �⺻ ���� 5��
SELECT	TOP (5) 
		[FirstName],
		[LastName],
		[StartDate],
		[EndDate]
FROM [HumanResources].[vEmployeeDepartmentHistory] AS [emp]
WHERE [emp].[StartDate] = '2005-07-01'
ORDER BY [emp].[StartDate];


-- TIES ��� �� : 5 + ����
SELECT	TOP (5) WITH TIES
		[FirstName],
		[LastName],
		[StartDate],
		[EndDate]
FROM [HumanResources].[vEmployeeDepartmentHistory] AS [emp]
WHERE [emp].[StartDate] = '2005-07-01'
ORDER BY [emp].[StartDate];

