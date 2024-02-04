--[!] 테이블 제약조건

--[0] tempdb 사용
Use TempDB
Go

--[1] 실습용 테이블 생성 : 간단 한줄 공지사항(뉴스) 게시판
-- 글번호, 카테고리, 제목, 링크, 타겟, 작성일
Create Table Categories (
    CategoryID          --[!] 카테고리 일련번호 
        Int             --[0] 데이터 형식	 
        Identity(1, 1)  --[1] 자동증가값 : 1부터 1씩 증가 
        Primary Key,    --[2] 기본키(고유한 식별자(Identifier)) : 레코드 구분하는 유일한 값
                        --    기본키는 NOT NULL 포함, UNIQUE도 포함
    CategoryName        --[!] 카테고리 이름
        VarChar(25) 
        Not Null        --[3] 널값제약 : NOT NULL : 반드시 값 일력, NULL(널 허용)
)
Go 

Create Table dbo.FrontBoards (
    ItemID                                  --[!] 일련번호
        Int Identity(1, 1) Primary Key, 
    Title
        VarChar(150) Not Null
        Unique,                             --[4] 유일키제약 : 테이블에서 유일한 값(중복불가)
    Url VarChar(255)
        Null,                               --[5] 널 제약 : NULL : 값을 입력하지 않아도 무관
    [Target] VarChar(10) Null 
        Check (                             --[6] 체크제약 : 주어진 데이터만 입력 허용
            Target In('_top', '_blank', '_parent', '_self') 
        ),            
    CreatedDate DateTime
        Default(GetDate()),                 --[7] 기본값 제약 : 레코드 생성시 기본값 부여
    CategoryID Int
        References Categories(CategoryID)   --[8] 외래키 : 다른 테이블의 기본키와 동일한 값
)    
Go

--[1] 예시 데이터 입력 : 자동증가값 체크
Insert Into Categories Values('공지');
Insert Categories Values('뉴스');
Select * From Categories Order By CategoryID Asc

--[2] 기본값 제약조건
Insert Into FrontBoards 
Values('닷넷코리아', 'http://www.dotnetkorea.com', '_blank', Default,  1);
Insert Into FrontBoards(Title, Url, Target, CategoryID) 
Values('비주얼아카데미', 'http://www.VisualAcademy.com', '_self', 2);
Select * From FrontBoards

--[3] 널값 체크
--Insert Into FrontBoards(Url) Values('http://www.JavaCampus.com');

--[4] 유일키 제약조건 확인
--Insert Into FrontBoards 
--Values('닷넷코리아', 'http://www.dotnetkorea.com', '_blank', Default,  1);

--[5] 체크제약조건
--Insert Into FrontBoards 
--Values('자바캠퍼스', 'http://www.JavaCampus.com', '_main', Default,  1);

--[6] 외래키(Foreign Key) 
--Insert Into FrontBoards 
--Values('자바캠퍼스', 'http://www.JavaCampus.com', '_blank', Default,  3);