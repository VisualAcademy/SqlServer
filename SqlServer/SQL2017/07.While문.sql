Use tempdb
Go

--[1] �Ʒ� ������ 100�� ����(F5)
Insert Memos Values('ȫ�浿', 'h@h.com', 'ȫ�浿�Դϴ�.', GetDate())
Go

--[2] �Ʒ� Insert���� 100�� ���� : While��
Declare @i Int
Set @i = 1 --[a] �ʱ��
While @i <= 100 --[b] ���ǽ� 
Begin
	Insert Memos 
	Values('ȫ�浿', 'h@h.com', 'ȫ�浿�Դϴ�.', GetDate())
	Set @i = @i + 1 --[c] ������
End
Go

--[3] 1���� 100���� ��
Declare @Num int, @Sum int
Set @Num = 0
Set @Sum = 0
While  1 = 1 --���� ���� 
Begin
	Set @Sum = @Sum + @Num  --1~100������ �� ����
	Set @Num = @Num + 1 -- @Num�� 1�� ����
	If @Num > 100	-- 100����ũ�� While�� ����
		Break  -- 100������ ���
	Else -- @Num�� 100���� ũ�� ������ ��� ����
		Continue
End
Print '1���� 100������ ��'
Print @Sum
Go

--[4] (����)1���� 100���� ¦���� �� : 2550
-- ������ �Ʒ� [5]�� ���� ����

--[5] 1���� 100���� 3�� ��� �Ǵ� 4�� ����� ���� ���ϴ� ���α׷�

--[1] Input
Declare @sum Int
Declare @i Int
Set @sum = 0
--[2] Process
Set @i = 1							--[1] �ʱ��
While @i <= 100
Begin
	If @i % 3 = 0 Or @i % 4 = 0		--[3] ���ǽ�
	Begin
		Set @sum = @sum + @i		--[4] ���๮
	End
	
	Set @i = @i + 1					--[2] ������
	
	If @i > 100						--[!] ����/���
		Break
	Else
		Continue 	
End
--[3] Output
Select @sum
Print @sum


