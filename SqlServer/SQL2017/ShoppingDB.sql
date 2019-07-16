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

--[1] ī�װ�
CREATE TABLE dbo.Categories
(
    CategoryID Int IDENTITY(1, 1) NOT NULL Primary Key,	--ī�װ���ȣ
    CategoryName VarChar(50),				--ī�װ���
    SuperCategory Int Null,				--�θ�ī�װ���ȣ
    Align SmallInt Default(0)				--ī�װ��������¼���
)
GO

--[2] ��ǰ
CREATE TABLE dbo.Products 
(
	ProductID Int IDENTITY(1, 1) NOT NULL ,     --��ǰ�����ڵ�
	CategoryID Int NOT NULL ,               --ī�װ���ȣ
	ModelNumber VarChar(50) ,               --�𵨹�ȣ
	ModelName VarChar(50) ,               --�𵨸�(��ǰ��)
	Company VarChar(50),               --����ȸ��
	OriginPrice Int Null,               --����
	SellPrice Int Null,                    --�ǸŰ�
	EventName VarChar(50) Null,               --��,��Ʈ,��ȹ,...
	ProductImage VarChar(50) ,               --�̹�����
	Explain VarChar(400),               --��༳��
	Description Text Null,--VarChar(4000)     --�󼼼���
	Encoding VarChar(10) Null,               --���ڵ�(Text/HTML)
	ProductCount Int Null,               --������
	RegistDate DateTime Default(GetDate()),     --��ǰ�����
	Mileage Int Null,                    --���ϸ���
	Absence Int Null                    --ǰ������
)
GO 

--[3] ��ǰ��
CREATE TABLE dbo.Reviews 
(
	ReviewID Int IDENTITY(1, 1) Primary Key NOT NULL, 	--�����Ϸù�ȣ
	ProductID Int NOT NULL,					--��ǰ��ȣ
	CustomerName VarChar(50),				--����
	CustomerEmail VarChar(50),				--���̸���
	Rating TinyInt NOT NULL,					--����
	Comments VarChar(3850),					--����
	AddDate SmallDateTime Default(GetDate()) 		--�ۼ���
)
GO

--[4] ��ٱ���
CREATE TABLE dbo.ShoppingCart 
(
    RecordID Int IDENTITY(1, 1) Primary Key NOT NULL, 	--����īƮ ������ȣ
    CartID VarChar(50),					--īƮ��ȣ(�����й�ȣ) : ������ ��
    ProductID Int NOT NULL,				--��ǰ������ȣ(��ǰ��, ����, ���ϸ���, ...)
    Quantity Int NOT NULL,				--����
    DateCreated DateTime Default(GetDate())		--īƮ ������
)
GO

--[5] ��
CREATE TABLE dbo.Customers 
(
	CustomerID Int IDENTITY(1, 1) NOT NULL Primary Key,	--�� ���� ��ȣ
	CustomerName VarChar(50),				--����(ȸ��/��ȸ��)
	Phone1 VarChar(4),					--��ȭ��ȣ1
	Phone2 VarChar(4),					--��ȭ��ȣ2
	Phone3 VarChar(4),					--��ȭ��ȣ3
	Mobile1 VarChar(4),					--�޴���1
	Mobile2 VarChar(4),					--�޴���2
	Mobile3 VarChar(4),					--�޴���3
	Zip VarChar(7) Null,         				--�����ȣ
	Address VarChar(100) Null,   				--�ּ�
	AddressDetail VarChar(100) Null,			--�ּ� ��
	Ssn1 VarChar(6) Null,					--�ֹι�ȣ ���ڸ�
	Ssn2 VarChar(7) Null,					--�ֹι�ȣ ���ڸ�
	EmailAddress VarChar(50),				--�̸���
	MemberDivision Int					--ȸ������(0:��ȸ��,1:ȸ��)
)
GO

--[6] ȸ��
CREATE TABLE dbo.MemberShip
(
	CustomerID Int Not Null,		--����ȣ
	UserID VarChar(25) Not Null,		--���̵�
	Password VarChar(100) Not Null,		--��й�ȣ
	BirthYear VarChar(4) Null,		--��
	BirthMonth VarChar(2) Null,		--��
	BirthDay VarChar(2) Null,		--��
	BirthStatus VarChar(2) Null,		--���ϱ���
	Gender Int Null,			--����
	Job VarChar(20) Null,			--����
	Wedding Int Null, 			--��ȥ����
	Hobby VarChar(100) Null,		--���
	Homepage VarChar(100) Null,		--Ȩ������
	Intro VarChar(400) Null,    		--�Ұ�
	Mailing Int Null, 			--���ϼ��ſ���
	VisitCount Int Default 0,             	--�湮Ƚ��
	LastVisit DateTime Default GetDate(),	--�������湮�Ͻ�
	Mileage Int Null,			--���ϸ���     
	JoinDate DateTime Default GetDate()	--��������
)
Go

--[7] �����ȣ
--Drop Table dbo.Zip
CREATE TABLE dbo.Zip 
(
	ZipCode VarChar(7) Not Null,	--�����ȣ
	Si VarChar(50) NULL,		--�õ�
	Gu VarChar(50) NULL,		--����
	Dong VarChar(50) NULL,		--����
	PostEtc VarChar(50) NULL 	--������
)
Go

--Zip.txt���� DTS�� ����ؼ� Zip ���̺�� ������ �̵�

-- �����ȣ �˻��⿡�� ����Ҹ��� ����
--Select * From Zip 
--Where 
	--Si Like '�Ⱦ�%' 
	--Or 
	--Gu Like '�Ⱦ�%' 
	--Or 
--	Dong Like '�Ⱦ�%'
--Go

-- �����ȣ ���̺��� '���̸�'���� �˻� : Ctrl + L
--Select * From Zip1 Where Dong Like '%�Ⱦ�%'
--Go
--Select * From Zip1 Where Dong Like '�Ⱦ�%'
--Go
--Select * From Zip1 Where Dong Like '�Ⱦ�'
--Go

-- Index(�ε���)�� �����Ͽ� ���� ���� �ɷ� ���
--�˻� ����� �������� ��� : Ŭ�����͵�
--Select * From Zip1 Where Dong Like '�Ⱦ�%'
--Go
--Select * From Zip2 Where Dong Like '�Ⱦ�%'
--Go

--[!] Zip1���̺��� Dong�ʵ忡 Ŭ�����͵� �ε��� ����
--Create Clustered Index idxZip On Zip1(Dong)
--Go

--�˻� ����� �ϳ��� ��� : ��Ŭ�����͵�
--Select * From Products Where ProductID = 1

--[8] �ֹ�
CREATE TABLE dbo.Orders 
(
	OrderID Int IDENTITY (1, 1) NOT NULL Primary Key,	--�ֹ���ȣ
	CustomerID Int NOT NULL ,				--���ڵ�
	OrderDate DateTime NOT NULL ,				--�ֹ�����
	ShipDate DateTime NOT NULL,				--�������
	TotalPrice Int Null,					--�ֹ��ѱݾ�
	OrderStatus VarChar(20) Null,				--�ֹ�����_���Ż���
	Payment VarChar(20) Null,				--�������
	PaymentPrice Int Null,					--�����ݾ�
	PaymentInfo VarChar(20) NUll,				--��������_�Աݻ�Ȳ
	PaymentEndDate DateTime Null,				--�����Ϸ���
	DeliveryInfo Int Null,					--���������
	DeliveryStatus VarChar(20) Null,			--��ۻ���_��ۻ�Ȳ
	DeliveryEndDate DateTime Null,				--�ŷ��Ϸ�����
	OrderIP VarChar(15) Null,				--�ֹ��ھ������ּ�
	Password VarChar(20) Null				--�ֹ���й�ȣ_��ȸ��
)
GO

--[9] �ֹ���
CREATE TABLE dbo.OrderDetails 
(
	OrderID Int NOT NULL,		--�ֹ���ȣ(�����Ϸù�ȣ)
	ProductID Int NOT NULL,		--��ǰ��ȣ
	Quantity Int NOT NULL,		--�ֹ�����
	SellPrice Int NOT NULL,		--�ֹ��ܰ�
	Price Int Null,			--�ֹ��ݾ�
	Mileage Int Null		--���ϸ���
)
GO

--[10] ����� ����
CREATE TABLE dbo.Delivery
(
	OrderID Int Not Null,		--�ֹ���ȣ
	CustomerName VarChar(50),	--������̸�
	TelePhone VarChar(20) Null,	--��ȭ��ȣ
	MobilePhone VarChar(20) Null,	--�޴�����ȣ
	ZipCode VarChar(7) Null,	--�����ȣ
	Address VarChar(100) Null,	--�ּ�
	AddressDetail VarChar(50) Null	--���ּ�
)
Go

--[11] �޸�(����������)
CREATE TABLE dbo.Message
(
	OrderID Int Not Null,	--�ֹ���ȣ
	Message VarChar(150)	--����������
)
Go

--[12] ������ �޸� : �ɼ�
CREATE TABLE dbo.AdminMessage
(
	OrderID Int Not Null,		--�ֹ���ȣ
	AdminMessage VarChar(150)	--�ֹ����ð����ڸ޸�
)
Go

--[13] ���� �Ա� : �ɼ�
CREATE TABLE dbo.OnlineBanking
(
	DepositDate DateTime Not Null Default(GetDate()),	--�Ա�����
	DepositNum Int Not Null Identity(1, 1),			--�Աݹ�ȣ(�����Ϸù�ȣ)
	BankName VarChar(50) Null,				--�Ա������
	Name VarChar(50) Null,					--�Ա��ڼ���
	Price Int Null,						--�Աݾ�
	OrderID Int						--�ֹ���ȣ
)
Go

----[!] ��(WishList) : ȸ������
--Create Table dbo.WishList
--(
--	--����
--)
--Go

-- =============================================================
-- create the stored procedures
-- =============================================================

--[1] ��ǰ ��� : ProductAdd.aspx���� ���
--ProductsAdd : Products���̺� ������ �Է� �� 
--���� �Էµ� ���ڵ��� ProductID���� ��ȯ
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
    @ProductID Int OUTPUT -- OUTPUT �Ű�����
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

--[2] ��ǰ ī�װ� ����Ʈ : CategoryList.ascx���� ���
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

--[3] ī�װ��� ���� ��ǰ����Ʈ : ProductsList.aspx���� ���
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

--[4] ��ǰ �� : ProductDetails.aspx���� ���
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

--[5] ��ǰ�� ����Ʈ : ReviewList.ascx���� ���
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

--[6] ��ǰ�� �߰� : ReviewList.ascx���� ���
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

--[7] ����īƮ ������ �߰��ϱ� : AddToCart.aspx���� ���
CREATE Procedure ShoppingCartAddItem
(
    @CartID VarChar(50),
    @ProductID Int,
    @Quantity Int
)
As
	--(1) ���� ���� �ִ� ��ǰ�� �̹� ����ִ��� Ȯ��
	DECLARE @CountItems Int
	
	SELECT
		@CountItems = Count(ProductID)
	FROM
		ShoppingCart
	WHERE
		ProductID = @ProductID	/* ��ٱ��Ͽ� �������� ��ǰ */
	AND
		CartID = @CartID	/* ���� ������ : ȸ�� �Ǵ� ��ȸ�� */
	
	--(2) �̹� �ش� ��ǰ�� ����� �ִٸ�, ����
	IF @CountItems > 0  

		UPDATE
			ShoppingCart
		SET
			Quantity = (@Quantity + ShoppingCart.Quantity)
		WHERE
			ProductID = @ProductID
		AND
			CartID = @CartID

	--(3) ó�� �����ϴ� ��ǰ�̶��, �Է�
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

--[8] ����īƮ ������ ���� : ShoppingCart.aspx���� ���
CREATE Procedure ShoppingCartItemCount
(
    @CartID    VarChar(50),	--����������
    @ItemCount Int OUTPUT	--��ǰī��Ʈ
)
AS
	SELECT 
		@ItemCount = COUNT(ProductID)
	FROM 
		ShoppingCart
	WHERE 
		CartID = @CartID
GO

--[9] ����īƮ ����Ʈ
CREATE Procedure ShoppingCartList
(
    @CartID VarChar(50)	--����������
)
AS
	SELECT 
		Products.ProductID,	--��ǰ������ȣ 
		Products.ModelName,	--��ǰ��
		Products.ModelNumber,	--�𵨹�ȣ
		ShoppingCart.Quantity,	--����
		Products.SellPrice,	--�ǸŰ���
		Cast((Products.SellPrice * ShoppingCart.Quantity) As Int) 
			As ExtendedAmount	--�Ұ�
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

--[10] ����īƮ ������Ʈ : ��ٱ��� ������
CREATE Procedure ShoppingCartUpdate
(
    @CartID    VarChar(50),	--����������
    @ProductID Int,		--��ǰ������ȣ
    @Quantity  Int		--����
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

--[11] ����īƮ ������ ����� : ���õ� ��ٱ��� �����
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

--[12] ���� ����īƮ �� ���
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

--[13] ����īƮ ���ΰ�ħ : ��ȸ�� -> ȸ��
CREATE Procedure ShoppingCartMigrate
(
    @OriginalCartId VarChar(50),--����ID
    @NewCartId      VarChar(50)	--��ID
)
AS
	UPDATE 
		ShoppingCart
	SET 
		CartId = @NewCartId 
	WHERE 
		CartId = @OriginalCartId
GO

--[14] ����īƮ ����
CREATE Procedure ShoppingCartEmpty
(
    @CartID VarChar(50)	--����������
)
AS
	DELETE FROM ShoppingCart
	WHERE 
		CartID = @CartID
GO

--[15] �Ϸ簡 ���� ����īƮ �����
CREATE Procedure ShoppingCartRemoveAbandoned
AS
	DELETE FROM ShoppingCart
	WHERE 
		DATEDIFF(dd, DateCreated, GetDate()) > 1
GO

--[!] ���ݱ��� ���� ��Ҵ���?
--Select DateDiff(dd, '1980-02-05', GetDate())

--[16] �� ��� : Register.aspx���� ���
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

--[17] �� ������ : ȸ������Ʈ(ȸ������, ������ ������)
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

--[18] ȸ�� �α���
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

--[19] �ֹ� �߰� : Checkout.aspx���� ���
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

	/* Orders ���̺� ���� ���� ��� */
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

	/* ���� �ֹ���ȣ�� ���� ����īƮ ������ OrdersDetail ���̺�� ���� */
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

	/* �ֹ� ���� �� ���� īƮ ���̵� �ش��ϴ� ����īƮ ���� ����� */
	EXEC ShoppingCartEmpty @CartId

	/* ����� ���� �� ���� */
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

	/* Delivery ���̺� ���� ���� ��� */
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

--[20] ��ȸ�� �� ��� : CustomersDB.cs / CheckOut.aspx
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

--[21] �ֹ� ����Ʈ(ȸ��) : OrdersList.aspx
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

--[22] �ֹ� ����Ʈ(��ȸ��)
CREATE Procedure OrdersListNonCustomer
(
	@OrderID Int,		--�ֹ���ȣ
	@Password VarChar(20)	--��й�ȣ
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

--[23] �ֹ� ��
CREATE Procedure OrdersDetail
(
	@OrderID    Int,
	@OrderDate  DateTime OUTPUT,
	@ShipDate   DateTime OUTPUT,
	@TotalPrice Int OUTPUT
)
AS
	/* ���� ���� ���� �ֹ��ϰ� ����Ͽ� ���� �������� ��ȯ */
	SELECT 
		@OrderDate = OrderDate,
		@ShipDate = ShipDate
	FROM    
		Orders
	WHERE   
		OrderID = @OrderID

	IF @@Rowcount = 1
	BEGIN

	/* ó������ �� ������ Output �Ű������� ��ȯ */
	SELECT  
		@TotalPrice = Cast(SUM(OrderDetails.Quantity * OrderDetails.SellPrice) As Int)
	FROM    
		OrderDetails
	WHERE   
		OrderID= @OrderID
	/* �׷�����, �ֹ� �� ������ ��ȯ */
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

--[24] ���� �̹� ������ ��ǰ
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
		/* ProductID�� �ش��ϴ� ��� �ֹ��� ���� OrderID �� ��ȯ */
		SELECT DISTINCT OrderID 
		FROM OrderDetails
		WHERE ProductID = @ProductID
	)
	AND OrderDetails.ProductID != @ProductID 
	GROUP BY OrderDetails.ProductID, Products.ModelName 
	ORDER BY TotalNum DESC
GO

--[25] ��ǰ �˻�
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

--[26] �ֱٿ� �� �ȸ��� ��ǰ����Ʈ 5��
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

--[27] ȸ�� ����(�ɼ�)
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

--�����ϼ̽��ϴ�. 
--�ڿ���(RedPlus)
--http://www.dotnetkorea.com/
