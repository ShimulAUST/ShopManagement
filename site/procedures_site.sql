set serveroutput on;

--update quantity for product computer
create or replace procedure update_cproduct_quantity(PROD_ID IN INT,PROD_QTY IN INT)
		IS
begin

	UPDATE PRODUCT_COMPUTER SET PRODUCT_QUANTITY = PROD_QTY WHERE PRODUCT_ID_COMPUTER = PROD_ID;
	
end update_cproduct_quantity;
/
--update quantity for product headphones

create or replace procedure update_hproduct_quantity(PROD_ID1 IN INT,PROD_QTY1 IN INT)
		IS
begin

	UPDATE PRODUCT_HEADPHONES SET PRODUCT_QUANTITY = PROD_QTY1 WHERE PRODUCT_ID_HEADPHONES = PROD_ID1;
	
end update_hproduct_quantity;
/
--update quantity for product printer

create or replace procedure update_prproduct_quantity(PROD_ID2 IN INT,PROD_QTY2 IN INT)
		IS
begin

	UPDATE PRODUCT_PRINTER SET PRODUCT_QUANTITY = PROD_QTY2 WHERE PRODUCT_ID_PRINTER = PROD_ID2;
	
end update_prproduct_quantity;
/
--update quantity for product pendrive

create or replace procedure update_penproduct_quantity(PROD_ID3 IN INT,PROD_QTY3 IN INT)
		IS
begin

	UPDATE PRODUCT_PENDRIVE SET PRODUCT_QUANTITY = PROD_QTY3 WHERE PRODUCT_ID_PENDRIVE = PROD_ID3;
	
end update_penproduct_quantity;
/
commit;
