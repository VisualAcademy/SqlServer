-- 해당 아티클 중 단일 아티클을 읽어오는 저장 프로시저: 상세 패턴
Create Procedure dbo.ArticlesGetArticleByNum
    @ArticleTableName NVarChar(50) = 'Articles',
    @Num Int = 0
As
    Declare @strSql NVarChar(Max)
    Set @strSql = '
        -- 해당 레코드 조회
        Select * From ' + @ArticleTableName + ' Where Num = @Num;    
    '
    Execute sp_executesql @strSql, N'@Num Int', @Num
Go

Exec ArticlesGetArticleByNum 'NewTable', 1
Go
