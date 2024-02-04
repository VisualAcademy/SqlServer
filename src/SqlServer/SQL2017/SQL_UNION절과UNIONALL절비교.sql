/* SQL Server UNION vs. UNION ALL절 비교 */
/*
	- 하나 이상의 테이블을 묶어서 마치 하나의 테이블인것처럼 모아서 출력
	- 2개 이상의 테이블로 이루어진 게시판에서 데이터를 읽어와서 
	  하나의 리스트로 보여주고자할 때 주로 사용
*/

/* 임시 테이블 생성 및 데이터 입력 */
Declare @Table1 TABLE(Num Int);
	Insert Into @Table1 Values(1);
	Insert Into @Table1 Values(2);
	Insert Into @Table1 Values(3);
	Insert Into @Table1 Values(4);
	Insert Into @Table1 Values(5);
Declare @Table2 TABLE(Num Int);
	Insert Into @Table2 Values(3);
	Insert Into @Table2 Values(4);
	Insert Into @Table2 Values(5);
	Insert Into @Table2 Values(6);
	Insert Into @Table2 Values(7);

/* UNION절 실행 : Distinct Sort 진행 */ 
  Select Num As 'UNION절 실행' From @Table1
  UNION
  Select Num From @Table2
  ;
/* UNION All절 실행 */ 
  Select Num AS 'UNION ALL절 실행' From @Table1
  UNION ALL
  Select Num From @Table2
  ;



