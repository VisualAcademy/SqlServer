-- 게시판 삭제: 게시판 정보(Boards), 퍼미션(Permission), 댓글(Comments), 메일링(MailList) => 동적 생성 테이블
Create Proc dbo.DeleteBoardAndData
	@TID Int,
	@BoardAlias NVarChar(25),
	@BoardTableName NVarChar(25)
As
	Begin Tran
		-- MailList 테이블에서 해당 레코드 삭제
		Delete From MailList Where TID = @TID;

		-- Permission 테이블에서 해당 레코드 삭제
		Delete From Permission Where TID = @TID;

		-- Comments 테이블에서 해당 레코드 삭제
		Delete Comments Where BoardName = @BoardAlias; 

		-- Boards 테이블에서 해당 레코드 삭제
		Delete Boards Where TID = @TID;

		-- 동적으로 생성된 게시판 테이블 자체 삭제
		Declare @dropSql NVarChar(Max)
		Set @dropSql = 'Drop Table ' + @BoardTableName + ';'
		Execute sp_executesql @dropSql 
	Commit Tran
Go

