Use tempdb;

--[1] 변수 선언
Declare @num Int

--[2] 변수 초기화
Set @num = 11

--[3] If문을 사용한 조건 판단: 단문
If @num % 2 = 0
	Select '짝수입니다.'
Else
	Select '홀수입니다.'
;

--[4] 단문이 아니라 복문일 경우는 Begin~End 구문을 사용한다.
Declare @su Int
Set @su = 15
If @su % 2 = 0
	Begin
		Select '짝수'
		Select '짝수'
	End
Else
	Begin
		Select '홀수'
		Select '홀수'
	End
Go


