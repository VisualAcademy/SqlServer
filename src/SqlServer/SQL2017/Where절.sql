-- Where �� : Select���� ���� ó��(AND, OR, NOT)

-- ��ü ��� : 121317
SELECT	[s].[SalesOrderID],
		[s].[SalesOrderDetailID],
		[s].[CarrierTrackingNumber]
FROM [Sales].[SalesOrderDetail] AS [s];


-- ���� ���� : 12
SELECT	[s].[SalesOrderID],
		[s].[SalesOrderDetailID],
		[s].[CarrierTrackingNumber]
FROM [Sales].[SalesOrderDetail] AS [s]
WHERE [s].[CarrierTrackingNumber] = '4911-403C-98';


-- AND ���� : 12 : �� �� ���� ������ �� : ~�̰� �׸���~
SELECT	[s].[SalesOrderID],
		[s].[SalesOrderDetailID],
		[s].[SpecialOfferID],
		[s].[CarrierTrackingNumber]
FROM [Sales].[SalesOrderDetail] AS [s]
WHERE [s].[CarrierTrackingNumber] = '4911-403C-98' AND
	  [s].[SpecialOfferID] = 1;


-- OR ���� : 115884 : �ϳ��� ���� �� �� : ~�̰ų� �Ǵ�~
SELECT	[s].[SalesOrderID],
		[s].[SalesOrderDetailID],
		[s].[SpecialOfferID],
		[s].[CarrierTrackingNumber]
FROM [Sales].[SalesOrderDetail] AS [s]
WHERE [s].[CarrierTrackingNumber] = '4911-403C-98' OR
	  [s].[SpecialOfferID] = 1;


-- AND�� OR�� �̷���� ���� : 3101
SELECT	[s].[SalesOrderID],
		[s].[SalesOrderDetailID],
		[s].[ProductID]
FROM [Sales].[SalesOrderDetail] AS [s]
WHERE ([s].[CarrierTrackingNumber] = '4911-403C-98' AND
	  [s].[SpecialOfferID] = 1) OR
	  [s].[ProductID] = 711;
	  

-- NOT ���� : 118227 : ~�� �ƴ�
SELECT	[s].[SalesOrderID],
		[s].[SalesOrderDetailID],
		[s].[ProductID]
FROM [Sales].[SalesOrderDetail] AS [s]
WHERE  NOT [s].[ProductID] = 711;
