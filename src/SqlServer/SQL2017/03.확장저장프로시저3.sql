--[1] �ý��� �� SQL������ ������ ��ȯ
--Ȯ���������ν����� master �����ͺ��̽��� ����Ѵ�.
exec xp_msver

--[2] ��� ������Ʈ�������� ����� �����ϰ��� �� ��
EXEC master..xp_cmdshell 'dir d:\'
EXEC master..xp_cmdshell 'vol'

--[3] net send��ɾ� �����ϱ�
select @@servername
EXEC master..xp_cmdshell 'net send localhost 5���Ŀ� �ý��� ������ �մϴ�. �ۼ����� �۾��� �����Ͻñ� �ٶ��ϴ�.'
