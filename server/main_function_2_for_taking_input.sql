SET SERVEROUTPUT ON;

DECLARE
	EMP_ID EMPLOYER.EMPLOYER_ID%TYPE;
	CT_EMAIL CUSTOMER.CUSTOMER_EMAIL%TYPE;
	CID CUSTOMER.CUSTOMER_ID%TYPE;
	CT_ID CUSTOMER.CUSTOMER_ID%TYPE;
	EM_ID EMPLOYER.EMPLOYER_ID%TYPE :=500;
	EMAIL CUSTOMER.CUSTOMER_EMAIL%TYPE :=&customer_email;
	PHONE CUSTOMER.CUSTOMER_PHONENO%TYPE:=&customer_phone;
	ADDRESS CUSTOMER.CUSTOMER_ADDRESS%TYPE :=&customer_address;
	PROD_NAME BUYING_DETAILS.PURCHASE_PRODUCT%TYPE:=&product_name;
	QTY BUYING_DETAILS.PURCHASE_QUANTITY%TYPE:=&qty;
	PRICE BUYING_DETAILS.PURCHASE_PRICE%TYPE :=&price;
	CNTT INT :=0;
	PR_ID INT :=0 ;

BEGIN
	
	select  ((SELECT COUNT(*) FROM PRODUCT_COMPUTER@site_link WHERE (PRODUCT_NAME = PROD_NAME))
	+ (SELECT COUNT(*) FROM PRODUCT_HEADPHONES@site_link WHERE (PRODUCT_NAME = PROD_NAME ))
	+ (SELECT COUNT(*) FROM PRODUCT_PRINTER@site_link WHERE (PRODUCT_NAME = PROD_NAME ))
	+ (SELECT COUNT(*) FROM PRODUCT_PENDRIVE@site_link WHERE (PRODUCT_NAME = PROD_NAME))) into CNTT FROM DUAL; 
	DBMS_OUTPUT.PUT_LINE(CNTT);
	select (SELECT PRODUCT_CATAGORY_ID  FROM PRODUCT_COMPUTER@site_link WHERE PRODUCT_NAME = PROD_NAME
	UNION SELECT PRODUCT_CATAGORY_ID  FROM PRODUCT_HEADPHONES@site_link WHERE PRODUCT_NAME = PROD_NAME
	UNION SELECT PRODUCT_CATAGORY_ID  FROM PRODUCT_PRINTER@site_link WHERE PRODUCT_NAME = PROD_NAME
	UNION SELECT PRODUCT_CATAGORY_ID  FROM PRODUCT_PENDRIVE@site_link WHERE PRODUCT_NAME = PROD_NAME) INTO PR_ID from dual;
	DBMS_OUTPUT.PUT_LINE(PR_ID);
	IF CNTT > 0 THEN
	--Function for employer login
		isCreateCustomer(EM_ID,EMAIL,PHONE,ADDRESS,EMP_ID,CT_EMAIL);
		SELECT CUSTOMER_ID INTO CID FROM CUSTOMER WHERE CUSTOMER_EMAIL = CT_EMAIL;
		CT_ID :=CID;
		DBMS_OUTPUT.PUT_LINE(CT_ID);
		isCreateBuyingDetails(EMP_ID,CT_ID,PROD_NAME,QTY,PRICE,PR_ID);
		
	ELSE 
		DBMS_OUTPUT.PUT_LINE('NOTHING FOUND IN THIS NAME PRODUCT');
	END IF;
END;
/