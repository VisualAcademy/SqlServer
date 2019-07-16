-- 데이터베이스 백업
Use master
Go
-- 기본 백업
Backup Database AdventureWorks
To BackupDev
Go
-- MIRROR TO / CHECKSUM
Backup Database AdventureWorks
To BackupDev
Mirror To MirrorDev
With Format, CHECKSUM
Go
-- 복원 유효성 검사
Restore VerifyOnly From BackupDev With CHECKSUM
Go
Restore VerifyOnly From MirrorDev With CHECKSUM
Go

