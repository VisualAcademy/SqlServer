-- 테이블 변수(Table Variable)

-- 테이블 변수 선언
-- 배치 시작
Declare @Members Table
(
	MemberID Int Primary Key Not Null,
	MemberName VarChar(25) Not Null
);

Insert @Members Values(1, '홍길동');
Insert @Members Values(2, '백두산');
Insert @Members Values(3, '임꺽정');

Select MemberID, MemberName From @Members;
-- 배치 끝

-- 테이블 변수 선언
-- 배치 시작
Declare @Members2 Table
(
	MemberID Int Primary Key Not Null,
	MemberName VarChar(25) Not Null
);

Insert @Members2 Values(1, '홍길동');
Insert @Members2 Values(2, '백두산');
Insert @Members2 Values(3, '임꺽정');
Go -- 배치 끝

Select MemberID, MemberName From @Members2;
-- 배치 끝



