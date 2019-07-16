-- Insert Into Select절
-- : 테이블의 값을 읽어서 특정 테이블에 저장하기

use [AdventureWorks2012];

-- 테이블 설계 : 이미 테이블이 만들어져 있다고 가정
Create Table IIS
(
	Name VarChar(100),
	ModifiedDate DateTime
);

-- [Person].[ContactType]의 데이터를 가져오기
Insert Into IIS(Name, ModifiedDate)
Select [Name], [ModifiedDate]
From [Person].[ContactType]
Where ContactTypeID Between 1 and 10;

Select * From IIS;

-- 테이블 삭제
Drop Table IIS;
