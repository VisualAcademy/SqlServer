--[0] tempdb�� �׽�Ʈ�� ���̺� ���� �� ������ �Է�
USE tempdb
GO

--DROP TABLE Orders
CREATE TABLE dbo.Orders
(
	[��ǰ��] VarChar(10),
	[�ǸŰ���] Int
)
GO

INSERT Orders VALUES('RADIO',5)
INSERT Orders VALUES('TV',3)
INSERT Orders VALUES('AUDIO',1)
INSERT Orders VALUES('DVD',7)
INSERT Orders VALUES('RADIO',3)
INSERT Orders VALUES('DVD',8)
INSERT Orders VALUES('TV',10)

--[1] �����Լ� ��� �˻�
SELECT * FROM Orders
SELECT Count([�ǸŰ���]) AS [���Ǹ�Ƚ��] FROM Orders  --7
SELECT Sum([�ǸŰ���]) AS [���ǸŰ���] FROM Orders  --37
SELECT Avg([�ǸŰ���]) AS [���Ǹ����] FROM Orders  --5
SELECT Max([�ǸŰ���]) AS [�ִ��ǸŰ���] FROM Orders  --10
SELECT Min([�ǸŰ���]) AS [�ּ��ǸŰ���] FROM Orders  --1

--[2] �Ʒ� ������ ������Ѻ��� ������ ���� ������ ��Ÿ����.
--Orders.��ǰ��' ���� ���� �Լ��� ���� GROUP BY ���� �����Ƿ� SELECT ��Ͽ��� ����� �� �����ϴ�.
SELECT [��ǰ��], AVG([�ǸŰ���]) AS [���Ǹ����] FROM Orders

--[3] ���� ���� �����Լ��� ���Ǿ����� �ʰ� �׷�ȭ�Ǿ� ��½�ų �ʵ�� �ݵ�� GROUP BY���� ����Ͽ����Ѵ�.
SELECT [��ǰ��], AVG([�ǸŰ���]) AS [���Ǹ����] 
FROM Orders
GROUP BY [��ǰ��]

--[4] ���� �׷캰 �� �Ǹ������ 5�̻��ΰ͸� ����ϰ��� �� ������ HAVING���� ������ �߰��Ͽ����Ѵ�.
SELECT [��ǰ��], SUM([�ǸŰ���]) AS [���Ǹ��հ�], AVG([�ǸŰ���]) AS [���Ǹ����] 
FROM Orders
GROUP BY [��ǰ��]
HAVING AVG([�ǸŰ���]) >= 5  --�ǸŰ����� ����� 5�̻��ΰ͸� �˻�
Order By [��ǰ��] Asc

--[5] ���� : �� �ֹ��� ��ǰ �Ǹŷ��� 5�̻��̰�, �׷캰 �� �Ǹ������ 7�̻��ΰ͸� [��ǰ��]�� �������� �����ؼ� ����Ͻÿ�.
Select [��ǰ��], Sum([�ǸŰ���]) As [�Ǹ��հ�]
From Orders
Where [�ǸŰ���] >= 5
Group By [��ǰ��]
Having Sum([�ǸŰ���]) >= 7
Order By [��ǰ��] Asc
