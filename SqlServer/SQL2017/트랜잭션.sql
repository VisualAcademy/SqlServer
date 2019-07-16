--[0] �ǽ��� ���̺� ����
USE tempdb
GO
CREATE TABLE dbo.FrontBoard
(
    ItemID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Title varchar(25) NULL,
    Url varchar(50) NULL,
    Target varchar(10) NULL CHECK(Target IN('_top','_blank','_parent','_self')),
    CreatedDate datetime DEFAULT(GETDATE())
)
GO
--[1] Ʈ������� ����
BEGIN TRAN
--[2] ���̺� ���� INSERT �� SELECT
INSERT FrontBoard VALUES('ù��°�Է�','ù��°�Է�','_blank',getdate())  --�Էµ�.
SELECT * FROM FrontBoard
--[3] �ѹ��غ� �� SELECT
ROLLBACK TRAN
SELECT * FROM FrontBoard  -- �Էµ� ���� ��ҵȴ�.

--[4] �ٽ� �Է��غ� �� COMMIT
BEGIN TRAN
INSERT FrontBoard VALUES('ù��°�Է�','ù��°�Է�','_blank',getdate())  --�Էµ�.
COMMIT TRAN
SELECT * FROM FrontBoard  -- ����� �Էµ�

--[5] UPDATE/DELETE������ �ݵ�� Ʈ����� ������.
BEGIN TRAN
	UPDATE ...
	DELETE ...
	SELECT ...
--COMMIT TRAN
ROLLBACK TRAN

