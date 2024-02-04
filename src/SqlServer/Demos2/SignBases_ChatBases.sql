-- SignBases 테이블: 부모 테이블, Base => 테이블명Id
Create Table SignBases
(
	SignId Int Identity(1, 1) Primary Key Not Null,
	Email NVarChar(255) Not Null,
	Password NVarChar(255) Not Null
)
Go

-- ChatBases 테이블: 자식 테이블, Derived => Num 
Create Table ChatBases
(
	Num BigInt Identity(1, 1) Primary Key Not Null,
	Content NVarChar(Max) Not Null, 
	SignId Int Foreign Key References SignBases(SignId)
)
Go

-- 테이블 조회
Select * From SignBases
Select * From ChatBases

-- 샘플 데이터 입력
Insert Into SignBases (Email, Password) Values (N'a@a.com', N'password');
Insert Into ChatBases (Content, SignId) Values (N'안녕하세요.', 1);

-- 채팅 리스트
Select ChatBases.Num, SignBases.Email, ChatBases.Content 
From ChatBases Inner Join SignBases 
	On ChatBases.Num = SignBases.SignId;
