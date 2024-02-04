--[1] 2. SELECT(검색) 문
--정의) Select FieldNameList From TableName [Where 조건] [Order By 정렬시킬필드명 [ASC | DESC]]

--[2] 시스템 정보를 얻어오기(시스템 함수 사용)
-- 현재 서버의 이름을 검색
Select @@servername
Go
-- 현재 서버의 버전을 검색
Select @@version
Go

--[3] Memos의 모든 필드 검색.
Select Num, Name, Email, Title, PostDate From Memos
Go
-- Memos의 모든 필드 검색('*' 와일드문자 사용 : 모든 것).
Select * From Memos
Go

--참고) 시간차 주기 : WAITFOR(몰라도 상관 없음)
BEGIN
	SELECT * FROM Memos
	WAITFOR DELAY '000:00:05'
END

--[4] Memos에서 Name필드와 PostDate필드만 검색
Select [Name], PostDate From Memos
Go

--[5] 조건검색 : Name이 홍길동인 사람의 모든 것 검색.
Select * From Memos Where Name = '홍길동'
Go

-- 조건검색 : Name이 홍길동이 아닌 사람의 Num, Email만 검색.
Select Num, Email From Memos Where Name <> '홍길동'
Go

--[6] 조검검색 : Name이 '홍'으로 시작하는 사람의 모든 것 검색.
--      '%' 와일드 문자 사용. % -> 모든것... / Like 키워드 사용.
Select * From Memos Where Name Like '홍%'
Go  

-- 조검검색 : Name에 '길'자가 들어가는 사람의 모든 것 검색.
Select * From Memos Where Name Like '%길%'
Go

-- 조검검색 : Name이 '산'자로 끝나는 사람의 모든 것 검색.
Select * From Memos Where Name Like '%산' 
Go

--퀴즈) 이름이 '동'자로 끝나는 사람의 Name과 Email만 검색.
Select Name, Email From Memos Where Name Like '%동'
Go

--[7] 조검검색 : Memos테이블에서 Name이 '홍'자로 시작하고, 
--[그리고 | 또는], Email에 'h'자가 들어가는 사람의 모든 것 검색.
-- AND 연산자 사용. : 둘 다 참인 조건
Select * From Memos Where Name Like '홍%' AND Email Like '%h%'
Go

-- OR 연산자 사용.  : 둘 중 하나라도 참인 조건
Select * From Memos Where Name Like '홍%' OR Email Like '%h%'
Go

--[8] 정렬검색 : Num의 역순(내림차순)으로 정렬.
--	오름차순 정렬(ASCending) = 1,2,3 순서대로...(기본값)
--	내림차순 정렬(DESCending) = 3,2,1 순서대로...
Select * From Memos Order By Num DESC
Go
-- 정렬검색 : Name 필드를 오름차순으로 정렬.
Select * From Memos Order By Name ASC -- ASC는 생략가능.
Go
-- 다중 정렬 검색 : Name 필드의 역순, 이메일의 정순
Select *
From Memos
--Where
Order By 
	Name Desc, Email Asc
Go

--퀴즈) Name에 '길'자가 들어가는 사람의 Name과 Email를 Num의 역순으로 검색해라.
Select Name, Email From Memos Where Name Like '%길%' Order By Num DESC
Go

--[9] 상위 5개 레코드만 검색.(Top N)
Select Top 5 * From Memos Order By Num DESC
Go

--[10] 해당 테이블의 전체 레코드 수 반환
Select Count(*) From Memos
Go

Select Count(Num) From Memos
Go

-- 실행결과를 별칭을 주어서 출력 As 구문 사용
Select Count(*) As [전체레코드수] From Memos
Go

--참고) Memos 테이블에 있는 상위 5개 자료를 XML로 출력
Select Top 5 * From Memos FOR XML AUTO
Go

--참고) 전세계 유일한 문자열 값을 출력시켜주는 함수
Select NewId() -- GUID
Go