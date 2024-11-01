/*		
					SQL Project Name : Shipping Management System(SMS)
							    Trainee Name : Md. Safikul Islam   
						    	  Trainee ID : 1281119     
							Batch ID : CS/PNTL-M/58/01 

 --------------------------------------------------------------------------------
Table of Contents: DML
			=> SECTION 01: INSERT DATA USING INSERT INTO KEYWORD
			=> SECTION 02: INSERT DATA THROUGH STORED PROCEDURE
				SUB SECTION => 2.1 : INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER 
				SUB SECTION => 2.2 : INSERT DATA USING SEQUENCE VALUE
			=> SECTION 03: UPDATE DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.1 : UPDATE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.2 : DELETE DATA THROUGH STORED PROCEDURE
			=> SECTION 04: INSERT UPDATE DELETE DATA THROUGH VIEW
				SUB SECTION => 4.1 : INSERT DATA through view
			=> SECTION 05: RETREIVE DATA USING FUNCTION(SCALAR, SIMPLE TABLE VALUED)
			=> SECTION 06: TEST TRIGGER (FOR/AFTER TRIGGER ON TABLE, INSTEAD OF TRIGGER ON TABLE & VIEW)
			=> SECTION 07: QUERY
				SUB SECTION => 7.05 : INNER JOIN WITH GROUP BY CLAUSE
				SUB SECTION => 7.06 : OUTER JOIN
				SUB SECTION => 7.07 : CROSS JOIN
				SUB SECTION => 7.08 : TOP CLAUSE WITH TIES
				SUB SECTION => 7.09 : DISTINCT
				SUB SECTION => 7.10 : COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR
				SUB SECTION => 7.11 : LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE
				SUB SECTION => 7.12 : OFFSET FETCH
				SUB SECTION => 7.13 : UNION
				SUB SECTION => 7.15 : AGGREGATE FUNCTIONS
				SUB SECTION => 7.16 : GROUP BY & HAVING CLAUSE
				SUB SECTION => 7.17 : ROLLUP & CUBE OPERATOR
				SUB SECTION => 7.18 : GROUPING SETS
				SUB SECTION => 7.19 : SUB-QUERIES (INNER, CORRELATED)
				SUB SECTION => 7.20 : EXISTS
				SUB SECTION => 7.21 : CTE
				SUB SECTION => 7.23 : BUILT IN FUNCTION
				SUB SECTION => 7.27 : WHILE
				SUB SECTION => 7.28 : GROPING FUNCTION
				SUB SECTION => 7.29 : RANKING FUNCTION
				SUB SECTION => 7.30 : IF ELSE & PRINT
				SUB SECTION => 7.31 : TRY CATCH
				SUB SECTION => 7.32 : GOTO
				SUB SECTION => 7.33 : WAITFOR
				SUB SECTION => 7.34 : sp_helptext
				
*/


/*
==============================  SECTION 01  ==============================
					INSERT DATA USING INSERT INTO KEYWORD
==========================================================================
*/

USE SMS
GO

INSERT INTO country VALUES('Bangladesh'),('India'),('Pakistan'),('China'),('Japan'),('Indonesia'),('Malaysia'),('Qatar')
GO
SELECT * FROM country
GO

INSERT INTO city VALUES('Dhaka'),('Gazipur'),('Faridpur'),('Gopalganj'),('Madaripur'),('Manikganj'),('Munshiganj'),('Narayanganj'),('Narsingdi'),('Rajbari'),('Tangail'),('Feni')
GO
SELECT * FROM city
GO

INSERT INTO tbl_customer (first_name,middle_name,last_name,nid,phone,
email,address,password,countryId,cityId,postalCode,account_status) VALUES 
('Md','Zintu','Mia','5124636586','01745789632','zintu@gmail.com',NULL,124536,1,1,NULL,'Active'),
('Md','Jangir','Mia','5124636587','01745789633','Jangir@gmail.com',NULL,124536,1,2,NULL,'Active'),
('Md','Rahat','Khan','5124636588','01745789634','rahat@gmail.com',NULL,325465,1,3,NULL,'Inactive'),
('Md','Helal','Uddin','5124636590','01745789636','helal@gmail.com',NULL,3254875,1,4,NULL,'Active'),
('Md','Rahman','Mia','5124636594','01745789640','rahman@gmail.com',NULL,952145,1,5,NULL,'Active'),
('Miss','Zinat','Ara','5124636599','01745789650','zinat@gmail.com',NULL,5284516,1,6,NULL,'Inactive'),
('Md','Samsu','Islam','5124636600','01745789660','samsu@gmail.com',NULL,214536,1,7,NULL,'Active'),
('Md','Rifat','Islam','5124636601','01745789670','r@gmail.com',NULL,214565,1,8,NULL,'Active'),
('Md','Sakil','Islam','5124636602','01745789680','sa@gmail.com',NULL,214362,1,9,NULL,'Active'),
('Md','Radika','Islam','5124636605','01745789690','radika@gmail.com',NULL,225536,1,10,NULL,'Active')
GO
SELECT * FROM tbl_customer
GO
INSERT INTO tbl_delivery_personnel (delivery_personnel_id,first_name,middle_name,last_name,
contact,email_address,username,password) VALUES 
(1,'Md','Noman','Khan',01758425698,'noman@gmail.com','Noman',3652845),
(2,'Md','Jana','Khan',01658425698,'jana@gmail.com','Jana',213542),
(3,'Md','Jamal','Mia',01858425698,'jamal@gmail.com','Jamal',3552845),
(4,'Md','Sahin','Islam',01958425698,'sahin@gmail.com','Sahin',3755445),
(5,'Mr','Rashed','Khan',01558425698,'rashed@gmail.com','Rashed',3625417),
(6,'Md','Nantu','Sardar',01778425698,'nantu@gmail.com','Nantu',965424)
GO
SELECT * FROM tbl_delivery_personnel
GO
INSERT INTO tbl_shipping (reference_number,shipping_date,customar_name,receiver_phone,
customer_id,received_date,amount,status,delivery_personnel_id,proof_of_transaction) VALUES 
(123,'2023-12-01','Md Zintu Khan','01752845699',1,'2023-12-01',1500.00,'Delivered',1,null),
(521,'2023-12-08','Md Rahat Khan','01325468599',2,'2023-12-09',2000.00,'Delivered',2,null),
(527,'2024-01-01','Md Helal','01654845699',3,'2024-01-01',1200.00,'Delivered',3,null),
(580,'2024-01-04','Rahman Mia','01954845699',4,'2024-01-06',3000.00,'Delivered',1,null),
(748,'2023-12-28','Samsu Islam','01552845699',5,'2023-12-30',1000.00,'Delivered',4,null),
(854,'2023-12-31','Rifat Islam','01752845444',6,'2023-12-31',2500.00,'Delivered',6,null),
(888,'2024-01-01','Radika Islam','01748592613',7,'2024-01-01',2500.00,'Delivered',5,null)
GO
SELECT * FROM tbl_shipping
GO
INSERT INTO tbl_shipping_details (details_id,shipping_id,item_name,item_details,quantity,amount) VALUES 
(1,21,'items','XYZ',2,1500.00),
(2,22,'items','RTE',3,7000.00),
(3,23,'items','GTR',1,1000.00),
(4,24,'items','HGT',5,2500.00),
(5,25,'items','BGY',1,8000.00)
GO
SELECT * FROM tbl_shipping_details
GO
INSERT INTO tbl_payment (payment_id,reference_number,paid_by,customer_id,payment_date,amount,payment_type) VALUES
(1,123,'Zintu',7,'2023-12-01',1500.00,'Cash'),
(2,521,'Rahat',8,'2024-01-04',3000.00,'Check'),
(3,527,'Helal',9,'2024-01-01',1000.00,'Cash'),
(4,580,'Rahman',10,'2024-01-06',2500.00,'others')
GO
SELECT * FROM tbl_payment
GO
INSERT INTO tbl_user (user_id,username,password,address,contact_number) VALUES
(1,'Miraz',369852,'Dhaka',0175845698),
(2,'Kabir',958452,'Rajshahi',0195845698),
(3,'Zia',124587,'Khulna',0155845698),
(4,'Rayhan',369541,'Bairsal',0165845698),
(5,'Mirza',362541,'Dhaka',01785416893)
GO
SELECT * FROM tbl_user
GO
INSERT INTO tblProduct(productName, unitPrice) VALUES
('Computer Table', 1700.00),
('Chair', 2500.00),
('Mouse', 450.00),
('Keyboard', 680.00),
('Headphone', 1450.00),
('Multiplug', 800.00),
('Light', 230.00),
('Projector', 7900.00),
('Air Condition', 26000.00),
('Router', 1700.00),
('Hub', 900.00),
('Switch', 1450.00),
('Telephone', 3500.00),
('Mousepad', 100.00)
GO
SELECT * FROM tblProduct
GO
INSERT INTO tblStockIn(productId,quantity) VALUES
(1, 56),
(2, 17),
(3, 11),
(4, 14),
(5, 17),
(6, 12),
(7, 17),
(8, 26),
(9, 17),
(10, 12),
(11, 17),
(12, 12),
(13, 17),
(14, 28)
GO
SELECT * FROM tblStockIn
GO

INSERT INTO tblProductForInfrastructure(productId, quantity) VALUES
(1, 25),
(5, 17),
(4, 13),
(2, 27),
(3, 29),
(6, 62)
GO
SELECT * FROM tblProductForInfrastructure
GO
INSERT INTO sms.tbl_Comments_Info VALUES
(2, 'Great', 25),
(4, 'Bad', 27),
(5, 'Good', 16),
(9, 'Try Again', 21)
GO
SELECT * FROM sms.tbl_Comments_Info

--============== INSERT DATA USING SEQUENCE VALUE ============--

INSERT INTO tblComments VALUES((NEXT VALUE FOR seqencesns), NULL)
GO
SELECT * FROM tblComments
GO


/*
==============================  SECTION 03  ==============================
			UPDATE DELETE DATA THROUGH STORED PROCEDURE
==========================================================================
*/


--============== UPDATE DATA THROUGH STORED PROCEDURE ============--

-- STORED PROCEDURE for update tbl_shipping
EXEC spUpdatetbl_shipping 7,'2024-01-01'   
EXEC spUpdatetbl_shipping 8,'2024-01-02'
EXEC spUpdatetbl_shipping 9,'2024-01-03'   

GO
SELECT * FROM tbl_shipping
GO


/*
==============================  SECTION 05  ==============================
						RETREIVE DATA USING FUNCTION
==========================================================================
*/

-- A Scalar Function to get monthly total Amount using two parameter @year & @month
SELECT dbo.fnCurrentPaymentAmount() AS 'Currrent Year Amount'
GO

/*
==============================  SECTION 06  ==============================
							   TEST TRIGGER
==========================================================================
*/
--============== FOR/AFTER TRIGGER ON TABLE ============--

-- EX - 01
-- INSERT DATA IN Stockin TABLE and AUTOMATICALLY UPDATE STOCK IN Prodcut TABLE

SELECT * FROM tblProduct
SELECT * FROM tblStockIn

INSERT INTO tblStockIn(productId,quantity) VALUES (4, 12)
GO

SELECT * FROM tblProduct
SELECT * FROM tblStockIn
GO

-- EX - 02
-- INSERT DATA ON tblProductForInfrastructure TABLE and AUTOMATICALLY UPDATE STOCK IN Prodcut TABLE

SELECT * FROM tblProduct
SELECT * FROM tblProductForInfrastructure

INSERT INTO tblProductForInfrastructure(productId, quantity) VALUES(4, 5)

SELECT * FROM tblProduct
SELECT * FROM tblProductForInfrastructure
GO

/*
==============================  SECTION 07  ==============================
								  QUERY
==========================================================================
*/

--============== 7.05 INNER JOIN WITH GROUP BY CLAUSE ============--

-- GET SEMESTERWISE TRAINEE LIST
SELECT sp.shipping_id,c.customer_id,sp.shipping_date,sp.customar_name,
c.address,p.payment_date,p.payment_type,p.amount FROM tbl_shipping sp
inner join tbl_customer c ON c.customer_id=sp.customer_id
inner join tbl_payment p on c.customer_id=p.customer_id
GO

--============== 7.06 OUTER JOIN ============--

SELECT * FROM tbl_customer c
LEFT JOIN tbl_shipping sp on c.customer_id=sp.customer_id
RIGHT JOIN tbl_payment p ON c.customer_id=p.customer_id

--============== 7.07 CROSS JOIN ============--

SELECT * FROM tbl_customer c
CROSS JOIN tbl_payment
GO

--============== 7.08 TOP CLAUSE WITH TIES ============--

SELECT TOP 5 WITH TIES tbl_customer.customer_id,phone FROM tbl_customer
INNER JOIN tbl_payment ON tbl_customer.customer_id = tbl_payment.customer_id
ORDER BY customer_id
GO

--============== 7.10 COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR ============--

SELECT * FROM tbl_shipping
WHERE shipping_date BETWEEN '2023-12-01' AND '2024-01-06'
AND reference_number  = 121
OR reference_number = 123
GO

--============== 7.11 LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE ============--

SELECT * FROM tbl_shipping
WHERE customar_name LIKE '%n'
AND reference_number NOT IN (121)
AND  proof_of_transaction IS NULL
GO

--============== 7.12 OFFSET FETCH ============--

-- OFFSET 5 ROWS
SELECT * FROM tbl_customer
ORDER BY customer_id
OFFSET 5 ROWS
GO

-- OFFSET 10 ROWS AND GET NEXT 5 ROWS

SELECT * FROM tblProduct
ORDER BY productId
OFFSET 10 ROWS
FETCH NEXT 5 ROWS ONLY
GO

--============== 7.13 UNION ============--

SELECT * FROM tblProduct
WHERE productId IN ('1', '2', '3')

UNION

SELECT * FROM tblProduct
WHERE productId IN ('4', '5', '6')
GO

--============== 7.15 AGGREGATE FUNCTION ============--

SELECT	COUNT(*) 'Total Sales Count',
		SUM(amount) 'Total amount',
		AVG(amount) 'Average amount',
		MIN(amount) 'MIN amount'
FROM tbl_payment
GO

--============== 7.16 AGGREGATE FUNCTION WITH GROUP BY & HAVING CLAUSE ============--

SELECT tbl_payment.payment_id, count(tbl_payment.customer_id) Total, SUM(amount) 'NET AMOINT' FROM tbl_payment
INNER JOIN tbl_customer ON tbl_customer.customer_id=tbl_payment.customer_id
GROUP BY tbl_payment.payment_id
HAVING SUM(amount) > 1200
GO
--============== 7.17 ROLLUP & CUBE OPERATOR ============--

--ROLLUP

SELECT c.customer_id,p.payment_date, sum(tbl_shipping.amount) Amount FROM tbl_shipping 
inner join tbl_customer c ON c.customer_id=tbl_shipping.customer_id
inner join tbl_payment p on c.customer_id=p.customer_id
GROUP BY ROLLUP (c.customer_id,p.payment_date)
ORDER BY c.customer_id DESC,p.payment_date DESC

GO

-- CUBE
SELECT c.customer_id,p.payment_date, sum(tbl_shipping.amount) 'Total Amount' FROM tbl_shipping 
inner join tbl_customer c ON c.customer_id=tbl_shipping.customer_id
inner join tbl_payment p on c.customer_id=p.customer_id
GROUP BY CUBE (c.customer_id,p.payment_date)
ORDER BY c.customer_id DESC,p.payment_date DESC
GO

--============== 7.18 GROUPING SETS ============--

SELECT c.customer_id,p.payment_date, sum(tbl_shipping.amount) 'Total Amount' FROM tbl_shipping 
inner join tbl_customer c ON c.customer_id=tbl_shipping.customer_id
inner join tbl_payment p on c.customer_id=p.customer_id
GROUP BY GROUPING SETS (c.customer_id,p.payment_date)
ORDER BY c.customer_id DESC,p.payment_date DESC
GO

--============== 7.19 SUB-QUERIES============--

--A subquery to findout tbl_customer who have not enrolled yet

SELECT nid,phone,address FROM tbl_customer
WHERE customer_id NOT IN (SELECT customer_id FROM tbl_payment)
ORDER BY nid
GO

GO

--============== 7.20 EXISTS ============--

SELECT nid,phone,address FROM tbl_customer
WHERE NOT EXISTS (SELECT * FROM tbl_payment 
WHERE tbl_payment.customer_id= tbl_customer.customer_id)
GO

--============== 7.21 CTE ============--

-- A CTE TO GET MAXIMUM SALES COURSE
WITH shipping AS
(
SELECT sp.customar_name, count(sp.shipping_id) TotalShiping FROM tbl_shipping sp
INNER JOIN tbl_shipping_details spd ON sp.shipping_id=spd.shipping_id
GROUP BY sp.customar_name
)
SELECT customar_name, TotalShiping from shipping
WHERE TotalShiping = (SELECT MAX(TotalShiping) FROM shipping)
GO

--============== 7.22 MERGE ============--

SELECT * FROM tblComments
SELECT * FROM sms.tbl_Comments_Info
GO

MERGE sms.tbl_Comments_Info AS SOURCE
USING tblComments AS TARGET
ON SOURCE.commentId = TARGET.commentId
WHEN MATCHED THEN
				UPDATE SET
				commentId = SOURCE.commentId,
				comment = SOURCE.comment;

--============== 7.23 BUILT IN FUNCTION ============--

-- Get current date and time
SELECT GETDATE()
GO

-- GET STRING LENGTH
SELECT customer_id, LEN([middle_name]) 'Name Length' FROM tbl_customer
GO

-- CONVERT DATA USING CAST()
SELECT CAST(1500 AS decimal(17,2)) AS DecimalNumber
GO

-- CONVERT DATA USING CONVERT()
DECLARE @currTime DATETIME = GETDATE()
SELECT CONVERT(VARCHAR, @currTime, 108) AS ConvertToTime
GO

-- CONVERT DATA USING TRY_CONVERT()
SELECT TRY_CONVERT(FLOAT, 'HELLO', 1) AS ReturnNull
GO

-- GET DIFFERENCE OF DATES
SELECT DATEDIFF(DAY, '2021-01-01', '2022-01-01') AS DAYinYear
GO

-- GET A MONTH NAME
SELECT DATENAME(MONTH, GETDATE()) AS 'Month'
GO

--============== 7.27 WHILE ============--

	DECLARE @counter int
	SET @counter = 0

	WHILE @counter < 20

	BEGIN
	  SET @counter = @counter + 1
	  INSERT INTO tblComments(commentId, comment) VALUES((NEXT VALUE FOR [dbo].seqencesns), NULL)
	END

	SELECT * FROM tblComments
GO

--============== 7.29 RANKING FUNCTION ============--

SELECT 
RANK() OVER(ORDER BY shipping_id) AS 'Rank',
DENSE_RANK() OVER(ORDER BY customer_id) AS 'Dense_Rank',
NTILE(3) OVER(ORDER BY amount) AS 'NTILE',
shipping_id,
customer_id, 
amount
FROM tbl_shipping
GO

--============== 7.30 IF ELSE & PRINT ============--

DECLARE @totalamount MONEY
SELECT @totalamount = SUM((amount))
FROM tbl_payment
WHERE YEAR(tbl_payment.payment_id) = YEAR(GETDATE())
IF @totalamount > 1500
	BEGIN
		PRINT 'Great ! The amount is greater than target in this year !!'
	END
ELSE
	BEGIN
		PRINT 'Didn''t Reached the goal !'
	END
GO

--============== 7.31 TRY CATCH ============--

BEGIN TRY
	DELETE FROM tbl_user
	PRINT 'SUCCESSFULLY DELETED'
END TRY

BEGIN CATCH
		DECLARE @Error VARCHAR(200) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		PRINT (@Error)
END CATCH
GO

--============== 7.32 GOTO ============--

DECLARE @value INT
SET @value = 0

WHILE @value <= 10
	BEGIN
	   IF @value = 2
		  GOTO printMsg
	   SET @value = @value + 1

	   	IF @value = 9
		  GOTO printMsg2
	   SET @value = @value + 1
	END
printMsg:
   PRINT 'Crossed Value 2'
printMsg2:
   PRINT 'Crossed Value 9'
GO

--============== 7.33 WAITFOR ============--

PRINT 'HELLO'
WAITFOR DELAY '00:00:03'
PRINT 'GOOD LUCK'
GO

--============== 7.34 SYSTEM STORED PROCEDURE(sp_helptext) TO GET UNENCRYPTED STORED PROCEDURE SCRIPT  ============--

EXEC sp_helptext spInsertCustomar
GO