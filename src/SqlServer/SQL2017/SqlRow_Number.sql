-- Row_Number() �Լ� ���� �� ����¡ ó��
use AdventureWorks;

select * from Sales.vSalesPerson;

-- ���� �Ǹ� ������ ���� ���� ����� ������ �� ��ȣ ��ȯ
select 
	Firstname, LastName, 
	ROW_NUMBER() Over(Order By SalesYTD Desc) As 'Row Number',
	SalesYTD
from Sales.vSalesPerson
where TerritoryName Is Not Null And SalesYTD <> 0;

-- ���� ���� ���� ��ȯ : ���� ���ȣ 50~60������ ���
With OrderedOrders 
As
	(
		Select 
			SalesOrderID, OrderDate,
			ROW_NUMBER() Over (Order By OrderDate) As 'RowNumber'
		From Sales.SalesOrderHeader
	)
Select * From OrderedOrders Where RowNumber Between 50 And 60;

-- Ư�� �ʵ带 �׷����� ��� �� �ȿ��� �� �ٸ� �������ȣ�� ���
select 
	Firstname, LastName, 
	ROW_NUMBER() Over(Partition By PostalCode Order By SalesYTD Desc) 
	As 'Row Number',
	SalesYTD,
	PostalCode
from Sales.vSalesPerson
where TerritoryName Is Not Null And SalesYTD <> 0;

-- ����¡ ���
With OrderedOrders 
As
	(
		Select 
			SalesOrderID, OrderDate,
			ROW_NUMBER() Over (Order By OrderDate) As 'RowNumber'
		From Sales.SalesOrderHeader
	)
Select * From OrderedOrders Where RowNumber Between 50 And 60;

-- ����¡ ó�� �Լ�
Create Function GetOrdersPage(@Page Int, @PageSize Int)
Returns Table
As
Return 
	With OrderedOrders 
	As
		(
			Select 
				SalesOrderID, OrderDate,
				ROW_NUMBER() Over (Order By OrderDate) As 'RowNumber'
			From Sales.SalesOrderHeader
		)
	Select * From OrderedOrders 
	Where RowNumber 
		Between (@Page - 1) * @PageSize + 1 And (@Page * @PageSize)
;

-- ����¡ �Լ� ���
select * From GetOrdersPage(2, 5); -- 1~10, 11~20















