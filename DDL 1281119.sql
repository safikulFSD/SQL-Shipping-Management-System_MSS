/*		
					SQL Project Name : Shipping Management System(SMS)
							    Trainee Name : Md. Safikul Islam   
						    	  Trainee ID : 1281119     
							Batch ID : CS/PNTL-M/58/01 

 --------------------------------------------------------------------------------

Table of Contents: DDL
			=> SECTION 01: CREATE DATABASE [SMS]
			=> SECTION 02: CREATE TABGLE WITH PRIMARY KEY & FOREIGN KEY & DEFAULT CONSTRAIN
			=> SECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS
			=> SECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX
			=> SECTION 05: CREATE SEQUENCE
			=> SECTION 06: CREATE A VIEW & ALTER VIEW
			=> SECTION 07: CREATE STORED PROCEDURE 
			=> SECTION 08: CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, 
			   MULTISTATEMENT TABLE VALUED) & ALTER FUNCTION
			=> SECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER)
			=> SECTION 10: CREATE TRIGGER (INSTEAD OF TRIGGER)
*/


/*
==============================  SECTION 01  ==============================
					 CREATE DATABASE WITH ATTRIBUTES
==========================================================================
*/
CREATE DATABASE SMS
ON
(
	name='SMS_Data',
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SMS_Data.mdf',
	size=25MB,
	maxsize=100MB,
	filegrowth=5%
)
LOG ON
(
	name = 'SMS_Log',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SMS_Log.Ldf',
	size=2MB,
	maxsize=50MB,
	filegrowth=1MB
)
GO

USE SMS
GO
--============== Table with PRIMARY KEY & CHECK CONSTRAINT & set CONSTRAINT DEFAULT CONSTRAINT... ============--
CREATE TABLE country
(
	countryId INT IDENTITY PRIMARY KEY,
	countryName CHAR(15) NOT NULL
)
GO

CREATE TABLE city
(
	cityid INT IDENTITY PRIMARY KEY,
	cityname CHAR(15) NOT NULL,
)
GO

CREATE TABLE tbl_customer 
(
	customer_id int IDENTITY PRIMARY KEY NOT NULL,
	first_name varchar(30)NOT NULL,
	middle_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
	nid CHAR(10) UNIQUE CHECK(nid LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	phone CHAR(20) UNIQUE CHECK(phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	email VARCHAR(40) UNIQUE CONSTRAINT ck_emailCheck CHECK (email LIKE '%@%'),
	[address] varchar(200),
	[password] int,
	countryId INT REFERENCES country(countryId),
	cityId INT REFERENCES city(cityId),
	postalCode NCHAR(12) DEFAULT NULL,
	account_status varchar(30) 
) 
GO
CREATE TABLE tbl_delivery_personnel 
(
	delivery_personnel_id int PRIMARY KEY NOT NULL,
	first_name varchar(30) ,
	middle_name varchar(30),
	last_name varchar(30) NULL,
	contact varchar(15) NOT NULL,
	email_address varchar(50) NOT NULL,
	username varchar(30),
	[password] char(10)
)
GO
CREATE TABLE tbl_shipping 
(
	shipping_id int IDENTITY PRIMARY KEY,
	reference_number  int NOT NULL,
	shipping_date datetime DEFAULT GETDATE(),
	customar_name varchar(30),
	receiver_phone CHAR(20) UNIQUE CHECK(receiver_phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	customer_id int references tbl_customer(customer_id) NOT NULL,
	received_date date DEFAULT GETDATE(),
	amount money NULL,
	[status] varchar(30),
	delivery_personnel_id int references tbl_delivery_personnel(delivery_personnel_id),
	proof_of_transaction text 
)
GO
CREATE TABLE tbl_shipping_details
(
	details_id int PRIMARY KEY,
	shipping_id int references tbl_shipping(shipping_id) NOT NULL,
	item_name varchar(50) NOT NULL,
	item_details varchar(200) NOT NULL,
	quantity int NULL,
	amount money NULL
)
GO
CREATE TABLE tbl_payment 
(
	payment_id int primary key NOT NULL,
	reference_number varchar(30) NOT NULL,
	paid_by varchar(30) not null,
	customer_id int references tbl_customer(customer_id) NOT NULL,
	payment_date datetime NOT NULL,
	amount money unique NULL,
	payment_type varchar(10) 
)
GO
 CREATE TABLE tbl_user 
 (
	[user_id] int NOT NULL,
	username varchar(30) NOT NULL,
	password char(10),
	complete_name varchar(100),
	[address] varchar(200),
	contact_number varchar(15) NOT NULL
) 
GO
CREATE TABLE tblProduct
(
	productId INT IDENTITY PRIMARY KEY,
	productName VARCHAR(40) NOT NULL,
	unitPrice MONEY NOT NULL,
	stock INT DEFAULT 0
)
GO
CREATE TABLE tblStockIn
(
	stockId INT IDENTITY PRIMARY KEY,
	stockDate DATETIME DEFAULT GETDATE(),
	productId INT REFERENCES tblProduct(productId),
	quantity INT NOT NULL
)
GO
CREATE TABLE tblProductForInfrastructure
(
	OrderId INT IDENTITY PRIMARY KEY,
	OrderDate DATETIME DEFAULT GETDATE(),
	productId INT REFERENCES tblProduct(productId),
	quantity INT NOT NULL
)
GO
CREATE TABLE tblComments
(
	commentId INT,
	comment NVARCHAR(100) NULL
)
GO
SELECT * FROM tblComments
--============== CREATE A SCHEMA ============--

CREATE SCHEMA sms
GO
--============== USE SCHEMA IN A TABLE ============--

CREATE TABLE sms.tbl_Comments_Info
(
	commentId INT,
	comment NVARCHAR(100) NULL,
	commenterAge INT NULL
)
GO
SELECT * FROM tbl_Comments_Info

/*
==============================  SECTION 03  ==============================
		          ALTER, DROP AND MODIFY TABLES & COLUMNS
==========================================================================
*/


--============== ALTER TABLE SCHEMA AND TRANSFER TO [DBO] ============--

ALTER SCHEMA dbo TRANSFER  sms.tbl_Comments_Info
GO

--============== Update column definition ============--

ALTER TABLE tbl_customer
ALTER COLUMN first_name CHAR(15) NOT NULL
GO

--============== ADD column with DEFAULT CONSTRAINT ============--

ALTER TABLE tbl_customer
ADD amount MONEY DEFAULT 0.00
GO

--============== ADD CHECK CONSTRAINT with defining name ============--

ALTER TABLE tbl_customer
ADD CONSTRAINT CK_nidValidate CHECK(nid LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
CONSTRAINT CK_phoneValidate CHECK(phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
CONSTRAINT CK_emailValidate CHECK(email LIKE '%@%' )
GO

--============== DROP COLUMN ============--

ALTER TABLE tbl_user
DROP COLUMN [complete_name]
GO

-- Clustered Index
CREATE CLUSTERED INDEX IX_tbl_user
ON tbl_user(username)
GO

-- Nonclustered Index
CREATE UNIQUE NONCLUSTERED INDEX IX_tbl_customer
ON tbl_customer(nid)
GO

/*
==============================  SECTION 05  ==============================
							 CREATE SEQUENCE
==========================================================================
*/

CREATE SEQUENCE seqencesns
	AS INT
	START WITH 10
	INCREMENT BY 10
	MINVALUE 1
	MAXVALUE 100
GO
/*
==============================  SECTION 06  ==============================
							  CREATE A VIEW
==========================================================================
*/

CREATE VIEW vShippingInfo
AS
SELECT shipping_id,reference_number,customar_name,receiver_phone,amount,received_date,status FROM tbl_shipping
GO
-- VIEW WITH ENCRYPTION, SCHEMABINDING & WITH CHECK OPTION

--View eith encryption
ALTER VIEW vShippingInfo
WITH ENCRYPTION
AS
SELECT shipping_id,reference_number,customar_name,receiver_phone,amount,received_date,status FROM tbl_shipping
GO
--View with SCHEMABINDING
ALTER VIEW vShippingInfo
WITH ENCRYPTION,SCHEMABINDING
AS
SELECT shipping_id,reference_number,customar_name,receiver_phone,amount,received_date,status FROM dbo.tbl_shipping
GO

--============================= ALTER VIEW ===============================--

ALTER VIEW vShippingInfo
AS
SELECT shipping_id,reference_number,customar_name,receiver_phone,amount,received_date,status FROM dbo.tbl_shipping
GO

/*
==============================  SECTION 07  ==============================
							 STORED PROCEDURE
==========================================================================
*/
--============== STORED PROCEDURE for insert data using parameter ============--

CREATE PROCEDURE spInsertCustomar   @customer_id int ,
									@first_name varchar(30),
									@middle_name varchar(30),
									@last_name varchar(30),
									@nid CHAR(10),
									@phone CHAR(20),
									@email VARCHAR(40),
									@address varchar(200),
									@password int,
									@countryId int,
									@cityId int,
									@postalCode NCHAR(12),
									@account_status varchar(30)
AS
INSERT INTO tbl_customer(customer_id,first_name,middle_name,last_name,
nid,phone,email,address,password,countryId,cityId,postalCode,account_status)
VALUES (@customer_id,@first_name,@middle_name,@last_name,@nid,@phone,@email,@address,
@password,@countryId,@cityId,@postalCode,@account_status)
GO

--============== STORED PROCEDURE for insert data with OUTPUT parameter ============--

CREATE PROCEDURE spInserrShippingDetails  
										  @shipping_id int,
										  @item_name varchar(30),
										  @item_details varchar(40),
										  @quantity int,
										  @amount money,
										  @details_id int output
AS
BEGIN
	INSERT INTO tbl_shipping_details(shipping_id,item_name,item_details,quantity,amount,details_id)
	VALUES (@shipping_id,@item_name,@item_details,@quantity,@amount,@details_id)
	SELECT @details_id = IDENT_CURRENT('tbl_shipping_details')
END
GO

--============== STORED PROCEDURE for UPDATE data ============--

CREATE PROCEDURE spUpdatetbl_shipping	@customer_id INT,
									@shipping_date date
AS
BEGIN
	UPDATE tbl_shipping
	SET
	shipping_date = @shipping_date
	WHERE customer_id = @customer_id
END
GO


--============== STORED PROCEDURE for DELETE Table data ============--

CREATE PROCEDURE spDeleteCustomar 	@customer_id INT
AS
BEGIN
	DELETE FROM tbl_customer
	WHERE customer_id = @customer_id
END
GO

--============== TRY CATCH IN A STORED PROCEDURE & RAISERROR WITH ERROR NUMBER AND ERROR MESSAGE ============--

CREATE PROCEDURE spRaisError
AS
BEGIN
	BEGIN TRY
		DELETE FROM tbl_customer
	END TRY
	BEGIN CATCH
		DECLARE @Error VARCHAR(200) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		RAISERROR(@Error, 1, 1)
	END CATCH
END
GO

/*
==============================  SECTION 08  ==============================
								 FUNCTION
==========================================================================
*/

--============== A SCALAR FUNCTION ============--
-- A Scalar Function to get Current Year Total TotalPayment
CREATE FUNCTION fnCurrentPaymentAmount()
RETURNS MONEY
AS
BEGIN
	DECLARE @TotalPayment MONEY

	SELECT @TotalPayment = SUM((amount))
	FROM tbl_payment
	WHERE YEAR(tbl_payment.payment_date) = YEAR(GETDATE())

	RETURN @TotalPayment
END
GO
--======================== A SIMPLE TABLE VALUED FUNCTION ==========================--
-------------------------- A Inline Table Valued Function-----------------------------
CREATE FUNCTION fnShipingDitails  (@customar_name varchar(30))
RETURNS TABLE
AS
RETURN
SELECT sp.shipping_id,sp.shipping_date,sp.customar_name,c.customer_id,
c.address,p.payment_date,p.payment_type,p.amount FROM tbl_shipping sp
inner join tbl_customer c ON c.customer_id=sp.customer_id
inner join tbl_payment p on c.customer_id=p.customer_id
WHERE @customar_name=customar_name
GO
--============== A MULTISTATEMENT TABLE VALUED FUNCTION ============--

-- Function to get monthly net sales using two parameter @year & @month
CREATE FUNCTION fnShipingWithDitails(@year int,@month int)
RETURNS @Amount TABLE
(
	[payment_id] INT,
	[reference_number] varchar(30),
	[paid_by] VARCHAR(30),
	[customar_name] varchar(30),
	[payment_date] datetime,
	[amount] MONEY,
	[payment_type] varchar(10)
)
AS
BEGIN	
	INSERT INTO @Amount
	SELECT 
	tbl_payment.payment_id,
	tbl_payment.reference_number,
	tbl_payment.paid_by,
	tbl_shipping.customar_name,
	tbl_payment.payment_date,
	tbl_payment.amount,
	tbl_payment.payment_type
	FROM tbl_payment
    inner join tbl_customer  ON tbl_customer.customer_id=tbl_payment.amount
	inner join tbl_shipping ON tbl_shipping.customer_id=tbl_customer.customer_id
	WHERE YEAR(tbl_payment.payment_date) =@year AND MONTH(tbl_payment.payment_date) = @month

	RETURN
END
GO

/*
==============================  SECTION 09  ==============================
							FOR/AFTER TRIGGER
==========================================================================
*/

-- Create trigger on Stockin table and update stock in product table
CREATE TRIGGER trStockIn
ON tblStockIn
FOR INSERT
AS
BEGIN
	DECLARE @pid INT
	DECLARE @stock INT

	SELECT
	@pid = productId,
	@stock = inserted.quantity
	FROM inserted

	UPDATE tblProduct
	SET stock = stock + @stock
	WHERE productId = @pid
	PRINT 'Stock updated via Stock Entry'
END
GO

--============== AN AFTER/FOR TRIGGER FOR INSERT, UPDATE, DELETE ============--

-- Create trigger on tblProductForInfrastructure table and update stock in product table
CREATE TRIGGER trProductStockManage
ON tblProductForInfrastructure
FOR INSERT, UPDATE, DELETE
AS
	BEGIN
		DECLARE @pid INT
		DECLARE @quantity INT
				-- Check if this trigger is executed only for updated
				IF (EXISTS(SELECT * FROM INSERTED) AND EXISTS(SELECT * FROM DELETED))
					BEGIN
						UPDATE tblProduct
						SET stock = (CASE
										WHEN i.quantity > d.quantity THEN stock - (i.quantity-d.quantity)
										WHEN i.quantity < d.quantity THEN stock + (d.quantity-i.quantity)
										ELSE i.quantity
									END)
						FROM inserted As i
						INNER JOIN deleted AS d
						ON i.productId = d.productId
						WHERE tblProduct.productId = i.productId
						PRINT 'Stock updated via modified sales entry'
					END
				--Check if this trigger is for only for inserted
				ELSE IF (EXISTS(SELECT * FROM INSERTED) AND NOT EXISTS(SELECT * FROM DELETED))
					BEGIN
						SELECT
						@pid = productId,
						@quantity =quantity
						FROM inserted

						UPDATE tblProduct
						SET stock = stock - @quantity
						WHERE productId = @pid
						PRINT 'Stock updated via new sales'
					END
				-- Check if this trigger is executed only for deleted
				ELSE IF (EXISTS(SELECT * FROM DELETED) AND NOT EXISTS(SELECT * FROM INSERTED))
					BEGIN
						SELECT
						@pid =productId,
						@quantity = quantity
						FROM deleted

						UPDATE tblProduct
						SET stock = stock + @quantity
						WHERE productId = @pid
						PRINT 'Stock updated due to deleted sales id'
					END
				-- If not match any condition then rollback the transaction
				ELSE ROLLBACK TRANSACTION
		END
GO


--============== AN INSTEAD OF TRIGGER ON VIEW ============--

CREATE TRIGGER trViewInsteadInsert
ON vShippingInfo
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO tbl_shipping(customer_id, delivery_personnel_id)
	SELECT i.customar_name, i.shipping_id FROM inserted i
END
GO

--============== ALTER TRIGGER ============--

ALTER TRIGGER trViewInsteadInsert
ON vShippingInfo
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO tbl_shipping(customer_id, delivery_personnel_id)
	SELECT i.customar_name, i.shipping_id FROM inserted i
END
GO

