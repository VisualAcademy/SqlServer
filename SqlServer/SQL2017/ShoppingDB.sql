-- ===================================================================
-- RedPlus ShoppingMall V2.0
-- ===================================================================

-- ===================================================================
-- create the new database
-- ===================================================================

--CREATE DATABASE Commerce
--GO

--USE Commerce
--GO

-- ===================================================================
-- create the new tables
-- ===================================================================

--[1] 카테고리
CREATE TABLE dbo.Categories
(
    CategoryID Int IDENTITY(1, 1) NOT NULL Primary Key,	--카테고리번호
    CategoryName VarChar(50),				--카테고리명
    SuperCategory Int Null,				--부모카테고리번호
    Align SmallInt Default(0)				--카테고리보여지는순서
)
GO

--[2] 상품
CREATE TABLE dbo.Products 
(
	ProductID Int IDENTITY(1, 1) NOT NULL ,     --상품고유코드
	CategoryID Int NOT NULL ,               --카테고리번호
	ModelNumber VarChar(50) ,               --모델번호
	ModelName VarChar(50) ,               --모델명(상품명)
	Company VarChar(50),               --제조회사
	OriginPrice Int Null,               --원가
	SellPrice Int Null,                    --판매가
	EventName VarChar(50) Null,               --신,히트,기획,...
	ProductImage VarChar(50) ,               --이미지명
	Explain VarChar(400),               --요약설명
	Description Text Null,--VarChar(4000)     --상세설명
	Encoding VarChar(10) Null,               --인코딩(Text/HTML)
	ProductCount Int Null,               --재고수량
	RegistDate DateTime Default(GetDate()),     --상품등록일
	Mileage Int Null,                    --마일리지
	Absence Int Null                    --품절여부
)
GO 

--[3] 상품평
CREATE TABLE dbo.Reviews 
(
	ReviewID Int IDENTITY(1, 1) Primary Key NOT NULL, 	--고유일련번호
	ProductID Int NOT NULL,					--상품번호
	CustomerName VarChar(50),				--고객명
	CustomerEmail VarChar(50),				--고객이메일
	Rating TinyInt NOT NULL,					--점수
	Comments VarChar(3850),					--내용
	AddDate SmallDateTime Default(GetDate()) 		--작성일
)
GO

--[4] 장바구니
CREATE TABLE dbo.ShoppingCart 
(
    RecordID Int IDENTITY(1, 1) Primary Key NOT NULL, 	--쇼핑카트 고유번호
    CartID VarChar(50),					--카트번호(고객구분번호) : 유일한 값
    ProductID Int NOT NULL,				--상품고유번호(상품명, 가격, 마일리지, ...)
    Quantity Int NOT NULL,				--수량
    DateCreated DateTime Default(GetDate())		--카트 생성일
)
GO

--[5] 고객
CREATE TABLE dbo.Customers 
(
	CustomerID Int IDENTITY(1, 1) NOT NULL Primary Key,	--고객 고유 번호
	CustomerName VarChar(50),				--고객명(회원/비회원)
	Phone1 VarChar(4),					--전화번호1
	Phone2 VarChar(4),					--전화번호2
	Phone3 VarChar(4),					--전화번호3
	Mobile1 VarChar(4),					--휴대폰1
	Mobile2 VarChar(4),					--휴대폰2
	Mobile3 VarChar(4),					--휴대폰3
	Zip VarChar(7) Null,         				--우편번호
	Address VarChar(100) Null,   				--주소
	AddressDetail VarChar(100) Null,			--주소 상세
	Ssn1 VarChar(6) Null,					--주민번호 앞자리
	Ssn2 VarChar(7) Null,					--주민번호 뒷자리
	EmailAddress VarChar(50),				--이메일
	MemberDivision Int					--회원구분(0:비회원,1:회원)
)
GO

--[6] 회원
CREATE TABLE dbo.MemberShip
(
	CustomerID Int Not Null,		--고객번호
	UserID VarChar(25) Not Null,		--아이디
	Password VarChar(100) Not Null,		--비밀번호
	BirthYear VarChar(4) Null,		--년
	BirthMonth VarChar(2) Null,		--월
	BirthDay VarChar(2) Null,		--일
	BirthStatus VarChar(2) Null,		--생일구분
	Gender Int Null,			--성별
	Job VarChar(20) Null,			--직업
	Wedding Int Null, 			--결혼여부
	Hobby VarChar(100) Null,		--취미
	Homepage VarChar(100) Null,		--홈페이지
	Intro VarChar(400) Null,    		--소개
	Mailing Int Null, 			--메일수신여부
	VisitCount Int Default 0,             	--방문횟수
	LastVisit DateTime Default GetDate(),	--마지막방문일시
	Mileage Int Null,			--마일리지     
	JoinDate DateTime Default GetDate()	--가입일자
)
Go

--[7] 우편번호
--Drop Table dbo.Zip
CREATE TABLE dbo.Zip 
(
	ZipCode VarChar(7) Not Null,	--우편번호
	Si VarChar(50) NULL,		--시도
	Gu VarChar(50) NULL,		--구군
	Dong VarChar(50) NULL,		--동면
	PostEtc VarChar(50) NULL 	--나머지
)
Go

--Zip.txt에서 DTS를 사용해서 Zip 테이블로 데이터 이동

-- 우편번호 검색기에서 사용할만한 구문
--Select * From Zip 
--Where 
	--Si Like '안양%' 
	--Or 
	--Gu Like '안양%' 
	--Or 
--	Dong Like '안양%'
--Go

-- 우편번호 테이블에서 '동이름'으로 검색 : Ctrl + L
--Select * From Zip1 Where Dong Like '%안양%'
--Go
--Select * From Zip1 Where Dong Like '안양%'
--Go
--Select * From Zip1 Where Dong Like '안양'
--Go

-- Index(인덱스)를 적용하여 쿼리 실행 능력 향상
--검색 결과가 여러개인 경우 : 클러스터드
--Select * From Zip1 Where Dong Like '안양%'
--Go
--Select * From Zip2 Where Dong Like '안양%'
--Go

--[!] Zip1테이블의 Dong필드에 클러스터드 인덱스 생성
--Create Clustered Index idxZip On Zip1(Dong)
--Go

--검색 결과가 하나인 경우 : 넌클러스터드
--Select * From Products Where ProductID = 1

--[8] 주문
CREATE TABLE dbo.Orders 
(
	OrderID Int IDENTITY (1, 1) NOT NULL Primary Key,	--주문번호
	CustomerID Int NOT NULL ,				--고객코드
	OrderDate DateTime NOT NULL ,				--주문일자
	ShipDate DateTime NOT NULL,				--배송일자
	TotalPrice Int Null,					--주문총금액
	OrderStatus VarChar(20) Null,				--주문상태_구매상태
	Payment VarChar(20) Null,				--결제방법
	PaymentPrice Int Null,					--결제금액
	PaymentInfo VarChar(20) NUll,				--결제상태_입금상황
	PaymentEndDate DateTime Null,				--결제완료일
	DeliveryInfo Int Null,					--배송지구분
	DeliveryStatus VarChar(20) Null,			--배송상태_배송상황
	DeliveryEndDate DateTime Null,				--거래완료일자
	OrderIP VarChar(15) Null,				--주문자아이피주소
	Password VarChar(20) Null				--주문비밀번호_비회원
)
GO

--[9] 주문상세
CREATE TABLE dbo.OrderDetails 
(
	OrderID Int NOT NULL,		--주문번호(고유일련번호)
	ProductID Int NOT NULL,		--상품번호
	Quantity Int NOT NULL,		--주문수량
	SellPrice Int NOT NULL,		--주문단가
	Price Int Null,			--주문금액
	Mileage Int Null		--마일리지
)
GO

--[10] 배송지 정보
CREATE TABLE dbo.Delivery
(
	OrderID Int Not Null,		--주문번호
	CustomerName VarChar(50),	--배송자이름
	TelePhone VarChar(20) Null,	--전화번호
	MobilePhone VarChar(20) Null,	--휴대폰번호
	ZipCode VarChar(7) Null,	--우편번호
	Address VarChar(100) Null,	--주소
	AddressDetail VarChar(50) Null	--상세주소
)
Go

--[11] 메모(남기고싶은말)
CREATE TABLE dbo.Message
(
	OrderID Int Not Null,	--주문번호
	Message VarChar(150)	--남기고싶은말
)
Go

--[12] 관리자 메모 : 옵션
CREATE TABLE dbo.AdminMessage
(
	OrderID Int Not Null,		--주문번호
	AdminMessage VarChar(150)	--주문관련관리자메모
)
Go

--[13] 은행 입금 : 옵션
CREATE TABLE dbo.OnlineBanking
(
	DepositDate DateTime Not Null Default(GetDate()),	--입금일자
	DepositNum Int Not Null Identity(1, 1),			--입금번호(고유일련번호)
	BankName VarChar(50) Null,				--입금은행명
	Name VarChar(50) Null,					--입금자성명
	Price Int Null,						--입금액
	OrderID Int						--주문번호
)
Go

----[!] 찜(WishList) : 회원전용
--Create Table dbo.WishList
--(
--	--과제
--)
--Go

-- =============================================================
-- create the stored procedures
-- =============================================================

--[1] 상품 등록 : ProductAdd.aspx에서 사용
--ProductsAdd : Products테이블에 데이터 입력 후 
--현재 입력된 레코드의 ProductID값을 반환
Create Procedure dbo.ProductsAdd
(
    @CategoryID Int,
    @ModelNumber VarChar(50) ,
    @ModelName VarChar(50) ,
    @Company VarChar(50),
    @OriginPrice Int,
    @SellPrice Int,
    @EventName VarChar(50),
    @ProductImage VarChar(50) ,
    @Explain VarChar(400),
    @Description text,
    @Encoding VarChar(10),
    @ProductCount Int,
    @Mileage Int,
    @Absence Int,
    @ProductID Int OUTPUT -- OUTPUT 매개변수
)
As
	Insert Products
	(
		CategoryID, 
		ModelNumber, 
		ModelName, 
		Company, 
		OriginPrice, 
		SellPrice, 
		EventName, 
		ProductImage, 
		Explain, 
		Description, 
		Encoding, 
		ProductCount, 
		Mileage, 
		Absence
	) 
	Values
	(
		@CategoryID, 
		@ModelNumber, 
		@ModelName, 
		@Company, 
		@OriginPrice, 
		@SellPrice, 
		@EventName, 
		@ProductImage, 
		@Explain, 
		@Description, 
		@Encoding, 
		@ProductCount, 
		@Mileage, 
		@Absence
	)

	Select @ProductID = @@Identity
Go

--[2] 상품 카테고리 리스트 : CategoryList.ascx에서 사용
CREATE Procedure ProductCategoryList
AS
	SELECT 
		CategoryID,
		CategoryName
	FROM 
		Categories
	ORDER BY 
		CategoryName ASC
GO

--[3] 카테고리에 따른 상품리스트 : ProductsList.aspx에서 사용
CREATE Procedure ProductsByCategory
(
    @CategoryID Int
)
AS
	SELECT 
		ProductID,
		ModelName,
		SellPrice, 
		ProductImage
	FROM 
		Products
	WHERE 
		CategoryID = @CategoryID
	ORDER BY 
		ModelName, 
		ModelNumber
GO

--[4] 상품 상세 : ProductDetails.aspx에서 사용
CREATE Procedure ProductDetail
(
    @ProductID    Int,
    @ModelNumber  VarChar(50) OUTPUT,
    @ModelName    VarChar(50) OUTPUT,
    @Company		VarChar(50) OUTPUT,
    @ProductImage VarChar(50) OUTPUT,
    @OriginPrice     Int OUTPUT,
    @SellPrice     Int OUTPUT,
    @Description  VarChar(4000) OUTPUT,
    @ProductCount     Int OUTPUT
)
AS
	SELECT 
		@ProductID		= ProductID,
		@ModelNumber	= ModelNumber,
		@ModelName		= ModelName,
		@Company		= Company,
		@ProductImage	= ProductImage,
		@OriginPrice	= OriginPrice,
		@SellPrice		= SellPrice,
		@Description	= Convert(VarChar, Description),
		@ProductCount	= ProductCount
	FROM 
		Products
	WHERE 
		ProductID = @ProductID
GO

--[5] 상품평 리스트 : ReviewList.ascx에서 사용
CREATE Procedure ReviewsList
(
    @ProductID Int
)
AS
	SELECT 
		ReviewID, 
		CustomerName, 
		Rating, 
		Comments
	FROM 
		Reviews
	WHERE 
		ProductID = @ProductID
GO

--[6] 상품평 추가 : ReviewList.ascx에서 사용
CREATE Procedure ReviewsAdd
(
    @ProductID     Int,
    @CustomerName  VarChar(50),
    @CustomerEmail VarChar(50),
    @Rating        Int,
    @Comments      VarChar(3850),
    @ReviewID      Int OUTPUT
)
AS
	INSERT INTO Reviews
	(
		ProductID, 
		CustomerName, 
		CustomerEmail, 
		Rating, 
		Comments
	)
	VALUES
	(
		@ProductID, 
		@CustomerName, 
		@CustomerEmail, 
		@Rating, 
		@Comments
	)

	SELECT 
		@ReviewID = @@Identity
GO

--[7] 쇼핑카트 아이템 추가하기 : AddToCart.aspx에서 사용
CREATE Procedure ShoppingCartAddItem
(
    @CartID VarChar(50),
    @ProductID Int,
    @Quantity Int
)
As
	--(1) 내가 보고 있는 제품이 이미 담아있는지 확인
	DECLARE @CountItems Int
	
	SELECT
		@CountItems = Count(ProductID)
	FROM
		ShoppingCart
	WHERE
		ProductID = @ProductID	/* 장바구니에 담으려는 제품 */
	AND
		CartID = @CartID	/* 현재 접속자 : 회원 또는 비회원 */
	
	--(2) 이미 해당 제품이 담겨져 있다면, 수정
	IF @CountItems > 0  

		UPDATE
			ShoppingCart
		SET
			Quantity = (@Quantity + ShoppingCart.Quantity)
		WHERE
			ProductID = @ProductID
		AND
			CartID = @CartID

	--(3) 처음 구입하는 제품이라면, 입력
	ELSE  

		INSERT INTO ShoppingCart
		(
			CartID,
			Quantity,
			ProductID
		)
		VALUES
		(
			@CartID,
			@Quantity,
			@ProductID
		)
GO

--[8] 쇼핑카트 아이템 개수 : ShoppingCart.aspx에서 사용
CREATE Procedure ShoppingCartItemCount
(
    @CartID    VarChar(50),	--현재접속자
    @ItemCount Int OUTPUT	--상품카운트
)
AS
	SELECT 
		@ItemCount = COUNT(ProductID)
	FROM 
		ShoppingCart
	WHERE 
		CartID = @CartID
GO

--[9] 쇼핑카트 리스트
CREATE Procedure ShoppingCartList
(
    @CartID VarChar(50)	--현재접속자
)
AS
	SELECT 
		Products.ProductID,	--상품고유번호 
		Products.ModelName,	--상품명
		Products.ModelNumber,	--모델번호
		ShoppingCart.Quantity,	--수량
		Products.SellPrice,	--판매가격
		Cast((Products.SellPrice * ShoppingCart.Quantity) As Int) 
			As ExtendedAmount	--소계
	FROM 
		Products,
		ShoppingCart
	WHERE 
		Products.ProductID = ShoppingCart.ProductID
	AND 
		ShoppingCart.CartID = @CartID
	ORDER BY 
		Products.ModelName, 
		Products.ModelNumber
GO

--[10] 쇼핑카트 업데이트 : 장바구니 재정리
CREATE Procedure ShoppingCartUpdate
(
    @CartID    VarChar(50),	--현재접속자
    @ProductID Int,		--상품고유번호
    @Quantity  Int		--수량
)
AS
	UPDATE ShoppingCart
	SET 
		Quantity = @Quantity
	WHERE 
		CartID = @CartID 
	AND 
		ProductID = @ProductID
GO

--[11] 쇼핑카트 아이템 지우기 : 선택된 장바구니 지우기
CREATE Procedure ShoppingCartRemoveItem
(
    @CartID VarChar(50),
    @ProductID Int
)
AS
	DELETE FROM ShoppingCart
	WHERE 
		CartID = @CartID
	AND
		ProductID = @ProductID
GO

--[12] 현재 쇼핑카트 총 비용
CREATE Procedure ShoppingCartTotal
(
    @CartID    VarChar(50),
    @TotalCost Int OUTPUT
)
AS
	SELECT 
		@TotalCost = SUM(Products.SellPrice * ShoppingCart.Quantity)
	FROM 
		ShoppingCart,
		Products
	WHERE
		ShoppingCart.CartID = @CartID
	AND
		Products.ProductID = ShoppingCart.ProductID
GO

--[13] 쇼핑카트 새로고침 : 비회원 -> 회원
CREATE Procedure ShoppingCartMigrate
(
    @OriginalCartId VarChar(50),--세션ID
    @NewCartId      VarChar(50)	--고객ID
)
AS
	UPDATE 
		ShoppingCart
	SET 
		CartId = @NewCartId 
	WHERE 
		CartId = @OriginalCartId
GO

--[14] 쇼핑카트 비우기
CREATE Procedure ShoppingCartEmpty
(
    @CartID VarChar(50)	--현재접속자
)
AS
	DELETE FROM ShoppingCart
	WHERE 
		CartID = @CartID
GO

--[15] 하루가 지난 쇼핑카트 지우기
CREATE Procedure ShoppingCartRemoveAbandoned
AS
	DELETE FROM ShoppingCart
	WHERE 
		DATEDIFF(dd, DateCreated, GetDate()) > 1
GO

--[!] 지금까지 몇일 살았는지?
--Select DateDiff(dd, '1980-02-05', GetDate())

--[16] 고객 등록 : Register.aspx에서 사용
CREATE Procedure CustomerAdd
(
	@CustomerName	VarChar(50),
	@Phone1			VarChar(4),
	@Phone2			VarChar(4),
	@Phone3			VarChar(4),
	@Mobile1		VarChar(4),
	@Mobile2		VarChar(4),
	@Mobile3		VarChar(4),
	@Zip VarChar(7),
	@Address	VarChar(100),
	@AddressDetail	VarChar(100),
	@Ssn1	VarChar(6),
	@Ssn2	VarChar(7),
	@EmailAddress      VarChar(50),
	@MemberDivision		Int,    
	--
	@UserID	VarChar(25),
	@Password   VarChar(100),
	@BirthYear	VarChar(4),
	@BirthMonth	VarChar(2),
	@BirthDay	VarChar(2),
	@BirthStatus	VarChar(2),
	@Gender	Int,
	@Job	VarChar(20),
	@Wedding	Int,
	@Hobby	VarChar(100),
	@Homepage	VarChar(100),
	@Intro	VarChar(400),
	@Mailing Int,
	@Mileage Int,
	--    
	@CustomerID Int OUTPUT
)
AS
	BEGIN TRAN CustomerAdd 
	
		INSERT INTO Customers
		(
			CustomerName,
			Phone1,
			Phone2,
			Phone3,
			Mobile1,
			Mobile2,
			Mobile3,
			Zip,
			Address,
			AddressDetail,
			Ssn1,
			Ssn2,
			EmailAddress,
			MemberDivision
		)
		VALUES
		(
			@CustomerName,
			@Phone1,
			@Phone2,
			@Phone3,
			@Mobile1,
			@Mobile2,
			@Mobile3,
			@Zip,
			@Address,
			@AddressDetail,
			@Ssn1,
			@Ssn2,
			@EmailAddress,
			@MemberDivision
		)
		
		SELECT @CustomerID = @@Identity
		
		INSERT INTO MemberShip
		VALUES
		(
			@CustomerID,
			@UserID,
			@Password,
			@BirthYear,
			@BirthMonth,
			@BirthDay,
			@BirthStatus,
			@Gender,
			@Job,
			@Wedding,
			@Hobby,
			@Homepage,
			@Intro,
			@Mailing,
			0,
			GetDate(),
			@Mileage,
			GetDate()			
		)
		
		SELECT @CustomerID

	COMMIT TRAN CustomerAdd
GO

--[17] 고객 상세정보 : 회원리스트(회원정보, 관리자 페이지)
CREATE Procedure CustomerDetail
(
    @CustomerID Int
)
AS
	SELECT TOP 1 
			Customers.CustomerName,
			Customers.Phone1,
			Customers.Phone2,
			Customers.Phone3,
			Customers.Mobile1,
			Customers.Mobile2,
			Customers.Mobile3,
			Customers.Zip,
			Customers.Address,
			Customers.AddressDetail,
			Customers.Ssn1,
			Customers.Ssn2,
			Customers.EmailAddress,
			Customers.MemberDivision,
			--
			MemberShip.UserID,
			MemberShip.Password,
			MemberShip.BirthYear,
			MemberShip.BirthMonth,
			MemberShip.BirthDay,
			MemberShip.BirthStatus,
			MemberShip.Gender,
			MemberShip.Job,
			MemberShip.Wedding,
			MemberShip.Hobby,
			MemberShip.Homepage,
			MemberShip.Intro,
			MemberShip.Mailing,
			MemberShip.VisitCount,
			MemberShip.LastVisit,
			MemberShip.Mileage,
			MemberShip.JoinDate								
	FROM 
		Customers
	INNER JOIN MemberShip ON Customers.CustomerID = MemberShip.CustomerID
	WHERE 
	    Customers.CustomerID = @CustomerID
GO

--[18] 회원 로그인
CREATE Procedure CustomerLogin
(
	@UserID      VarChar(50),
	@Password   VarChar(50),
	@CustomerID Int OUTPUT
)
AS
	SELECT 
		@CustomerID = CustomerID
	FROM 
		MemberShip
	WHERE 
		UserID = @UserID
	AND 
		Password = @Password
		
	IF @@Rowcount < 1 
	SELECT 
		@CustomerID = 0
GO

--[19] 주문 추가 : Checkout.aspx에서 사용
CREATE Procedure OrdersAdd
(
	@CustomerID Int,
	@OrderDate  DateTime,        
	@ShipDate   DateTime,
	@TotalPrice	Int,
	@OrderStatus	VarChar(20),
	@Payment	VarChar(20),
	@PaymentPrice	Int,
	@PaymentInfo	VarChar(20),
	@PaymentEndDate	DateTime,
	@DeliveryInfo	Int,
	@DeliveryStatus	VarChar(20),
	@DeliveryEndDate	DateTime,
	@OrderIP	VarChar(15),
	@Password	VarChar(20),    
	--
	@CartID     VarChar(50),
	--
	@Message	VarChar(150),
	--
	@CustomerName VarChar(50) ,
	@TelePhone VarChar(20) ,
	@MobilePhone VarChar(20) ,
	@ZipCode VarChar(7) ,
	@Address VarChar(100) ,
	@AddressDetail VarChar(50) ,	
	--
	@OrderID    Int OUTPUT
)
AS
	BEGIN TRAN AddOrder

	/* Orders 테이블에 관련 정보 기록 */
	INSERT INTO Orders
	(
		CustomerID, 
		OrderDate, 
		ShipDate,
		TotalPrice,
		OrderStatus,
		Payment,
		PaymentPrice,
		PaymentInfo,
		PaymentEndDate,
		DeliveryInfo,
		DeliveryStatus,
		DeliveryEndDate,
		OrderIP,
		Password
	)
	VALUES
	(   
		@CustomerID, 
		@OrderDate, 
		@ShipDate,
		@TotalPrice,
		@OrderStatus,
		@Payment,
		@PaymentPrice,
		@PaymentInfo,
		@PaymentEndDate,
		@DeliveryInfo,
		@DeliveryStatus,
		@DeliveryEndDate,
		@OrderIP,
		@Password		
	)

	SELECT
		@OrderID = @@Identity    

	/* 현재 주문번호와 현재 쇼핑카트 내용을 OrdersDetail 테이블로 저장 */
	INSERT INTO OrderDetails
	(
		OrderID, 
		ProductID, 
		Quantity, 
		SellPrice,
		Price,
		Mileage
	)
	SELECT 
		@OrderID, 
		ShoppingCart.ProductID, 
		Quantity, 
		Products.SellPrice,
		(Products.SellPrice * ShoppingCart.Quantity) As Price,
		Products.Mileage
	FROM 
		ShoppingCart 
	INNER JOIN Products ON ShoppingCart.ProductID = Products.ProductID	  
	WHERE 
		CartID = @CartID

	/* 주문 실행 후 현재 카트 아이디에 해당하는 쇼핑카트 내용 지우기 */
	EXEC ShoppingCartEmpty @CartId

	/* 남기고 싶은 말 저장 */
	INSERT INTO Message
	(
		OrderID,
		Message
	)
	VALUES
	(
		@OrderID,
		@Message
	)

	/* Delivery 테이블에 관련 정보 기록 */
	INSERT INTO Delivery
	(
		OrderID,
		CustomerName,
		TelePhone,
		MobilePhone,
		ZipCode,
		Address,
		AddressDetail
	)
	VALUES
	(
		@OrderID,
		@CustomerName,
		@TelePhone,
		@MobilePhone,
		@ZipCode,
		@Address,
		@AddressDetail
	)
	
	COMMIT TRAN AddOrder
GO

--[20] 비회원 고객 등록 : CustomersDB.cs / CheckOut.aspx
CREATE Procedure NonCustomerAdd
(
	@CustomerName	VarChar(50),
	@Phone1			VarChar(4),
	@Phone2			VarChar(4),
	@Phone3			VarChar(4),
	@Mobile1		VarChar(4),
	@Mobile2		VarChar(4),
	@Mobile3		VarChar(4),
	@Zip VarChar(7),
	@Address	VarChar(100),
	@AddressDetail	VarChar(50),
	@Ssn1	VarChar(6),
	@Ssn2	VarChar(7),
	@EmailAddress      VarChar(50),
	@MemberDivision		Int,    
	--    
	@CustomerID Int OUTPUT
)
AS
	BEGIN TRAN CustomerAdd 
	
		INSERT INTO Customers
		(
			CustomerName,
			Phone1,
			Phone2,
			Phone3,
			Mobile1,
			Mobile2,
			Mobile3,
			Zip,
			Address,
			AddressDetail,
			Ssn1,
			Ssn2,
			EmailAddress,
			MemberDivision
		)
		VALUES
		(
			@CustomerName,
			@Phone1,
			@Phone2,
			@Phone3,
			@Mobile1,
			@Mobile2,
			@Mobile3,
			@Zip,
			@Address,
			@AddressDetail,
			@Ssn1,
			@Ssn2,
			@EmailAddress,
			@MemberDivision
		)
		
		SELECT @CustomerID = @@Identity
		
	COMMIT TRAN CustomerAdd
GO

--[21] 주문 리스트(회원) : OrdersList.aspx
CREATE Procedure OrdersList
(
	@CustomerID Int
)
As
	SELECT  
		Orders.OrderID,
		Cast(Sum(Orderdetails.Quantity * OrderDetails.SellPrice) As Int) 
			As TotalPrice,
		Orders.OrderDate, 
		Orders.ShipDate
	FROM    
		Orders 
	INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
	GROUP BY    
		CustomerID, 
		Orders.OrderID, 
		Orders.OrderDate, 
		Orders.ShipDate
	HAVING  
		Orders.CustomerID = @CustomerID
GO

--[22] 주문 리스트(비회원)
CREATE Procedure OrdersListNonCustomer
(
	@OrderID Int,		--주문번호
	@Password VarChar(20)	--비밀번호
)
As
	SELECT  
		Orders.OrderID,
		Cast(Sum(OrderDetails.Quantity * OrderDetails.SellPrice) As Int) 
			As TotalPrice,
		Orders.OrderDate, 
		Orders.ShipDate
	FROM    
		Orders 
	INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
	GROUP BY    
		Password, 
		Orders.OrderID, 
		Orders.OrderDate, 
		Orders.ShipDate
	HAVING  
		Orders.OrderID = @OrderID AND Orders.Password = @Password
GO

--[23] 주문 상세
CREATE Procedure OrdersDetail
(
	@OrderID    Int,
	@OrderDate  DateTime OUTPUT,
	@ShipDate   DateTime OUTPUT,
	@TotalPrice Int OUTPUT
)
AS
	/* 현재 고객에 대한 주문일과 배송일에 대한 정보값을 반환 */
	SELECT 
		@OrderDate = OrderDate,
		@ShipDate = ShipDate
	FROM    
		Orders
	WHERE   
		OrderID = @OrderID

	IF @@Rowcount = 1
	BEGIN

	/* 처음으로 총 가격을 Output 매개변수로 반환 */
	SELECT  
		@TotalPrice = Cast(SUM(OrderDetails.Quantity * OrderDetails.SellPrice) As Int)
	FROM    
		OrderDetails
	WHERE   
		OrderID= @OrderID
	/* 그런다음, 주문 상세 정보값 반환 */
	SELECT  
		Products.ProductID, 
		Products.ModelName,
		Products.ModelNumber,
		OrderDetails.SellPrice,
		OrderDetails.Quantity,
		(OrderDetails.Quantity * OrderDetails.SellPrice) as ExtendedAmount
	FROM
		OrderDetails
	INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
	WHERE   
		OrderID = @OrderID
	END
GO

--[24] 고객이 이미 구입한 상품
CREATE Procedure CustomerAlsoBought
(
	@ProductID Int
)
As
	SELECT  TOP 5 
		OrderDetails.ProductID,
		Products.ModelName,
		SUM(OrderDetails.Quantity) as TotalNum
	FROM    
		OrderDetails
	INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
	WHERE   OrderID IN 
	(
		/* ProductID에 해당하는 모든 주문에 대한 OrderID 값 반환 */
		SELECT DISTINCT OrderID 
		FROM OrderDetails
		WHERE ProductID = @ProductID
	)
	AND OrderDetails.ProductID != @ProductID 
	GROUP BY OrderDetails.ProductID, Products.ModelName 
	ORDER BY TotalNum DESC
GO

--[25] 상품 검색
CREATE Procedure ProductSearch
(
	@Search VarChar(255)
)
AS
	SELECT 
		ProductID,
		ModelName,
		ModelNumber,
		SellPrice, 
		ProductImage
	FROM 
		Products
	WHERE 
		ModelNumber LIKE '%' + @Search + '%' 
	OR
		ModelName LIKE '%' + @Search + '%'
	OR
		Description LIKE '%' + @Search + '%'
GO

--[26] 최근에 잘 팔리는 상품리스트 5개
CREATE Procedure ProductsMostPopular
AS
	SELECT TOP 5 
		OrderDetails.ProductID, 
		SUM(OrderDetails.Quantity) as TotalNum, 
		Products.ModelName
	FROM    
		OrderDetails
	INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
	GROUP BY 
		OrderDetails.ProductID, 
		Products.ModelName
	ORDER BY 
		TotalNum DESC
GO

--[27] 회원 수정(옵션)
CREATE Procedure CustomerModify	
(
	@CustomerName	VarChar(50),
	@Phone1		VarChar(4),
	@Phone2		VarChar(4),
	@Phone3		VarChar(4),
	@Mobile1		VarChar(4),
	@Mobile2		VarChar(4),
	@Mobile3		VarChar(4),
	@Zip			VarChar(7),
	@Address		VarChar(100),
	@AddressDetail		VarChar(100),
	@Ssn1		VarChar(6),
	@Ssn2		VarChar(7),
	@EmailAddress      	VarChar(50),
	@MemberDivision	Int,    
	--
	@UserID		VarChar(25),
	@Password 	  	VarChar(100),
	@BirthYear		VarChar(4),
	@BirthMonth		VarChar(2),
	@BirthDay		VarChar(2),
		@BirthStatus		VarChar(2),
	@Gender		Int,
	@Job		VarChar(20),
	@Wedding	Int,
	@Hobby		VarChar(100),
	@Homepage	VarChar(100),
	@Intro		VarChar(400),
	@Mailing		 Int,
	@Mileage		 Int,
	--    
	@CustomerID Int
)
AS
	BEGIN TRAN CustomerModify	
		Update Customers		
		Set
			CustomerName = @CustomerName,
			Phone1 = @Phone1 ,
			Phone2 = @Phone2,
			Phone3 = @Phone3,
			Mobile1 = @Mobile1,
			Mobile2 = @Mobile2,
			Mobile3 = @Mobile3,
			Zip = @Zip,
			Address = @Address,
			AddressDetail =@AddressDetail,
			Ssn1 = @Ssn1,
			Ssn2 = @Ssn2,
			EmailAddress = @EmailAddress,
			MemberDivision = @MemberDivision			
		Where CustomerID = @CustomerID	
		
		Update MemberShip
		Set
			CustomerID = @CustomerID,
			UserID = @UserID,
			Password =@Password,
			BirthYear =@BirthYear,
			BirthMonth =@BirthMonth,
			BirthDay =@BirthDay,
			BirthStatus =@BirthStatus,
			Gender =@Gender,
			Job =@Job,
			Wedding=@Wedding,
			Hobby =@Hobby,
			Homepage =@Homepage,
			intro =@Intro,
			Mailing =@Mailing,
			Mileage =@Mileage		
		Where CustomerID = @CustomerID			
	COMMIT TRAN CustomerModify	
GO

--수고하셨습니다. 
--박용준(RedPlus)
--http://www.dotnetkorea.com/
