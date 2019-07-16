--[0] 실습용 테이블 생성
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
--[1] 트랜잭션을 시작
BEGIN TRAN
--[2] 테이블에 값을 INSERT 후 SELECT
INSERT FrontBoard VALUES('첫번째입력','첫번째입력','_blank',getdate())  --입력됨.
SELECT * FROM FrontBoard
--[3] 롤백해본 후 SELECT
ROLLBACK TRAN
SELECT * FROM FrontBoard  -- 입력된 값이 취소된다.

--[4] 다시 입력해본 후 COMMIT
BEGIN TRAN
INSERT FrontBoard VALUES('첫번째입력','첫번째입력','_blank',getdate())  --입력됨.
COMMIT TRAN
SELECT * FROM FrontBoard  -- 제대로 입력됨

--[5] UPDATE/DELETE문에는 반드시 트랜잭션 만들자.
BEGIN TRAN
	UPDATE ...
	DELETE ...
	SELECT ...
--COMMIT TRAN
ROLLBACK TRAN

