-- Num를 받아서 해당 Num의 Ref 값과 Step이 1에 해당하는 레코드 집합 조회
Create Procedure dbo.ArticlesGetChildAritlcesByRefAndNum
    @ArticleTableName NVarChar(50) = 'Articles',
    @Num Int = 0     
As
    Declare @RefResult Int
    Declare @sql NVarChar(Max)
    Set @sql = '        
        Select @Ref = Ref From ' + @ArticleTableName + ' Where Num = @Num;
    '
    Execute sp_executesql @sql, N'@Num Int, @Ref Int Output', @Num, @Ref = @RefResult Output 
    
    Set @sql = '        
        Select * From ' + @ArticleTableName + ' Where Ref = @Ref And Step = 1;
    '
    Execute sp_executesql @sql, N'@Ref Int', @RefResult
Go

--Exec ArticlesGetChildAritlcesByRefAndNum 'NewTable', 7
--Go
