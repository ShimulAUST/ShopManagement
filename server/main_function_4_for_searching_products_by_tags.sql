SET SERVEROUTPUT ON;

DECLARE
	TAG VARCHAR(10) := &tag;
	PROD_NAME VARCHAR(100);
	PROD_QTY INT ;
	CNT NUMBER;
	not_found_tag EXCEPTION;
		
BEGIN

	select  ((SELECT COUNT(*) FROM PRODUCT_COMPUTER@site_link WHERE (PRODUCT_TAG1 = tag OR PRODUCT_TAG2 = tag OR PRODUCT_TAG3 =tag ))
	+ (SELECT COUNT(*) FROM PRODUCT_HEADPHONES@site_link WHERE (PRODUCT_TAG1 = tag OR PRODUCT_TAG2 = tag OR PRODUCT_TAG3 =tag ))
	+ (SELECT COUNT(*) FROM PRODUCT_PRINTER@site_link WHERE (PRODUCT_TAG1 = tag OR PRODUCT_TAG2 = tag OR PRODUCT_TAG3 =tag ))
	+ (SELECT COUNT(*) FROM PRODUCT_PENDRIVE@site_link WHERE (PRODUCT_TAG1 = tag OR PRODUCT_TAG2 = tag OR PRODUCT_TAG3 =tag ))) AS TOTAL into CNT FROM DUAL;
	
	if CNT = 0 THEN
		raise not_found_tag;
	END IF;
	
	for i in ((SELECT * FROM PRODUCT_COMPUTER@site_link WHERE (PRODUCT_TAG1 = TAG OR PRODUCT_TAG2 = TAG OR PRODUCT_TAG3 =TAG ))
	UNION (SELECT * FROM PRODUCT_HEADPHONES@site_link WHERE (PRODUCT_TAG1 = TAG OR PRODUCT_TAG2 = TAG OR PRODUCT_TAG3 =TAG ))
	UNION (SELECT * FROM PRODUCT_PRINTER@site_link WHERE (PRODUCT_TAG1 = TAG OR PRODUCT_TAG2 = TAG OR PRODUCT_TAG3 =TAG ))
	UNION (SELECT * FROM PRODUCT_PENDRIVE@site_link WHERE (PRODUCT_TAG1 = TAG OR PRODUCT_TAG2 = TAG OR PRODUCT_TAG3 =TAG )))LOOP
	PROD_NAME := i.PRODUCT_NAME;
	
	DBMS_OUTPUT.PUT_LINE(PROD_NAME||I.PRODUCT_QUANTITY);
	END LOOP;
	
	EXCEPTION
		WHEN not_found_tag THEN
			DBMS_OUTPUT.PUT_LINE('Nothing Matched with this tag');
		
END;
/

	
	