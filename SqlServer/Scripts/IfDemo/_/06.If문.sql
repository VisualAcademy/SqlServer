Use tempdb
Go

--[1] ���� ����
Declare @testNum Int
--[2] ���� �ʱ�ȭ
Set @testNum = 10
--[3] ���� ���
If (@testNum % 2) = 0 --������ 2�� �������� �� �������� 0�̸� ¦��
	Select '¦���Դϴ�.'
Else
	Select 'Ȧ���Դϴ�.'
Go

-- �ܹ��� �ƴ϶� ������ ���� Begin~End ������ ����Ѵ�.
Declare @Num Int
Set @Num = 10
If @Num % 2 = 0
	Begin
		Select '¦��'
		Select '¦��'
	End
Else
	Begin
		Select 'Ȧ��'
	End
Go