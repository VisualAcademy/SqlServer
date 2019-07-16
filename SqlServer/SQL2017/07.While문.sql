Use tempdb
Go

--[1] 아래 구문을 100번 실행(F5)
Insert Memos Values('홍길동', 'h@h.com', '홍길동입니다.', GetDate())
Go

--[2] 아래 Insert문을 100번 실행 : While문
Declare @i Int
Set @i = 1 --[a] 초기식
While @i <= 100 --[b] 조건식 
Begin
	Insert Memos 
	Values('홍길동', 'h@h.com', '홍길동입니다.', GetDate())
	Set @i = @i + 1 --[c] 증감식
End
Go

--[3] 1부터 100까지 합
Declare @Num int, @Sum int
Set @Num = 0
Set @Sum = 0
While  1 = 1 --참일 동안 
Begin
	Set @Sum = @Sum + @Num  --1~100까지의 수 누적
	Set @Num = @Num + 1 -- @Num는 1씩 증가
	If @Num > 100	-- 100보다크면 While문 종료
		Break  -- 100까지만 계산
	Else -- @Num가 100보다 크지 않으면 계속 실행
		Continue
End
Print '1부터 100까지의 합'
Print @Sum
Go

--[4] (퀴즈)1부터 100까지 짝수의 합 : 2550
-- 정답은 아래 [5]번 구문 응용

--[5] 1부터 100까지 3의 배수 또는 4의 배수의 합을 구하는 프로그램

--[1] Input
Declare @sum Int
Declare @i Int
Set @sum = 0
--[2] Process
Set @i = 1							--[1] 초기식
While @i <= 100
Begin
	If @i % 3 = 0 Or @i % 4 = 0		--[3] 조건식
	Begin
		Set @sum = @sum + @i		--[4] 실행문
	End
	
	Set @i = @i + 1					--[2] 증감식
	
	If @i > 100						--[!] 멈춤/계속
		Break
	Else
		Continue 	
End
--[3] Output
Select @sum
Print @sum


