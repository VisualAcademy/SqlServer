--�ε��� ����
exec sp_helpindex employees
select * from employees where lastname like 'da%'
select * from employees where lastname like '%io'
select * from employees where lastname like '%io%'

use pubs
create index qty on sales(qty)
go

-- ����� �� �������?
select * from sales where qty + 1 > 20
select * from sales where qty > 20 - 1
