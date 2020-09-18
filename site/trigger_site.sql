set SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER UPDATE_COMPUTER_TABLE_LOG
AFTER UPDATE ON PRODUCT_COMPUTER
FOR EACH ROW

BEGIN
DBMS_OUTPUT.PUT_LINE('SUCCESSFULLY DATA UPDATED IN COMPUTER TABLE');
END;
/


CREATE OR REPLACE TRIGGER UPDATE_HEAD_TABLE_LOG
AFTER UPDATE ON PRODUCT_HEADPHONES
FOR EACH ROW

BEGIN
DBMS_OUTPUT.PUT_LINE('SUCCESSFULLY DATA UPDATED IN HEADPHONES TABLE');
END;
/

CREATE OR REPLACE TRIGGER UPDATE_PRINTER_TABLE_LOG
AFTER UPDATE ON PRODUCT_PRINTER
FOR EACH ROW

BEGIN
DBMS_OUTPUT.PUT_LINE('SUCCESSFULLY DATA UPDATED IN PRINTER TABLE');
END;
/

CREATE OR REPLACE TRIGGER UPDATE_PENDRIVE_TABLE_LOG
AFTER UPDATE ON PRODUCT_PENDRIVE
FOR EACH ROW

BEGIN
DBMS_OUTPUT.PUT_LINE('SUCCESSFULLY DATA UPDATED IN PENDRIVE TABLE');
END;
/


commit;