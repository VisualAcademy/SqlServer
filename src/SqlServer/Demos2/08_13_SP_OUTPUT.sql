-- OUTPUT �Ķ���͸� ����ϴ� ���� ���ν���
--    �� ���� ���� ���� �� �� ���� ��ȯ

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
