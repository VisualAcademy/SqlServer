-- OUTPUT 파라미터를 사용하는 저장 프로시저
--    두 수의 합을 구한 후 그 값을 반환

Create Proc Hap
	@First Int,
	@Second Int,
	@Result Int OUTPUT
As

	Set @Result = @First + @Second

Go

Declare @Result Int
Exec Hap 3, 5, @Result OUTPUT
Select @Result
Go

Declare @Result Int
Exec Hap 12, 34, @Result OUTPUT
Select @Result
Go
