--제목: (저장 프로시저의 변수를 사용하여) 동적으로 테이블 이름을 바꾸기
Create Table Test
(
	Id Int Primary Key Identity(1, 1),
	Name NVarChar(25)
)
Go
Create Table Test2
(
	Id Int Primary Key Identity(1, 1),
	Name NVarChar(25)
)
Go
Select * From Test2
Go
Create Proc GetTableName
	@TableName NVarChar(25)
As
	Declare @sql NVarChar(Max)
	Set @sql = 'Select * From ' + @TableName
	Execute sp_executesql @sql 
Go
Exec GetTableName 'Test'
Go
Exec GetTableName 'Test2'
Go
