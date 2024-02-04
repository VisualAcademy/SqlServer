--Use tempdb
--Go

-- OUTPUT 매개 변수를 사용하는 저장 프로시저 생성
Create Procedure OutputDemo
(
    @InputString NVarChar(100),
    @OutputString NVarChar(255) OUTPUT
)
As
    Set @OutputString = 'OUTPUT_' + @InputString
Go

---- OUTPUT 매개 변수를 사용하는 저장 프로시저 호출
--Declare @OutputResult NVarChar(255)
--Execute OutputDemo N'안녕하세요.', @OutputResult OUTPUT
--Print @OutputResult -- 'OUTPUT_안녕하세요.'
