-- SQL Server 2012 이상에서의 페이징 처리 구문 데모

-- 테이블에서 전체 데이터를 조회
Select * From REDPLUS131
Go

-- 상위 5개 데이터 조회
Select * From REDPLUS131 Order By Num Desc Offset 0 Rows Fetch Next 5 Rows Only;

-- 상위 10개 데이터 조회
Select * From REDPLUS131 Order By Ref Desc, RefOrder Asc Offset 0 Rows Fetch Next 10 Rows Only; 

-- 1개 페이지에 10(PageSize)개씩 출력 했을 때 2(2 - 1)번째(PageIndex, PageNum) 페이지 조회
Select * From REDPLUS131 Order By Ref Desc, RefOrder Asc 
Offset (2 - 1) * 10 Rows Fetch Next 10 Rows Only; 

-- 1개 페이지에 5(PageSize)개씩 출력 했을 때 3(3 - 1)번째(PageIndex, PageNum) 페이지 조회
Select * From REDPLUS131 Order By Ref Desc, RefOrder Asc 
Offset (3 - 1) * 5 Rows Fetch Next 5 Rows Only; 
Go

-- 페이징 처리 저장 프로시저
Create Proc GetBoardListData
	@PageNumber Int,
	@PageSize Int
As
	Select * From REDPLUS131 Order By Ref Desc, RefOrder Asc 
	Offset (@PageNumber - 1) * @PageSize Rows Fetch Next @PageSize Rows Only; 
Go
Execute GetBoardListData 1, 5
Go
Execute GetBoardListData 4, 5
Go
