--[0] Pubs 데이터베이스 이용하기
Use Pubs
Go
/*
[1] authors테이블에서 state가 ‘CA’인 레코드의 
au_lname, au_fname, city, state 필드를 검색해오기
*/
Select au_lname, au_fname, city, state
From authors
Where state = 'CA'
--Group By
--Having
--Order By
Go
/*
[2] 위 Select문을 '캘리포니아검색'이라는 이름의 뷰로 생성
한글이름이나 키워드를 객체 이름으로 사용할 때는 대괄호([])로 사용 권장
*/
Create View [캘리포니아검색]
As
	Select au_lname, au_fname, city, state 
	From authors
	Where state = 'CA'
Go
--[3] 뷰 실행하기 : 일반 Select문처럼 사용
Select * From [캘리포니아검색]
Go
--[4] 뷰 수정하기 : 생성구문 암호화하기
Alter View [캘리포니아검색]
With Encryption
As
	Select au_lname, au_fname, city, state 
	From authors
	Where state = 'CA'
Go
--[5] 뷰 생성구문 보기 : "개체 주석을 암호화했습니다."
Exec sp_helptext [캘리포니아검색]
Go
--[6] 뷰 삭제하기
Drop View [캘리포니아검색]
Go