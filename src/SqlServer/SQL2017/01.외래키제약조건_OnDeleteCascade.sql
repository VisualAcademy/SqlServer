--[!] 부모 테이블과 자식 테이블이 Foreign Key 제약 조건으로 설정되었을 때에 
--    부모 테이블 삭제시 자식 테이블이 참고하고 있을 시에는 부모 테이블의 레코드를 삭제할 수 없다.

--[0] tempdb에서 연습하기
Use tempdb
Go

--[1] 카테고리 샘플 테이블 생성
Create Table Categories
(
	CategoryID Int Identity(1, 1) Primary Key, 
	CategoryName VarChar(25)
)
Go

--[2] 카테고리 테이블에 샘플 데이터 2개 등록
Insert Into Categories Values('데스크톱')
Go
Insert Into Categories Values('노트북')
Go
Insert Into Categories Values('가전')
Go

--[3] 상품 테이블 생성
Create Table Products
(
	ProductID Int Identity(1, 1) Primary Key,
	ProductName VarChar(25),
	CategoryID Int Not Null
)

--[4] 기본값으로 외래키 지정 
Alter Table dbo.Products
Add Foreign Key(CategoryID) References Categories(CategoryID)
Go

--[5] 샘플 상품 데이터 등록
Insert Into Products Values ('좋은컴퓨터', 1)
Go
Insert Into Products Values ('좋은노트북', 2)
Go

--[6] 만약 1번 카테고리인 데스크톱을 삭제하려면, 좋은컴퓨터가 참조하고 있으므로 삭제 불가 : 에러 발생
Delete Categories Where CategoryID = 1
Go

--[7] 외래키 설정시 On Delete Cascade 옵션을 두면, 부모키(Primary Key) 삭제시 참조되는 모든 자식 테이블의 레코드도 같이 삭제
Alter Table dbo.Products
Add Foreign Key(CategoryID) References Categories(CategoryID) On Delete Cascade
Go

--[8] 1번 카테고리 삭제 시도 : 삭제됨
Delete Categories Where CategoryID = 1
Go

--[9] 위 구문 수행 결과 1번 카테고리 및 1번 카테고리를 참고하고 있는 Products 테이블의 '좋은컴퓨터' 항목도 같이 삭제됨
Select * From Products
Go

--[10] 만약, 자식 테이블에서 참조하고 있지 않은 '가전' 레코드는 바로 삭제가 가능하다.
Delete Categories Where CategoryID = 3
Go

