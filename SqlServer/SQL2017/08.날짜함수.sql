--[1] GETDATE()
SELECT GETDATE()  --GETDATE() : 현재 시스템 날짜와 시간을 반환

--[2] YEAR(), MONTH(), DAY()
SELECT YEAR(GETDATE()) AS '년', MONTH(GETDATE()) AS '월', DAY(GETDATE()) AS '일'

--[3]DATEDIFF() : 마지막 날짜에서 시작 날짜의 차이를 DATEPART 형태로 반환
SELECT DATEDIFF(DD, GETDATE(), '20031225') --2003년 크리스마스가 며칠남았는지?
