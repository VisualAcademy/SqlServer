--Use tempdb
--Go

-- OUTPUT �Ű� ������ ����ϴ� ���� ���ν��� ����
Create Procedure OutputDemo
(
    @InputString NVarChar(100),
    @OutputString NVarChar(255) OUTPUT
)
As
    Set @OutputString = 'OUTPUT_' + @InputString
Go

---- OUTPUT �Ű� ������ ����ϴ� ���� ���ν��� ȣ��
--Declare @OutputResult NVarChar(255)
--Execute OutputDemo N'�ȳ��ϼ���.', @OutputResult OUTPUT
--Print @OutputResult -- 'OUTPUT_�ȳ��ϼ���.'
