SET SERVEROUTPUT ON;

DECLARE
	CATAGORY_NAME VARCHAR(30) := &catagory_name;
	CAT_ID INT ;
	not_found_catagory EXCEPTION;
	
	
	
		
BEGIN
	isSearchByCataFromSite(CATAGORY_NAME,CAT_ID);
	if CAT_ID =0 THEN 
		raise not_found_catagory;
	end if;
		DBMS_OUTPUT.PUT_LINE('FOUND IN THIS CATAGORY');
		if CAT_ID = 2000 then
			DisplayingProductsComputer;
		elsif CAT_ID = 2001 then
			DisplayingProductsHeadphones;
		elsif CAT_ID =2002 then
			DisplayingProductsPrinter;
		elsif CAT_ID = 2003 then
			DisplayingProductsPen;
		end if;
		
		
		EXCEPTION
		WHEN not_found_catagory THEN
			DBMS_OUTPUT.PUT_LINE('NOTHING FOUND IN THIS CATAGORY');
			
	
END;
/