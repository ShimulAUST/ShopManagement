SET SERVEROUTPUT ON;
DECLARE
--cata is like 'COMPUTER','HEADPHONES','PRINTER' and 'PENDRIVE'
prod_cat varchar(20) := &cata;
prod_id int := &prod_id;
prod_qty int := &qty;

BEGIN
	
	if prod_cat = 'COMPUTER' THEN
		update_cproduct_quantity(prod_id,prod_qty);
	elsif prod_cat = 'HEADPHONES' THEN
		update_hproduct_quantity(prod_id,prod_qty);
	elsif prod_cat = 'PRINTER' THEN
		update_prproduct_quantity(prod_id,prod_qty);
	elsif prod_cat = 'PENDRIVE' THEN
		update_penproduct_quantity(prod_id,prod_qty);
	end if;
END;
/