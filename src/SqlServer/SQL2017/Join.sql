--[1]Northwind DB�� ����� Inner Join ����
Use Northwind

--[2]Orders���̺��� �˻�
Select OrderID, CustomerID From Orders

--[3]Customers���̺��� �˻�
Select CustomerID, ContactName, Address From Customers

--[4]�� �ΰ��� ���̺��� CustomerID�� ���� ���ڵ� �� �˻�
SELECT OrderID, ContactName, Address
FROM Orders INNER JOIN Customers 
ON Orders.CustomerID = Customers.CustomerID

--[5]�� ���ι��� �Ʒ��� ���� �ٿ� �� �� �ִ�.
SELECT OrderID, ContactName, Address
FROM Orders od INNER JOIN Customers cs 
ON od.CustomerID = cs.CustomerID
