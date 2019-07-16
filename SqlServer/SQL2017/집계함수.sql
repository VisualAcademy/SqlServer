USE pubs
GO

SELECT COUNT(*) AS [판매테이블레코드수] FROM sales
SELECT SUM(qty) AS [판매개수합계] FROM sales
SELECT AVG(qty) AS [판매개수평균] FROM sales
SELECT MAX(qty) AS [판대최대개수] FROM sales
SELECT MIN(qty) AS [판매최소개수] FROM sales

