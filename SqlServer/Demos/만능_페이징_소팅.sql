---- 페이징, 소팅, 정렬

---- 테스트 테이블 생성
--Create Table Tables
--(
--    Id Int Identity(1,1),
--    Name NVarChar(50),
--    Title Varchar(20)
--)
--GO

---- 테스트 데이터 넣기
--Insert IntO Tables
--VALUES
--    ('NAME' + Convert(varchar(10),@@Identity),'FAMIL' + Convert(varchar(10),@@Identity))
--GO 

---- 데이터 보기 
--Select Count(*) From Tables
--Go


----<시작> 만능 페이징 
--DECLARE @PageNumber Int = 1                 -- 몇번째 페이지를 보여줄건지(1 페이지 ~ n페이지)
--DECLARE @PageSize Int = 10                  -- 한 페이지에 표시할 크기 
--DECLARE @SortByField Int = 1                -- 정렬할 컬럼 순서(1, 2, 3 컬럼 순서)
--DECLARE @SortOrder NVarChar(255) = 'ASC'    -- ASC 또는 DESC
--DECLARE @FilterType NVarChar(255) = 'None'  -- 필터 종류: (None/Contain/NotContain/Match/NotMatch/True/False/)
--DECLARE @FilterValue NVarChar(255) = '10'   -- 어떤 값을 검색할건지? 
--DECLARE @FilterColumn Int = 1               -- 어떤 컬럼에서 검색을 할건지 지정

--;WITH
--  Tables_Filterings
--  AS
--  (  
--    SELECT 
--      *  
--    FROM Tables
--    WHERE
--      ( -- 필터 로직 적용 부분
--        CASE
--          WHEN @FilterType = 'None' THEN 1


--          -- Id 컬럼 필터링
--          WHEN @FilterType = 'Contain' AND @FilterColumn = 1
--            AND ( -- 필터값(FilterValue)이 빈값이면 모든 값 검색
--                Tables.Id LIKE '%' + @FilterValue + '%'
--               OR
--                @FilterValue = ''
--               ) THEN 1
--          WHEN @FilterType = 'NotContain' AND @FilterColumn = 1
--            AND ( -- 필터값(FilterValue)이 빈값이면 모든 값 검색
--                Tables.Id NOT LIKE '%' + @FilterValue + '%'
--               OR
--                @FilterValue = ''
--               ) THEN 1
--          WHEN @FilterType = 'Match' AND @FilterColumn = 1
--            AND Tables.Id = @FilterValue THEN 1
--          WHEN @FilterType = 'NotMatch' AND @FilterColumn = 1
--            AND Tables.Id <> @FilterValue THEN 1               


--          -- Name 컬럼 필터링
--          WHEN @FilterType = 'Contain' AND @FilterColumn = 2
--            AND ( -- 필터값(FilterValue)이 빈값이면 모든 값 검색
--                Tables.Name LIKE '%' + @FilterValue + '%'
--               OR
--                @FilterValue = ''
--               ) THEN 1
--          WHEN @FilterType = 'NotContain' AND @FilterColumn = 2
--            AND ( -- 필터값(FilterValue)이 빈값이면 모든 값 검색
--                Tables.Name NOT LIKE '%' + @FilterValue + '%'
--               OR
--                @FilterValue = ''
--               ) THEN 1
--          WHEN @FilterType = 'Match' AND @FilterColumn = 2
--            AND Tables.Name = @FilterValue THEN 1
--          WHEN @FilterType = 'NotMatch' AND @FilterColumn = 2
--            AND Tables.Name <> @FilterValue THEN 1         


--         -- Title 컬럼 필터링
--         WHEN @FilterType = 'Contain' AND @FilterColumn = 3
--            AND ( -- 필터값(FilterValue)이 빈값이면 모든 값 검색
--                Tables.Title LIKE '%' + @FilterValue + '%'
--               OR
--                @FilterValue = ''
--               ) THEN 1
--          WHEN @FilterType = 'NotContain' AND @FilterColumn = 3
--            AND ( -- 필터값(FilterValue)이 빈값이면 모든 값 검색
--                Tables.Title NOT LIKE '%' + @FilterValue + '%'
--               OR
--                @FilterValue = ''
--               ) THEN 1
--          WHEN @FilterType = 'Match' AND @FilterColumn = 3
--            AND Tables.Title = @FilterValue THEN 1
--          WHEN @FilterType = 'NotMatch' AND @FilterColumn = 3
--            AND Tables.Title <> @FilterValue THEN 1    


--        END
--      ) = 1         
--  )

--SELECT 
--  Tables_Pagings.Id,
--  Tables_Pagings.Name,
--  Tables_Pagings.Title
--FROM Tables_Filterings AS Tables_Pagings
--ORDER BY 
--    CASE WHEN @SortByField = 1 AND @SortOrder = 'ASC'
--        THEN Tables_Pagings.Id END ASC,
--    CASE WHEN @SortByField = 1 AND @SortOrder = 'DESC'
--        THEN Tables_Pagings.Id END DESC,
--    CASE WHEN @SortByField = 2 AND @SortOrder = 'ASC'
--        THEN Tables_Pagings.Name END ASC,
--    CASE WHEN @SortByField = 2 AND @SortOrder = 'DESC'
--        THEN Tables_Pagings.Name END ASC,
--    CASE WHEN @SortByField = 3 AND @SortOrder = 'ASC'
--        THEN Tables_Pagings.Title END ASC,
--    CASE WHEN @SortByField = 3 AND @SortOrder = 'DESC'
--        THEN Tables_Pagings.Title END ASC
--OFFSET @PageSize * (@PageNumber - 1) ROWS FETCH NEXT @PageSize ROWS ONLY;
----</종료>

