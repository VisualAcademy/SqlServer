-- 동일한 Ref 열을 갖는 레코드 집합을 가져오는 저장 프로시저
Create Procedure dbo.ArticlesGetAritlcesByRefNumber
    @ArticleTableName NVarChar(50) = 'Articles',
    @Ref Int = 0
As
    Declare @query NVarChar(Max)
    Set @query = '
        -- Ref가 같은 레코드 집합 조회
        Select * From ' + @ArticleTableName + ' Where Ref = ' + Cast(@Ref As NVarChar) + ';
    '
    Exec(@query)
Go

--Exec ArticlesGetAritlcesByRefNumber 'NewTable', 8
--Go
