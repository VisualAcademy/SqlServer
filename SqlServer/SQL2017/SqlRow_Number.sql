-- Row_Number() 함수 사용법 및 페이징 처리
use AdventureWorks;

select * from Sales.vSalesPerson;

-- 연간 판매 실적에 따른 영업 사원의 고유한 행 번호 반환
select 
	Firstname, LastName, 
	ROW_NUMBER() Over(Order By SalesYTD Desc) As 'Row Number',
	SalesYTD
from Sales.vSalesPerson
where TerritoryName Is Not Null And SalesYTD <> 0;

-- 행의 하위 집합 반환 : 고유 행번호 50~60까지만 출력
With OrderedOrders 
As
	(
		Select 
			SalesOrderID, OrderDate,
			ROW_NUMBER() Over (Order By OrderDate) As 'RowNumber'
		From Sales.SalesOrderHeader
	)
Select * From OrderedOrders Where RowNumber Between 50 And 60;

-- 특정 필드를 그룹으로 묶어서 그 안에서 또 다른 고유행번호를 출력
select 
	Firstname, LastName, 
	ROW_NUMBER() Over(Partition By PostalCode Order By SalesYTD Desc) 
	As 'Row Number',
	SalesYTD,
	PostalCode
from Sales.vSalesPerson
where TerritoryName Is Not Null And SalesYTD <> 0;

-- 페이징 기법
With OrderedOrders 
As
	(
		Select 
			SalesOrderID, OrderDate,
			ROW_NUMBER() Over (Order By OrderDate) As 'RowNumber'
		From Sales.SalesOrderHeader
	)
Select * From OrderedOrders Where RowNumber Between 50 And 60;

-- 페이징 처리 함수
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

-- 페이징 함수 사용
select * From GetOrdersPage(2, 5); -- 1~10, 11~20















