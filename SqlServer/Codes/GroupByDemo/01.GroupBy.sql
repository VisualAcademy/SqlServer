--[0] tempdb에 테스트용 테이블 생성 및 데이터 입력
USE tempdb
GO

--DROP TABLE Orders
CREATE TABLE dbo.Orders
(
	[상품명] VarChar(10),
	[판매개수] Int
)
GO

INSERT Orders VALUES('RADIO',5)
INSERT Orders VALUES('TV',3)
INSERT Orders VALUES('AUDIO',1)
INSERT Orders VALUES('DVD',7)
INSERT Orders VALUES('RADIO',3)
INSERT Orders VALUES('DVD',8)
INSERT Orders VALUES('TV',10)

--[1] 집계함수 사용 검색
SELECT * FROM Orders
SELECT Count([판매개수]) AS [총판매횟수] FROM Orders  --7
SELECT Sum([판매개수]) AS [총판매개수] FROM Orders  --37
SELECT Avg([판매개수]) AS [총판매평균] FROM Orders  --5
SELECT Max([판매개수]) AS [최대판매개수] FROM Orders  --10
SELECT Min([판매개수]) AS [최소판매개수] FROM Orders  --1

--[2] 아래 구문을 실행시켜보면 다음과 같은 에러가 나타난다.
--Orders.상품명' 열이 집계 함수에 없고 GROUP BY 절이 없으므로 SELECT 목록에서 사용할 수 없습니다.
SELECT [상품명], AVG([판매개수]) AS [총판매평균] FROM Orders

--[3] 위와 같이 집계함수로 계산되어지지 않고 그룹화되어 출력시킬 필드는 반드시 GROUP BY절에 기록하여야한다.
SELECT [상품명], AVG([판매개수]) AS [총판매평균] 
FROM Orders
GROUP BY [상품명]

--[4] 만약 그룹별 총 판매평균이 5이상인것만 출력하고자 할 때에는 HAVING절에 조건을 추가하여야한다.
SELECT [상품명], SUM([판매개수]) AS [총판매합계], AVG([판매개수]) AS [총판매평균] 
FROM Orders
GROUP BY [상품명]
HAVING AVG([판매개수]) >= 5  --판매개수의 평균이 5이상인것만 검색
Order By [상품명] Asc

--[5] 퀴즈 : 각 주문별 상품 판매량이 5이상이고, 그룹별 총 판매평균이 7이상인것만 [상품명]에 오름차순 정렬해서 출력하시오.
Select [상품명], Sum([판매개수]) As [판매합계]
From Orders
Where [판매개수] >= 5
Group By [상품명]
Having Sum([판매개수]) >= 7
Order By [상품명] Asc
