
-- 샘플 테이블 작성
--Drop Table CarSales
Create Table CarSales
(
    M1 VarChar(2) Not Null,
    M2 VarChar(2) Not Null,
    C VarChar(20) Not Null
)
Go

-- 예시 데이터 입력
Insert Into CarSales Values('1', '5', '제네시스')
Go
Insert Into CarSales Values('1', '3', '에쿠스')
Go
Insert Into CarSales Values('2', '4', '벤츠')
Go
Insert Into CarSales Values('3', '4', '넥서스')
Go
Insert Into CarSales Values('3', '6', '아우디')
Go
Insert Into CarSales Values('3', '6', '베엠베')
Go
Insert Into CarSales Values('3', '6', '베엠베')
Go

-- 조회
Select * From CarSales 
Go

-- 가장 많이 팔린 월의 판매대수? 단일 컬럼 : 3월이 4번
Select TOP 1 COUNT(M1) From CarSales Group By M1 Order By COUNT(M1) Desc
Go

-- 가장 많이 팔린 월의 판매대수? 다중 컬럼
Select M1 As M From CarSales UINONALL Select M2 As M From CarSales

-- 월별 판매차량 리스트 출력
Select * From CarSales Where M = '3'
Go








