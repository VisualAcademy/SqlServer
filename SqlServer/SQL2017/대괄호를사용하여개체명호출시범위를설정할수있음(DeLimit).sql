-- 개체명 호출시 [] 대괄호를 사용하여 범위를 설정할 수 있음

Select * From [HumanResources].[Department];

Select Name, [Name] From [HumanResources].[Department];

Create Table #Department
(
	DepartmentID Int Not Null
);

Select DepartmentID From #Department;

Create Table #Department2
(
	[Department ID] Int Not Null
);

Select [Department ID] From #Department2;

