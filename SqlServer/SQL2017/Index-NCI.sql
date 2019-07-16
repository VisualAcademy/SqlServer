-- 인덱스(Index)
-- Clustered Index(CI): 책의 앞부분의 차례(목차): 1,2,3
-- Non-Clustered Index(NCI): 책의 뒷부분의 찾아보기: 테이블-100,뷰-200,함수-300

-- CI

Use TempDB
Go

-- 샘플 테이블 생성
Create Table Sales
(
	ID Int Identity(1, 1),
	ProductCode VarChar(20),
	Price Float(53),
	DateTransaction DateTime
);

-- 샘플 데이터 입력
BEGIN
	
	Declare @PC VarChar(20) = 'REDPLUS'
	Declare @Price Int = 50
	Declare @Count Int = 0

	While @Count < 100000
	Begin
		Set @PC = @PC + CAST(@Count As VarChar(20))
		Set @Price = @Price + @Count
		Insert Into Sales Values(@PC, @Price, GetDate())
		Set @PC = 'REDPLUS'
		Set @Price = 50
		Set @Count += 1
	End
END
Go

-- Select Top 100 * From Sales

-- Ctrl + M 클릭하여 [실제 실행 계획 포함] 활성화

-- 특정 ID에 해당하는 레코드 조회(인덱스 생성 전)
Set Statistics IO ON
Select * From Sales Where ID = 12345

--ID          ProductCode          Price                  DateTransaction
------------- -------------------- ---------------------- -----------------------
--12345       REDPLUS12344         12394                  2013-11-05 03:42:13.033

--(1개 행이 영향을 받음)

--테이블 'Sales'. 검색 수 1, 논리적 읽기 수 584, 물리적 읽기 수 0, 미리 읽기 수 0, LOB 논리적 읽기 수 0, LOB 물리적 읽기 수 0, LOB 미리 읽기 수 0.


--(1개 행이 영향을 받음)



-- Sales 테이블에 Clustered Index 생성
Create Clustered Index idxID On Sales(ID);


-- 특정 ID에 해당하는 레코드 조회(인덱스 생성 후)
Set Statistics IO ON
Select * From Sales Where ID = 12345

--ID          ProductCode          Price                  DateTransaction
------------- -------------------- ---------------------- -----------------------
--12345       REDPLUS12344         12394                  2013-11-05 03:42:13.033

--(1개 행이 영향을 받음)

--테이블 'Sales'. 검색 수 1, 논리적 읽기 수 2, 물리적 읽기 수 0, 미리 읽기 수 0, LOB 논리적 읽기 수 0, LOB 물리적 읽기 수 0, LOB 미리 읽기 수 0.


--(1개 행이 영향을 받음)








-- NCI

-- CI(차례) : 특정 번호에 실제 데이터가 저장됨
-- NCI(찾아보기) 
--     : 특정 CI에 대한 포인터를 가짐 : 테이블(NCI)->100(CI)
--     : A로 시작하는 단어		


--[1] 기본 범위 조회
Set Statistics IO ON
Select * From Sales Where ProductCode Like 'REDPLUS123%' Order By Price;

-- 테이블 'Sales'. 검색 수 1, 논리적 읽기 수 582, 물리적 읽기 수 0, 미리 읽기 수 0, LOB 논리적 읽기 수 0, LOB 물리적 읽기 수 0, LOB 미리 읽기 수 0.


--[!] Non-Clustered Index 생성
Create NonClustered Index idx_PC On Sales(ProductCode);


--[2] NCI 범위 조회: NCI가 CI를 사용
Set Statistics IO ON
Select * From Sales Where ProductCode Like 'REDPLUS123%' Order By Price;

-- 테이블 'Sales'. 검색 수 1, 논리적 읽기 수 240, 물리적 읽기 수 0, 미리 읽기 수 0, LOB 논리적 읽기 수 0, LOB 물리적 읽기 수 0, LOB 미리 읽기 수 0.

--[!] 기존에 있던 클러스터드 인덱스 제거
Drop Index Sales.idxID;


--[3] NCI 범위 조회: CI가 없을 때에는 Heap을 사용하여 속도가 좀 더 향상
Set Statistics IO ON
Select * From Sales Where ProductCode Like 'REDPLUS123%' Order By Price;

-- 테이블 'Sales'. 검색 수 1, 논리적 읽기 수 114, 물리적 읽기 수 0, 미리 읽기 수 0, LOB 논리적 읽기 수 0, LOB 물리적 읽기 수 0, LOB 미리 읽기 수 0.
