use tempdb;

--[!] 상품 테이블
Create Table dbo.Products 
(
  ProductID Int Identity(1, 1) Not Null Primary Key , --상품고유코드
  CategoryID Int Not Null,                            --카테고리번호
  ModelNumber VarChar(50),                            --모델번호
  ModelName VarChar(50),                              --모델명(상품명)
  Company VarChar(50),                                --제조회사
  OriginPrice Int Null,                               --원가
  SellPrice Int Null,                                 --판매가
  EventName VarChar(50) Null,         
        --신상품(NEW),히트(HIT),기획(BEST),진열없음(NONE),...
  ProductImage VarChar(50),                           --이미지명(큰/상세/리스트)
  Explain VarChar(400),                               --요약설명
  [Description] Text Null,                            --상세설명 : VarChar(4000)
  Encoding VarChar(10) Null,                          --인코딩(Text/HTML/Mixed)
  ProductCount Int Default(0),                        --재고수량
  RegistDate DateTime Default(GetDate()),             --상품등록일
  Mileage Int Null,                                   --마일리지(적립금)
  Absence Int Null                                    --품절여부(1:품절)
)
Go 

--[!] 예시 데이터 입력
Insert Into Products Values (1, 'COM-01', '좋은컴퓨터', '우리집', 10000, 8000, 
'NEW', 'COM-01.JPG', '좋은컴퓨터입니다.', '좋은컴퓨터입니다...', 'Text', 100, GetDate(), 0, 0)
;
Insert Into Products Values (2, 'BOOK-01', '좋은책', '우리집', 8000, 5000, 
'HIT', 'BOOK-01.JPG', '좋은책입니다.', '좋은책입니다...', 'Text', 100, GetDate(), 0, 0)
;
Insert Into Products Values (3, 'SOFTWARE-01', '좋은강의', '우리집', 10000, 8000, 
'BEST', 'SOFTWARE-01.JPG', '좋은강의입니다.', '좋은강의입니다...', 'Text', 100, GetDate(), 0, 0)
;

-- 전체 상품 리스트 출력
Select ProductID, CategoryID, ModelName From Products Order By ProductID Asc;

-- Case 표현식으로 카테고리 표현: 조건에 따른 값 출력
Select ProductID, ModelName, CategoryID,
	Case CategoryID
		When 1 Then '컴퓨터'
		When 2 Then '서적'
		When 3 Then '강의' 
	End As CategoryName
From Products
;

Select ProductID, ModelName, CategoryID,
	Case CategoryID
		When 1 Then		'컴퓨터'
		When 2 Then		'서적'
		Else			'기타 카테고리'
	End As CategoryName
From Products
;

