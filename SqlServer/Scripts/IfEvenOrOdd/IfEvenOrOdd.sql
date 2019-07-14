Use tempdb
Go

--[1] 변수 선언
Declare @testNum Int
--[2] 변수 초기화
Set @testNum = 10
--[3] 조건 출력
If (@testNum % 2) = 0 --모든수를 2로 나누었을 때 나머지가 0이면 짝수
	Select '짝수입니다.'
Else
	Select '홀수입니다.'
Go

-- 단문이 아니라 복문일 경우는 Begin~End 구문을 사용한다.
Declare @Num Int
Set @Num = 10
If @Num % 2 = 0
	Begin
		Select '짝수'
		Select '짝수'
	End
Else
	Begin
		Select '홀수'
	End
Go
