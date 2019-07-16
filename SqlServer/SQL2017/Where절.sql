-- Where 절 : Select문의 조건 처리(AND, OR, NOT)

-- 전체 출력 : 121317
SELECT	[s].[SalesOrderID],
		[s].[SalesOrderDetailID],
		[s].[CarrierTrackingNumber]
FROM [Sales].[SalesOrderDetail] AS [s];


-- 단일 구문 : 12
SELECT	[s].[SalesOrderID],
		[s].[SalesOrderDetailID],
		[s].[CarrierTrackingNumber]
FROM [Sales].[SalesOrderDetail] AS [s]
WHERE [s].[CarrierTrackingNumber] = '4911-403C-98';


-- AND 연산 : 12 : 둘 다 참일 때에만 참 : ~이고 그리고~
SELECT	[s].[SalesOrderID],
		[s].[SalesOrderDetailID],
		[s].[SpecialOfferID],
		[s].[CarrierTrackingNumber]
FROM [Sales].[SalesOrderDetail] AS [s]
WHERE [s].[CarrierTrackingNumber] = '4911-403C-98' AND
	  [s].[SpecialOfferID] = 1;


-- OR 연산 : 115884 : 하나라도 참일 때 참 : ~이거나 또는~
SELECT	[s].[SalesOrderID],
		[s].[SalesOrderDetailID],
		[s].[SpecialOfferID],
		[s].[CarrierTrackingNumber]
FROM [Sales].[SalesOrderDetail] AS [s]
WHERE [s].[CarrierTrackingNumber] = '4911-403C-98' OR
	  [s].[SpecialOfferID] = 1;


-- AND와 OR로 이루어진 구문 : 3101
SELECT	[s].[SalesOrderID],
		[s].[SalesOrderDetailID],
		[s].[ProductID]
FROM [Sales].[SalesOrderDetail] AS [s]
WHERE ([s].[CarrierTrackingNumber] = '4911-403C-98' AND
	  [s].[SpecialOfferID] = 1) OR
	  [s].[ProductID] = 711;
	  

-- NOT 연산 : 118227 : ~가 아닌
SELECT	[s].[SalesOrderID],
		[s].[SalesOrderDetailID],
		[s].[ProductID]
FROM [Sales].[SalesOrderDetail] AS [s]
WHERE  NOT [s].[ProductID] = 711;
