--[1]Northwind DB를 사용한 Inner Join 연습
Use Northwind

--[2]Orders테이블에서 검색
Select OrderID, CustomerID From Orders

--[3]Customers테이블에서 검색
Select CustomerID, ContactName, Address From Customers

--[4]위 두개의 테이블에서 CustomerID가 같은 레코드 중 검색
SELECT OrderID, ContactName, Address
FROM Orders INNER JOIN Customers 
ON Orders.CustomerID = Customers.CustomerID

--[5]위 조인문은 아래와 같이 줄여 쓸 수 있다.
SELECT OrderID, ContactName, Address
FROM Orders od INNER JOIN Customers cs 
ON od.CustomerID = cs.CustomerID
