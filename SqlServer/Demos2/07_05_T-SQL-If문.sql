Use tempdb;

--[1] ���� ����
Declare @num Int

--[2] ���� �ʱ�ȭ
Set @num = 11

--[3] If���� ����� ���� �Ǵ�: �ܹ�
If @num % 2 = 0
	Select '¦���Դϴ�.'
Else
	Select 'Ȧ���Դϴ�.'
;

--[4] �ܹ��� �ƴ϶� ������ ���� Begin~End ������ ����Ѵ�.
Declare @su Int
Set @su = 15
If @su % 2 = 0
	Begin
		Select '¦��'
		Select '¦��'
	End
Else
	Begin
		Select 'Ȧ��'
		Select 'Ȧ��'
	End
Go


