-- �����ͺ��̽� ���
Use master
Go
-- �⺻ ���
Backup Database AdventureWorks
To BackupDev
Go
-- MIRROR TO / CHECKSUM
Backup Database AdventureWorks
To BackupDev
Mirror To MirrorDev
With Format, CHECKSUM
Go
-- ���� ��ȿ�� �˻�
Restore VerifyOnly From BackupDev With CHECKSUM
Go
Restore VerifyOnly From MirrorDev With CHECKSUM
Go

