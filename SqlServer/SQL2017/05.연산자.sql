--[0] 산술연산자
Select 3 + 4
Select 3 - 4
--[1] %연산자 : 나머지 연산자라고도 함
Select 3 % 4 -- 3 나누기 4를 했을 경우. 몫 : 0, 나머지 : 3, 이 때 나머지값 반환

--[2] 문자열 연결연산 : '+' 연산자 사용
Select '안녕' + '하세요' --안녕하세요

--[3] 비교
-- >, >=, <, <=
Select * From Memos Where  3 > 4 -- 조건이 거짓
Go
-- 같은지(=), 다른지(<>)
Select * From Memos Where 3 = 4 -- 조건이 거짓
Go
Select * From Memos Where 3 <> 4 -- 조건이 참
Go
-- 기교성 코드(?) : 무조건 실행 : SQL 인젝션(해킹)
Select * From Memos Where 1 = 1
Go

--[4] 논리
-- Or(||) : 하나라도 참이면, 참
Select * From Memos Where (3 = 4) Or (3 <> 4) -- 거짓 Or 참 -> 참
Go
-- And(&&) : 둘 다 참일때에만, 참
Select * From Memos Where (3 = 4) And (3 <> 4) -- 거짓 And 참 -> 거짓
Go

--[5] Null 값 체크
--[A] 테이블 생성
Create Table NullTest
(
	Name VarChar(25) Not Null,
	Age Int Null
)
Go
--[B] 데이터 입력
Insert Into NullTest Values('홍길동', 21)
Insert Into NullTest Values('백두산', NULL)
Insert Into NullTest(Name) Values('임꺽정')
--[C] 조건 출력
-- 나이가 있는 사람 출력 : Is Not Null, <> 사용불가
Select * From NullTest Where Age Is Not Null
-- 나이가 기록되지 않은 데이터 출력, = 사용불가
Select * From NullTest Where Age Is Null
