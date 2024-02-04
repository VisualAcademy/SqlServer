--[2] 상품 카테고리 리스트
CREATE Procedure ProductCategoryList
AS
    SELECT 
        CategoryId,
        CategoryName
    FROM 
        Categories
    ORDER BY 
        CategoryName ASC
Go

----[!] 테스트 : 모든 카테고리 리스트 출력
--Execute ProductCategoryList
--Go

--Exec ProductCategoryList
--Go
