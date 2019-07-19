--[1] 전체 레코드 출력
Select Count(*) From Zip
Go

--[2] Ctrl+L : 예상 실행 계획 : Full Scan : 모두 훑어보기
Select * From Zip Where Dong Like '%역삼%' -- 50%
Go
Select * From Zip Where Dong Like '역삼%' -- 50%
Go

--[3] SQL Server에서 최고의 성능향상 : 인덱스
-- Dong 필드는 자주 검색에 사용되더라... 그러면, 인덱스를 걸자.
Create Index idxZip On Zip(Dong) -- 기본 : NonClustered Index : 책의 찾아보기(뒷부분)
Go

--[4] Ctrl+L : 예상 실행 계획
-- %로 시작해서 Like절 사용하면 인덱스의 영향을 받지 않는다.
Select * From Zip Where Dong Like '%역삼%' -- 60%
Go
Select * From Zip Where Dong Like '역삼%'  -- 40%
Go

--[5] 인덱스를 삭제
Drop Index idxZip On Zip
Go

--[6] Clustered Index로 다시 생성
Create Clustered Index idxZip On Zip(Dong) -- Clustered Index : 책의 차례/목차(앞)
Go

--[7] Ctrl+L : 예상 실행 계획
Select * From Zip Where Dong Like '%역삼%' -- 99%, Index Scan
Go
Select * From Zip Where Dong Like '역삼%'  -- 1%, Index Seek
Go



