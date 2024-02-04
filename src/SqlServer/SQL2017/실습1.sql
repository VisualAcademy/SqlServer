--[0] 실습용 테이블 생성
CREATE TABLE dbo.FrontBoard
(
    ItemID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Title varchar(25) NULL,
    Url varchar(50) NULL,
    Target varchar(10) NULL 
		CHECK(Target IN('_top','_blank','_parent','_self')),
    CreatedDate datetime DEFAULT(GETDATE())
)
GO
--[2] 몇 개의 값을 넣음
INSERT FrontBoard VALUES('test1','test1','_blank',getdate())
Go
INSERT FrontBoard VALUES('test2','test2','_blank',getdate())
Go
