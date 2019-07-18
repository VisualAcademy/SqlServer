--[!] Exec 명령어: 동적 SQL문 실행
--[1] 변수 선언
Declare @query As NVarChar(255);
--[2] 변수에 값 초기화(SQL문)
-- Print '안녕하세요. 반갑습니다.';
Set @query = ' Print ''안녕하세요. 반갑습니다.'' ';
--[3] 변수의 들어있는 동적 SQL문 실행
--Execute(@query);
Exec(@query); -- 줄임 표현
