--[1] 시스템 및 SQL서버의 정보값 반환
--확장저장프로시저는 master 데이터베이스를 사용한다.
exec xp_msver

--[2] 명령 프롬프트내에서의 명령을 수행하고자 할 때
EXEC master..xp_cmdshell 'dir d:\'
EXEC master..xp_cmdshell 'vol'

--[3] net send명령어 실행하기
select @@servername
EXEC master..xp_cmdshell 'net send localhost 5분후에 시스템 점검을 합니다. 작성중인 작업을 정리하시기 바랍니다.'
