--[1] GETDATE()
SELECT GETDATE()  --GETDATE() : ���� �ý��� ��¥�� �ð��� ��ȯ

--[2] YEAR(), MONTH(), DAY()
SELECT YEAR(GETDATE()) AS '��', MONTH(GETDATE()) AS '��', DAY(GETDATE()) AS '��'

--[3]DATEDIFF() : ������ ��¥���� ���� ��¥�� ���̸� DATEPART ���·� ��ȯ
SELECT DATEDIFF(DD, GETDATE(), '20031225') --2003�� ũ���������� ��ĥ���Ҵ���?
